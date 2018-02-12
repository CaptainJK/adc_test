//
// Created by captain on 07.01.18.
//

#ifndef ESC_USBCOM_H
#define ESC_USBCOM_H

void USBCommInit (char *tx_buffer, char *rx_buffer);
void USBSendFromISR (unsigned n_bytes);

#endif //ESC_USBCOM_H
