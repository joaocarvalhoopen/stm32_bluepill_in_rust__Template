# STM32 BluePill in Rust - Project template
The updated project template that I use for STM32 BluePill micro-controller in Rust for Linux Ubuntu 20.04 .

## BluePill STM32F103 - Development board

This is my starting point to make a project with the BluePill in Rust. It was made by following the following 3 github repository notes and files and modifying them to update them, following video playlist and the 2 free books of embedded Rust. Those modifications take care of my present needs in term of STM32 BluePill development in Rust<br>
<br>

![The STM32 BluePill diagram](./BluePillPinout.jpg)

## Specifications:

* STM32F103C8T6 ARM Cortex M3
* 72MHz, 90 DMIPS / 1.25 DMIPS / MHz
* 2.0V - 3.6V operating voltage
* 8MHz system crystal
* 32.768KHz RTC crystal
* 2.54mm pitch pins
* JTAG/SWD header
* 64 KByte Flash, 20 KByte SRAM
* 2x SPI, 3x USART, 2x I2C, 1x CAN
* 38 I/Os almost all 5V-tolerant
* 1x USB 2.0 FS
* 2x ADC (12-bit / 16-channel)
* 3x general timers, 1x advanced timer
* RT9193 3.3V LDO voltage regulator, max current 300mA
* Micro USB for power and data
* Blue user LED (PC13)
* 2x jumpers for bootloader selection
* Reset button
* 2x20 side pins + 1x4 SWD pins
* Dimensions: 53.0mm x 22.5mm


## IMPORTANT note

```
  While programming with the ST-Link_V2 dongle, don't have another USB cable
  connected to the Micro USB plug.

  MAX Absolute 150 mA total source/sink for entire Micro-controller.
  
  MAX 20 mA per pin, 8 mA recommended.
  
  There are pins that are 5 V tolerant but there are many that are not,
  see the diagrams of the chip and the specifications on the data chip.

  The max current at 3.3 V is not equal in all the pins, 
     PC13, PC14 e PC15 are weaker pins Source 0 mA e sink 3 mA max 2 MHz e max 30 pF.
```


## Connecting the STM32 Blue Pill to ST-Link V2 USB Debugger

```
STM32 Blue Pill        ST-Link V2 USB Debugger
V3      [Red]         3.3V     (Pin 8)
IO      [Orange]      SWDIO    (Pin 4)
CLK     [Brown]       SWDCLK   (Pin 2)
GND     [Black]       GND      (Pin 6)
```


## Good references

