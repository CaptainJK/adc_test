
#include "ch.h"
#include "hal.h"
#include "usbcfg.h"
#include "usbcom.h"
#include <string.h>
#include <hal_adc_lld.h>

#define SMP_TIME ADC_SAMPLE_1P5
#define CH_SEL ADC_CHANNEL_IN0

/*
 * Single channel conversion time: Tconv_1 = (Sampling time + 12.5) / f_adc
 *  Tconv_1 = (1.5 + 12.5) / 12000000 = 1.17us (857.14kHz)
 */

thread_reference_t usb_tx_trp;
int tx_num = 0;

adccallback_t adc_cb (ADCDriver *adcp, adcsample_t *buffer, size_t n) {
    chSysLockFromISR();

    tx_num = n * sizeof(adcsample_t) * adcp->grpp->num_channels;
    chThdResumeI(&usb_tx_trp, (msg_t) buffer);

    chSysUnlockFromISR();
}

ADCConversionGroup adc_cg = {
        .circular = true,
        .num_channels = 1,
        .error_cb = NULL,
        .end_cb = (void *) adc_cb,
        .cr1 = 0,
        .cr2 = 0,
        .smpr1 = 0,
        .smpr2 = ADC_SMPR2_SMP_AN0(SMP_TIME) |
                 ADC_SMPR2_SMP_AN1(SMP_TIME) |
                 ADC_SMPR2_SMP_AN2(SMP_TIME) |
                 ADC_SMPR2_SMP_AN3(SMP_TIME) |
                 ADC_SMPR2_SMP_AN4(SMP_TIME),
        .sqr1 = ADC_SQR1_NUM_CH(1),
        .sqr2 = 0,
        .sqr3 = ADC_SQR3_SQ1_N(CH_SEL)
};

static THD_WORKING_AREA(ws_usb_write, 1024);
static THD_FUNCTION(usb_write, arg) {
    (void) arg;
    msg_t msg;
    while (true) {
        chSysLock();
        msg = chThdSuspendS(&usb_tx_trp);
        chSysUnlock();

        if (USBD1.state == USB_ACTIVE)
            chnWriteTimeout(&SDU1, (unsigned char *) msg, tx_num, MS2ST(4));
    }
}

adcsample_t buff[256];
int main() {
    halInit();
    chSysInit();

    chThdCreateStatic(ws_usb_write, 1024, NORMALPRIO, usb_write, NULL);
    adcStartConversion(&ADCD1, &adc_cg, buff, sizeof(buff) / sizeof(adcsample_t));

    while (true) {
        chThdSleepMilliseconds(300);
        palToggleLine(LINE_LED);
    }
}