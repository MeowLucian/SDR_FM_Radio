# SDR_FM_Radio

[![npm](https://img.shields.io/npm/l/express.svg)](https://github.com/MeowLucian/SDR_FM_Radio/blob/master/LICENSE)

Using Software Designed Radio to transmit & receive FM signal.

Transmitter and Receiver hardware : Zedboard (Xilinx Zynq®-7000) + AD9361 (Analog Device-FMCOMMS3)

![Hardware](https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/Hardware.jpg)

# Software needed :

* Matlab R2017b
* support package for Xilinx Zynq-Based Radio (R2017b version)

Before executing this code, please follow this [tutorial](https://www.mathworks.com/help/supportpkg/xilinxzynqbasedradio/ug/install-support-package-for-xilinx-zynq-based-radio.html) to install support package for Xilinx Zynq-Based Radio in Matlab.

# Simulink Structure :

Double click `From Multimedia File` block and edit the path to import the example music files.

Run `FM_radio_TX.slx` to transmit FM signal.

![GUI_TX_Simulink_Block_Diagram.png](https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Block_Diagram.png)

# GUI :

* Music_Time_Scope

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Time_Scope.png" width="500">

* FM_TX_Sugnal_Spectrum

<img src="https://raw.githubusercontent.com/MeowLucian/SDR_FM_Radio/master/Image/GUI_TX_Simulink_Spectrum_Analyzer.png" width="500">

