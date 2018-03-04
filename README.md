# SDR_FM_Radio

[![npm](https://img.shields.io/npm/l/express.svg)](https://github.com/MeowLucian/SDR_FM_Radio/blob/master/LICENSE)

Using Software Designed Radio to transmit & receive FM signal.

Transmitter and Receiver hardware : Zedboard (Xilinx Zynq®-7000) + AD9361 (Analog Device-FMCOMMS3)

![Hardware](https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/Hardware.jpg)

# Software needed :

* Matlab R2017b
* support package for Xilinx Zynq-Based Radio (R2017b version)

Before executing this code, please follow this [tutorial](https://www.mathworks.com/help/supportpkg/xilinxzynqbasedradio/ug/install-support-package-for-xilinx-zynq-based-radio.html) to install support package for Xilinx Zynq-Based Radio in Matlab.

# Simulink Diagram :

Open `FM_radio_TX.slx` Simulink model.

Double click `From Multimedia File` block and edit the path to import the example music files.

Run `FM_radio_TX.slx` to transmit FM signal.

![GUI_TX_Simulink_Block_Diagram.png](https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Block_Diagram.png)

# GUI :

## Transmitter (Zedboard + AD9361)

* Center Frequency Setting

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Center_Frequency_Change.png" width="500">

* Music Time Scope

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Time_Scope.png" width="500">

* FM TX Signal Spectrum

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Spectrum_Analyzer.png" width="500">

## Receiver (Zedboard + AD9361)

Run `FM_radio_RX.m` to receive FM signal.

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_RX.png" width="500">

## Receiver (Mobile Phone)

Run FM app in your mobile phone

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/Mobile_FM_App_Screenshot.jpg" width="500">

# Signal Parameters

| Center Frequency                   | 100 MHz                          |
|:----------------------------------:|:--------------------------------:|
| Sample Rate (Bandwidth)            | 960 KHz                          |
| Frequency Deviation                | 75  KHz                          |
| Pre-emphasis Filter Time Constant  | 7.5e-5 s                         |
| Audio Sample Rate                  | 48 KHz                           |
| PC Host IP address                 | 192.168.3.1                      |
| TX IP address                      | 192.168.3.2                      |

# Things to try yourself :

* Turn the switch to change the music.

* Change the carrier frequency.

* Import your own music (Notice : audio sample rate must be 48000 Hz in this example)
