# ADF4351 - BLUEPILL edition

SO2A STM32duino fork of https://github.com/olgierd/ADF4351

![front](/adf_2.4GHz.jpeg)

## Usage

Check code. Use serial shortcuts to edit frequency, or adjust the follwing line in the code:

```
unsigned long long frequency = 2400000000; // 2.4GHz
```

## Pinout connection

(warning: see note for cheaper smaller boards!)

```
ADF4351 <=> BluePill STM32Fxx
   DATA <=> PA7
   CLK  <=> PA5
    LE  <=> PA4 
  3.3V  <=> 3.3V
   GND  <=> GND

Serial USB adapter <=> BluePill STM32Fxx
   RX <=> PA9   (TX)
   TX <=> PA10  (RX)
   GND <=> GND
```

## Cheap boards from Ali may have pin description swapped

On some boards, pins labels are swapped:

    - Pin labaled "DATA" is actually CLK
    - Pin labeled "CLK" is actually LE
    - Pin labeled "LE" is actually DATA

# Upstream Readme follows:

Code to control your ADF4351 board using Arduino. Written from scratch using official datasheet.

## Pinout

* Arduino pin #13 <-> `CLK`
* Arduino pin #11 <-> `DATA`
* Arduino pin #9 <-> `LE`


1. Use voltage dividers, ADF runs on 3.3V supply.
2. You can change `LE` pin assignment to any other IO pin.

## Keyboard

* `x/c` -/+ 10 Hz
* `s/d` -/+ 100 Hz
* `w/e` -/+ 1 kHz
* `2/3` -/+ 10 kHz
* `1/4` -/+ 100 kHz
* `5/6` -/+ 10 MHz
* `/` toggle RF output
* `+` increase RF power

## Modifications

`#define REF_CLK 25000000` - if you're using custom reference frequency, set it here

`uint8_t slave_select_pin = 9;` - this pin can be set to any other IO you like

`unsigned long long frequency = 1000000000;` that's a default frequency after power on

Set those two variables if you'd like to use this code for non-interactive operation (eg. LO for an upconverter):

`uint8_t rf_ena = 1; // 0 - output disabled`

`uint8_t out_pwr = 0; // 0 - min, 3 - max`

You can modify value of `r_counter` and `clock_divider` according to your needs. Decreasing step resolution will result in smaller phase noise.

Even when `rf_ena` is set to `0`, the PLL is running and you can expect more than -50 dBm of signal at the output.

## QO-100

I'm using this code to directly generate CW on QO-100, so the serial port output shows the downlink frequency (+10489000 kHz) in brackets:

`FREQ: 2400060100 ( 560.50 )`
