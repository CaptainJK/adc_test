//
// Created by captain on 07.01.18.
//

#include "hal.h"
#include "ch.h"
#include "usbcfg.h"
#include "usbcom.h"
#include <string.h>

static thread_reference_t trp;
static THD_WORKING_AREA(ws_usb_write, 1024);
static THD_FUNCTION(usb_write, arg) {
    msg_t msg;

    while (true) {
        chSysLock();
        msg = chThdSuspendS(&trp);
        chSysUnlock();

        chnWriteTimeout(&SDU1, arg, msg, MS2ST(4));
    }
}

static char buf[256];
static THD_WORKING_AREA(ws_usb_read, 1024);
static THD_FUNCTION(usb_read, arg) {
    char len;

    while (true) {
        if (USBD1.state == USB_ACTIVE) {
            while (chnGetTimeout(&SDU1, TIME_INFINITE) != 0xAA);
            if (chnGetTimeout(&SDU1, TIME_INFINITE) == 0xAA) {
                len = chnGetTimeout(&SDU1, TIME_INFINITE);
                if (chnReadTimeout(&SDU1, buf, len, MS2ST(300)) == len) {
                    memcpy(arg, buf, len);
                }
            }
        }
        else chThdSleepMilliseconds(200);
    }
}

void USBCommInit (char *tx_buffer, char *rx_buffer) {
    chThdCreateStatic(ws_usb_write, 1024, NORMALPRIO, usb_write, tx_buffer);
    chThdCreateStatic(ws_usb_read, 1024, NORMALPRIO, usb_read, rx_buffer);
}

void USBSendFromISR (unsigned n_bytes) {
    chSysLockFromISR();

    chThdResumeI(&trp, n_bytes);

    chSysUnlockFromISR();
}