1. **Crate stm32f1xx-hal in Rust** <br>
   [https://github.com/stm32-rs/stm32f1xx-hal](https://github.com/stm32-rs/stm32f1xx-hal)

2. **stm32-rs - stm32f1xx-hal - Examples** <br>
   [https://github.com/stm32-rs/stm32f1xx-hal/tree/master/examples](https://github.com/stm32-rs/stm32f1xx-hal/tree/master/examples)

3. **stm32f1xx_hal Documentation version 0.8** <br>
   [https://docs.rs/stm32f1xx-hal/0.8.0/stm32f1xx_hal/](https://docs.rs/stm32f1xx-hal/0.8.0/stm32f1xx_hal/)

4. **Crate cortex_m Documentation** <br>
   Cortex core support and assembly instructions. <br>
   [https://docs.rs/cortex-m/latest/cortex_m/](https://docs.rs/cortex-m/latest/cortex_m/)

5. **Crate cortex_m_rt Documentation** <br>
   Startup code and minimal runtime for Cortex-M micro-controllers <br>
   [https://docs.rs/cortex-m-rt/latest/cortex_m_rt/](https://docs.rs/cortex-m-rt/latest/cortex_m_rt/)

6. **Play List - Embedded Rust BluePill** - Vers Binarii <br>
   [https://www.youtube.com/playlist?list=PLP_X41VhYn5X6Wwjnm0bRwI3n2pdaszxU](https://www.youtube.com/playlist?list=PLP_X41VhYn5X6Wwjnm0bRwI3n2pdaszxU)

7. **Play List - Embedded Rust course** - JaJakub - 2022 <br>
   [https://www.youtube.com/playlist?list=PLL2SCPK5xSRWBPj-nKOVYIhxRw7C4kYeI](https://www.youtube.com/playlist?list=PLL2SCPK5xSRWBPj-nKOVYIhxRw7C4kYeI)

8. **TeXitoi - blue-pill-quickstart** <br>
   The Example source code is modified from here. <br>
   [https://github.com/TeXitoi/blue-pill-quickstart](https://github.com/TeXitoi/blue-pill-quickstart)

9. **lupyuen - stm32-blue-pill-rust** <br>
   This uses debugger multi architecture and VSCode. <br>
   [https://github.com/lupyuen/stm32-blue-pill-rust](https://github.com/lupyuen/stm32-blue-pill-rust)

10. **rust-embedded - cortex-m-quickstart** <br>
    [https://github.com/rust-embedded/cortex-m-quickstart](https://github.com/rust-embedded/cortex-m-quickstart)

11. **STM32 - Discovery - Book** <br>
    [https://docs.rust-embedded.org/discovery/](https://docs.rust-embedded.org/discovery/)

12. **The Embedded Rust Book** <br>
    [https://docs.rust-embedded.org/book/](https://docs.rust-embedded.org/book/)

13. **229 drivers para Embedded-HAL** <br>
    [https://crates.io/keywords/embedded-hal-driver](https://crates.io/keywords/embedded-hal-driver)

14. **More gdb commands cheat-sheet** <br> 
    [https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf](https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf)

15. **Video - RTIC - Real Time Interrupt driven Concurrency** <br>
    RTIC is a RTOS - Real Time Operating System. <br>
    [https://www.youtube.com/watch?v=saNdh0m_qHc](https://www.youtube.com/watch?v=saNdh0m_qHc)

16. **RTIC Book** <br>
    Real-Time Interrupt-driven Concurrency. <br>
    A very efficient preemptive multitasking framework that supports task prioritization and dead lock free execution. <br>
    [https://rtic.rs/1.0/book/en/](https://rtic.rs/1.0/book/en/)

17. **Github - rtic-rs - cortex-m-rtic** <br>
    [https://github.com/rtic-rs/cortex-m-rtic](https://github.com/rtic-rs/cortex-m-rtic)

18. **Video - Grepit about the Rust RTIC framework** <br>
    [https://www.youtube.com/watch?v=sSJ-Md8nwIM](https://www.youtube.com/watch?v=sSJ-Md8nwIM)

19. **The Embedonomicon Book** <br>
    Deep dive into the inner workings. <br>
    [https://docs.rust-embedded.org/embedonomicon/](https://docs.rust-embedded.org/embedonomicon/)

20. **Awesome Embedded Rust** <br>
    [https://github.com/rust-embedded/awesome-embedded-rust](https://github.com/rust-embedded/awesome-embedded-rust)

21. **How to learn modern Rust** <br>
    [https://github.com/joaocarvalhoopen/How_to_learn_modern_Rust](https://github.com/joaocarvalhoopen/How_to_learn_modern_Rust)
    

## Datasheets

1. **STM32F103C8 Website** <br> 
   [https://www.st.com/en/microcontrollers/stm32f103c8.html](https://www.st.com/en/microcontrollers/stm32f103c8.html)

2. **STM32F103C8 Datasheet** <br> 
   [https://www.st.com/resource/en/datasheet/stm32f103c8.pdf](https://www.st.com/resource/en/datasheet/stm32f103c8.pdf)

3. **STM32F103C8 Reference Manual** <br> 
   [https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf](https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf)

4. **STM32F103C8 Flash Programming** <br>
   [https://www.st.com/content/ccc/resource/technical/document/programming_manual/10/98/e8/d4/2b/51/4b/f5/CD00283419.pdf/files/CD00283419.pdf/jcr:content/translations/en.CD00283419.pdf](https://www.st.com/content/ccc/resource/technical/document/programming_manual/10/98/e8/d4/2b/51/4b/f5/CD00283419.pdf/files/CD00283419.pdf/jcr:content/translations/en.CD00283419.pdf)

5. **STM32F103C8 ARM Cortex M3 Programming** <br> 
   [https://www.st.com/content/ccc/resource/technical/document/programming_manual/5b/ca/8d/83/56/7f/40/08/CD00228163.pdf/files/CD00228163.pdf/jcr:content/translations/en.CD00228163.pdf](https://www.st.com/content/ccc/resource/technical/document/programming_manual/5b/ca/8d/83/56/7f/40/08/CD00228163.pdf/files/CD00228163.pdf/jcr:content/translations/en.CD00228163.pdf)


## Crates and code size optimization

1. **Crate heapless** <br>
   [https://github.com/japaric/heapless](https://github.com/japaric/heapless)

```
   Arc         - Thread-safe reference-counting pointer backed by a memory pool
   BinaryHeap  - Priority queue
   IndexMap    - Hash table
   IndexSet    - Hash set
   LinearMap
   Pool        - Lock-free memory pool
   String
   Vec
   mpmc::Q*    - Multiple producer multiple consumer lock-free queue
   spsc::Queue - Single producer single consumer lock-free queue
```

2. **Crate ufmt** <br>
   A (6-40x) smaller, (2-9x) faster and panic-free alternative to core::fmt <br>
   [https://github.com/japaric/ufmt](https://github.com/japaric/ufmt)

3. **LCD 16x2 - Crate hd44780-driver** <br>
   Implementation of the **embedded-hal traits for the HD44780**, 16x1, **16x2** and 16x4. <br>
   [https://github.com/JohnDoneth/hd44780-driver](https://github.com/JohnDoneth/hd44780-driver)

4. **Crate Embedded graphics** <br>
   It's a 2D graphics library that is focused on memory constrained embedded devices. <br>
   [https://github.com/embedded-graphics/embedded-graphics](https://github.com/embedded-graphics/embedded-graphics)

5. **Crate flip-link** <br>
   Adds zero-cost stack overflow protection to your embedded programs. <br>
   [https://github.com/knurling-rs/flip-link/](https://github.com/knurling-rs/flip-link/)

6. **Crate defmt** <br>
   defmt ("de format", short for "deferred formatting") is a highly efficient logging framework that targets resource-constrained devices, like micro-controllers. <br>
   [https://github.com/knurling-rs/defmt/](https://github.com/knurling-rs/defmt/)

7. **TOML compilation flag options to generate smaller code size**

```
....

[profile.release.package."*"]
opt-level = "z"

[profile.release]
codegen-units = 1
debug = true
opt-level = "z"
```


## After installation in process to compile, flash and debug you only need to do

```
######
# Window CMD 1
$ openocd

# Windows CMD 2
$ cargo clean
$ cargo build
$ cargo run

or just do: 

######
# Window CMD 1
$ openocd

# Window CMD 2
$ cargo build
$ cargo run

or

(gdb) continue

or

(gdb) ctrl + c
(gdb) list

or
(gdb) ctrl + c
(gdb) layout src

######
Or inside VSCode in a debug sectiondo,

# Window CMD 1
$ openocd

Just put one breakpoint and start running the Debug play icon. 
(VSCode) Set Breakpoint in line 10.
(VSCode) icon play debug.
```


## Installation of embedded Rust for STM32

**After installing Rust on you PC do:** <br>

```
$ rustup update
$ rustc --version

$ rustup target add thumbv7m-none-eabi
```

Installation of the debugger (**gdb-multiarch**) and the tool to flash do chip, the onm circuit debugger SWD (**openocd**): <br>

```
(arm-none-eabi-gdb is obsolete, we will use gdb-multiarch)

$ sudo apt-get install  gdb-multiarch openocd

$ sudo ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb
```

Install **ARM Cross-Compiler** and **Linker** <br>

```
$ sudo apt install binutils-arm-none-eabi gcc-arm-none-eabi

$ arm-none-eabi-gcc -v
```

It should appear something like this: <br>

```
"version 9.2.1 20191025 (release)"
```

If not you have a problem in the path: <br>

1. If you see no errors, close the command prompt.

2. If you see an error, update your PATH environment variable so that it includes the folder for the ARM ".exe" files.

To have a graphical debugger front-end, inside VSCode, install the following plugin: <br>

* **Plugin Native Debug (WebFreak)** <br>
  [https://marketplace.visualstudio.com/items?itemName=webfreak.debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)

To use the debugger inside VSCode the last command in the script for the debugger gdb "openocd.gdb" has to terminate in step, and has to be waiting at the beginning of the program. And you must have the openocd running on a independent shell window. <br>


## How to use this repository

```
1. Download the repository or clone it to a directory.
2. Change the directory name from "stm32_bluepill_in_rust__Template"
   to "stm32_bluepill_in_rust".
3. Connect the BluePill ST-Link_V2 programmer to the Blupill and to
   the computer, only the programmer can be connected while programming.
3. Then do:

Window CMD 1
$ cd stm32_bluepill_in_rust
$ openocd

Window CMD 2
$ cd stm32_bluepill_in_rust
$ cargo clean
$ cargo build
$ cargo run
```

Then **to do your own project** you will have to create a project directory with the name of the project (lowercase and "_"), then copy the all the files there, then change the files where is "**stm32_bluepill_in_rust**" to your project name. <br>
**The files to change are:** <br>
* openocd.gdb
* launch.json


## How to start learning about the stm32f1xx-hal API and the low level details of the micro-controller.
 
My process of studying will be to start from the beginning of this list of program examples and analyse each program one at a time, see / find in the comments and in the HAL documentation in detail what each function of method does. It's a simple process but laborious that will rapidly fill you in into the API. For more detail a second pass will be in the Datasheet and Reference manual for this micro-controller. The **examples** that have in there name **rtic** are the ones that use the **rtic - real time operating system**. The following links are the documentation you will need to understand the examples. <br>

1. **stm32-rs - stm32f1xx-hal - Examples** <br>
   [https://github.com/stm32-rs/stm32f1xx-hal/tree/master/examples](https://github.com/stm32-rs/stm32f1xx-hal/tree/master/examples)

2. **stm32f1xx_hal Documentation version 0.8** <br>
   [https://docs.rs/stm32f1xx-hal/0.8.0/stm32f1xx_hal/](https://docs.rs/stm32f1xx-hal/0.8.0/stm32f1xx_hal/)

3. **Crate cortex_m Documentation** <br>
   Core support and assembly instructions. <br>
   [https://docs.rs/cortex-m/latest/cortex_m/](https://docs.rs/cortex-m/latest/cortex_m/)

4. **Crate cortex_m_rt Documentation** <br>
   Startup code and minimal runtime for Cortex-M micro-controllers <br>
   [https://docs.rs/cortex-m-rt/latest/cortex_m_rt/](https://docs.rs/cortex-m-rt/latest/cortex_m_rt/)

5. **STM32F103C8 Reference Manual** <br>
   [https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf](https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf)

## Order in which one should study the examples to learn how to use the stm32f1xx-hal crate:

```
01. - blinky.rs
02. - blinky_generic.rs
03. - blinky_rtc.rs
04. - blinky_rtcalarm_irq.rs
05. - blinky_timer_irq.rs

06. - timer-interrupt-rtic.rs

07. - delay.rs

08. - hello.rs

09. - led.rs

10. - gpio_input.rs
11. - dynamic_gpio.rs
12. - multi_mode_gpio.rs

13. - panics.rs

14. - pwm.rs
15. - pwm_custom.rs
16. - pwm_input.rs

17. - exti.rs
18. - exti_rtic.rs

19. - adc.rs
20. - adc_temperature.rs
21. - adc-dma-circ.rs
22. - adc-dma-rx.rs

23. - rtc.rs

24. - serial.rs
25. - serial_config.rs
26. - serial_reconfigure.rs
27. - serial-fmt.rs
28. - serial-interrupt-idle.rs
29. - serial-dma-circ.rs
30. - serial-dma-peek.rs
31. - serial-dma-rx.rs
32. - serial-dma-tx.rs

33. - i2c-bme280 - Example of using i2c with the bme280 air sensor

34. - spi.rs
35. - spi-dma.rs

36. - mfrc522.rs

37. - usb_serial.rs
38. - usb_serial_interrupt.rs
39. - usb_serial_rtic.rs

40. - nojtag.rs
41. - crc.rs
42. - qei.rs

43. - itm.rs

44. - can-echo.rs
45. - can-loopback.rs
46. - can-rtic.rs

47. - motor.rs.disabled
48. - mpu9250.rs.disabled

49. - enc28j60-coap.rs.disabled
50. - enc28j60.rs.disabled
```


## Notes

* **block!** - Turns the non-blocking expression $e into a blocking operation. <br>
  From the crate nb.


## License
MIT Open Source license. <br>
This are very basic configuration files and a simple blink example that I made by updating and modifying the upper referenced links. This is just my starting point for a project with the bluepill in Rust.


## Have fun!
Best regards, <br>
João Nuno Carvalho <br>

