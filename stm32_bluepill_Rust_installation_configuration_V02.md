# BluePill STM32F103 - Development board - Rust ou MicroPython ou Arduino 

Estado actual:
Já tenho todo o software instalado em Ubuntu 20.04 em Rust seguindo a lista de passos que coloquei em baixo e com os ficheiros alterados dos originais (links em baixo) para o meu caso.

Já compila, 
já corre o openocd,
já corre o debuger gdb-multiarch,
Já faz o flash do programa e já o mete a correr no micro-controlador,
Já para o breakpoint da main.
Pode-se fazer continue para o programa continuar ou fazer o set de um novo breakpoint e depois continue.

Ou então dentro do VSCode já faz o debug funcionando nomalmente como os outros debuggers de Rust.


# BluePill STM32F103 - Development board

# Specifications:

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


########
IMPORTANTE:

  MAX Absolute 150 mA total source/sink for entire CPU.
  
  MAX 20 mA per pin, 8mA recomended.
  
  Existem pinos que são 5 V tolerante mas existem muitos que não são, tem de se olhar para os diagramas do chip ou as especificações

  Corrente máxima a 3.3V não é igual em todos os pinos. 
     PC13, PC14 e PC15 são mais fracos Source 0 mA e sink  3mA max 2 MHz e max 30pF.
   
  


# Connecting the STM32 Blue Pill to ST-Link V2 USB Debugger
STM32 Blue Pill        ST-Link V2 USB Debugger
V3      [Red]         3.3V     (Pin 8)
IO      [Orange]      SWDIO    (Pin 4)
CLK     [Brown]       SWDCLK   (Pin 2)
GND     [Black]       GND      (Pin 6)




########################################
# MicroPython para o BluePill

Blue Pill STM32F103C8T6
https://github.com/mcauser/BLUE_PILL_F103C8



########################################
# Using a STM32 like an Arduino Tutorial - STM32F103C8 - Bluiepill

https://create.arduino.cc/projecthub/akarsh98/using-a-stm32-like-an-arduino-tutorial-stm32f103c8-1073cb

Video - Using a STM32 like an Arduino Tutorial | STM32F103C8 vs STM32F030F4 vs STM8S103F3 vs Arduino
https://www.instructables.com/Using-a-STM32-Like-an-Arduino-Tutorial-STM32F103C8/

Video - Easy & Powerful Arduino Alternative? STM32 Beginner's Guide - GreatScott
https://www.youtube.com/watch?v=EaZuKRSvwdo

Video - numeber 345 ESP32 vs STM32: Which one is better - Bluepill
https://www.youtube.com/watch?v=boF4cX338k4




########################################
# Rust with BluePill

No final de todas as configurações basta fazer o seguinte para correr o programa:


######
# Janela CMD 1
$ openocd

# Janela CMD 2
$ cargo clean
$ cargo build
$ cargo run

Ou então somente 

######
# Janela CMD 1
$ openocd

# Janela CMD 2
$ cargo build
$ cargo run

ou
(gdb) continue
ou
(gdb) ctrl + c
(gdb) list

######
Ou então dentro do VSCode numa secção de debug,

# Janela CMD 1
$ openocd

basta colocar um breakpoint e carregar no icon de play debug. 
(VSCode) Set Breakpoint na linha 10.
(VSCode) icon play debug.



######

Nota: O que FALTA ainda explicar é como se coloca o QEMU a funcionar em modo de emulação do microcontrolador.
      Ver documentação:
      https://docs.rust-embedded.org/book/start/qemu.html


#######
Encontrei esta página, com o suporte completo para o STM32 BluePill em Rust Acho que suporta todos os periféricos do microcontrolador e é o que tem de longe mais exemplo, tem mesmo muitos exemplos de código, e até tem muitos exemplos, para saber como usar as API's dos perifericos periféricos do micro-controlador e documenta em parte de instalação e configuração para o BluePill:

stm32f1xx-hal in Rust
https://github.com/stm32-rs/stm32f1xx-hal

A directoria de exemplos de BluePill para Rust é esta:

stm32-rs - stm32f1xx-hal - Examples
https://github.com/stm32-rs/stm32f1xx-hal/tree/master/examples


Depois encontrei o seguinte que documenta o processo de instalação e configuração e desenvolvimento de alguns projectos ao longo de vários videos em Linux é uma play list hands-on:

[Muito bom]
Video Play List - Embedded Rust BluePill
https://www.youtube.com/playlist?list=PLP_X41VhYn5X6Wwjnm0bRwI3n2pdaszxU



Discovery Book
Good starting point for MicroBit and STM32
https://docs.rust-embedded.org/discovery/

PlayList - Embedded Rust course - JaJakub
https://www.youtube.com/playlist?list=PLL2SCPK5xSRWBPj-nKOVYIhxRw7C4kYeI

The Embedded Rust Book
Second fantastic book to read
Generic for any type of chip brand.
https://docs.rust-embedded.org/book/





Depois fui ver o preço do BluePill e ninguém tinha BluePills em Portugal mas neste site na Alemanha que vende material barato e que as entregas são gratis para mais do que 15 euros de compras tinha-os por 4.9 euros, agora que existe pois existe chip shortage:

Loja az-delivery
https://www.az-delivery.de/en/pages/search-results-page?q=stm32

Depois, ainda se metia a questão dos drivers para os diferentes componentes, então estive a ver na página do Awesome embedded Rust e descobri que haviam vários drivers já desenvolvidos para Rust Embedded para a Embbeded HAL que são genericos e todos funcionam para qualquer HAL para qualquer marca de processador para qualquer modelo (desde que suportado em Rust) pois isto tudo funciona com uns genéricos que são uma especie de interface de C# ou Java (trait em Rust) que depois usa a Embbeded-Hal do Rust, esse é o trait que abstrai todo o hardware e que a interface desaparecem em tempo de compilação (por isso a performance é boa) é algo assim e para ver todos os que existem: basta fazer uma procura no crates.io por "embedded-hal-driver" e a pesquisa deu 229 drivers que é menos de certeza do que para Arduino Uno mas que deve ser mais do que para todos os outros arduinos (mesmo para o Arduino Nano Every que é o mais barato) ou do que para se calhar os ESP32. Talvez o ESP8266 tenha mais mas em principio é mais do que é mais do que as outras plataformas todas com a excepção do Arduino Uno e só o Uno. As necessidades de desenvolvimento dos drivers é M+N em vez de M*N pois, em que M é o numero de familias ou de chips e N é o número de Drivers. Ou seja os drivers só sao desenvolvidos uma vez e depois dão para todas as familias que emplementam embbeded-hal do Rust e isso são praticamente todos os portes para Rust, incluindo STM32, e muitos outros.


229 drivers para Embedded-HAL
https://crates.io/keywords/embedded-hal-driver


# How to install and configure BluePill In Rust

TeXitoi - blue-pill-quickstart
https://github.com/TeXitoi/blue-pill-quickstart

(Mas tem 4 anos e está embebido no Visual Studio Code)
lupyuen - stm32-blue-pill-rust (Este usa o debugger multi arquitecture)
https://github.com/lupyuen/stm32-blue-pill-rust

rust-embedded - cortex-m-quickstart
https://github.com/rust-embedded/cortex-m-quickstart

(Este já tem algum tempo mas deve ser o melhor para aprender a usar os STM32, junto com os exemplos)
STM32 - Discovery
https://docs.rust-embedded.org/discovery/


########################################

Instalation process Ubuntu 20.04 (fui eu que escrevi a versão pois foi a que eu testei)

Estas intruções seguem a descrição do repositório seguinte:

TeXitoi - blue-pill-quickstart
https://github.com/TeXitoi/blue-pill-quickstart

Este repositório tambem tem detalhes importantes:

lupyuen - stm32-blue-pill-rust
https://github.com/lupyuen/stm32-blue-pill-rust



#### Caso não se tenha o Rust instalado é só ir ao site do Rust e seguir os passos que estão lá para a vossa plataforma.
 
##### Depois de instalar o Rust no computador, fazer o update para a ultima versão


$ rustup update
$ rustc --version

$ rustup target add thumbv7m-none-eabi


# Instalação do debugger (gdb-multiarch) e da ferramenta que faz o flash do chip e o a parte de hardware do debuger SWD (openocd)

(arm-none-eabi-gdb is obsolete, we will use gdb-multiarch)

$ sudo apt-get install  gdb-multiarch openocd

$ sudo ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb





##### No ficheiro Cargo.toml tem de estar (root da tem de se ir para a directoria do projeto): 

[package]
name = "stm32_bluepill_in_rust"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
##### Most update versions.
##### I performed all the necessary changes to the code to make the example work again.
##### They were very simple changes.
stm32f1xx-hal = { version = "0.8.0", features = ["rt", "stm32f103" ] }
cortex-m = "0.7.4"
cortex-m-rt = { version = "0.7.1", features = ["device"] }
panic-semihosting = "0.5.6"
cortex-m-semihosting = "0.3.7"


##### No ficheiro .cargo/config

[target.thumbv7m-none-eabi]

# uncomment ONE of these three option to make `cargo run` start a GDB session
# which option to pick depends on your system
# runner = "arm-none-eabi-gdb -q -x openocd.gdb"
runner = "gdb-multiarch -q -x openocd.gdb"
# runner = "gdb -q -x openocd.gdb"

rustflags = ["-C", "link-arg=-Tlink.x"]

[build]
target = "thumbv7m-none-eabi"



##### no ficheiro memory.x  (root da tem de se ir para a directoria do projeto)

/* Linker script for the STM32F103C8T6 */
MEMORY
{
  FLASH : ORIGIN = 0x08000000, LENGTH = 64K
  RAM : ORIGIN = 0x20000000, LENGTH = 20K
}



##### no ficheiro openocd.cfg (root da tem de se ir para a directoria do projeto)

source [find interface/stlink-v2.cfg]
source [find target/stm32f1x.cfg]





##### No ficheiro openocd.gdb  (root da tem de se ir para a directoria do projeto)

# Set architecture to ARM 32-bit. Needed for gdb-multiarch on Ubuntu.
set architecture arm

# Send GDB commands to OpenOCD, which listens on port 3333.  Extend the timeout.
set remotetimeout 100000
target remote :3333




#### Disable all messages.
# set verbose off
# set complaints 0
# set confirm off
# set exec-done-display off
# show exec-done-display
# set trace-commands off
# set debug displaced off 
# set debug expression 0
# set debug frame 0
# set debug infrun 0
# set debug observer 0
# set debug overload 0
# set pagination off
# set print address off
# set print symbol-filename off
# set print symbol off
# set print pretty off
# set print object off
# set debug parser off
# set debug remote 0





# Print demangled symbols by default.
set print asm-demangle on

# Enable ARM semihosting to show debug console output in OpenOCD console.
monitor arm semihosting enable



# Specify the target program to be debugged.  Must be specified here (not the command line) because the VSCode debugger will fail without it.
# IMPORTANTE: CHANGE TO THE CORRECT FILE ex: "stm32_blue_pill_rust".
# file target/thumbv7m-none-eabi/release/stm32_bluepill_in_rust
file target/thumbv7m-none-eabi/debug/stm32_bluepill_in_rust


# detect unhandled exceptions, hard faults and panics
# break DefaultHandler
# break HardFault
# break rust_begin_unwind

# Load the program into device memory.
load

# Set breakpoint at the main() function.
# IMPORTANTE: CHANGE TO THE CORRECT FILE ex: "stm32_bluepill_in_rust".

break main
#break stm32_bluepill_in_rust::main

# Run the program and stop at the main() function.
continue

# Remove the breakpoint at the main() function.
# IMPORTANTE: CHANGE TO THE CORRECT FILE ex: "stm32_bluepill_in_rust".
# clear stm32_bluepill_in_rust::main

# Step into the first line of the main() function. Else gdb will complain about "entry macros" file missing.
### IMPORTANTE: HAS TO BE UNCOMENTED FOR VSCode debugger to work. 
step

# continue



##### fim do ficheiro openocd.gdb  






##### No ficheiro de código /src/main.rs



#![no_main]
#![no_std]

// Set the panic handler
extern crate panic_semihosting;

use core::sync::atomic::{AtomicBool, Ordering};
use cortex_m::peripheral::syst::SystClkSource;
use cortex_m_rt::{entry, exception};
use stm32f1xx_hal::prelude::*;

use cortex_m_semihosting::{
    // Debug, 
    hprintln};


static TOGGLE_LED: AtomicBool = AtomicBool::new(false);

//  #[no_mangle]
#[entry]
fn main() -> ! {
    let mut core = cortex_m::Peripherals::take().unwrap();
    let device = stm32f1xx_hal::stm32::Peripherals::take().unwrap();
    let rcc = device.RCC.constrain();
    let mut flash = device.FLASH.constrain();

    let clocks = rcc
        .cfgr
        //.use_hse(8.mhz())
        .use_hse(4.mhz())
        .sysclk(16.mhz())
        .freeze(&mut flash.acr);

    // Configure the user led
    let mut gpioc = device.GPIOC.split();
    let mut led = gpioc.pc13.into_push_pull_output(&mut gpioc.crh);

    // Configure SysTick to generate an exception every second
    core.SYST.set_clock_source(SystClkSource::Core);
    core.SYST.set_reload(clocks.sysclk().0);
    core.SYST.enable_counter();
    core.SYST.enable_interrupt();

    loop {
        // Sleep
        // With this state of sleep to enter openocd you have to keep reset button
        //  on the MCU pressed and after entering openocd then release it.
        // This is why it is commented.
        // cortex_m::asm::wfi();
        if TOGGLE_LED.swap(false, Ordering::AcqRel) {
            led.toggle();

            hprintln!("Hello world!").unwrap();
        }
    }
}

#[exception]
fn SysTick() {
    TOGGLE_LED.store(true, Ordering::Release);
}







#### Install ARM Cross-Compiler and Linker

$ sudo apt install binutils-arm-none-eabi gcc-arm-none-eabi

$ arm-none-eabi-gcc -v

Deve aparecer algo como:
"version 5.4.1 20160919 (release)"

Senão é um problema de path:

1. If you see no errors, close the command prompt.

2. If you see an error, update your PATH environment variable so that it includes the folder for the ARM ".exe" files.





#### Para correr o programa fazer:

$ cargo build

ou 

$ cargo clean
$ cargo check --release
$ cargo build --release





# Sanity check for the built application

$ arm-none-eabi-readelf -h target/thumbv7m-none-eabi/release/stm32-blue-pill-rust


##### Esta é a versao automatica:


# Só fazemos "opencd" pois temos um ficheiro de inicialização.

$ openocd


# E fazemos o flash com o "cargo Run" que nos lança o GDB e faz o load ou flash do nosso programa no microcontrolador.

$ cargo run






###### Esta é a vertsão manual mas tem de ser adaptada:

# Debugging from the Command Line

$ openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg

You should see something like:

" GNU MCU Eclipse 64-bits Open On-Chip Debugger 0.10.0+dev-00487-gaf359c18 (2018-05-12-19:30)
Licensed under GNU GPL v2

....

Info : clock speed 950 kHz
Info : STLINK v2 JTAG v17 API v2 SWIM v4 VID 0x0483 PID 0x3748
Info : using stlink api v2
Info : Target voltage: 3.225397
Info : stm32f1x.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : Listening on port 3333 for gdb connections
"




##### Start a debug session in another command window:

$ arm-none-eabi-gdb -x loader.gdb target/thumbv7m-none-eabi/release/stm32-blue-pill-rust



Common GDB commands:

step: Execute the current source line, step into functions if present. Same as the step into command in Visual Studio Code.

next: Execute the current source line, don't step into functions. Same as the step over command in Visual Studio Code.

where: Show stack trace.

where full: Show stack trace with local variables.


# Muito importante

More gdb commands cheat-sheet: 
https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf






###### Para ter debug no Visual Studio Code instalar o seguinte plugin e depois fazer:

Plugin Native Debug (WebFreak)
https://marketplace.visualstudio.com/items?itemName=webfreak.debug

depois fazer num terminal, "openocd" pois tem de estar em cima para que o gdb comunique com o hardware programador:

$ openocd


# Colocar o ficheiro em ./vscode/launch.json com o seguinte:


{
    // Debug settings: https://github.com/WebFreak001/code-debug
    "version": "0.2.0",
    "configurations": [        
        {
            //  Debug the STM32 Blue Pill program.
            "name": "Debug (STM32 Blue Pill Rust)",
            "type": "gdb",
            "request": "launch",
            "cwd": "${workspaceRoot}",

            //  This target setting is mandatory but redundant because it's specified in loader.gdb.
            //  IMPORTANT: CHANGE THE EXECUTABLE NAME "/debug/stm32_bluepill_in_rust" TO YOURS WIHT THE RELEASE PREFIX IF IT IS THE CASE .
            "target": "target/thumbv7m-none-eabi/debug/stm32_bluepill_in_rust",

            //  Start arm-none-eabi-gdb with the loader.gdb script.  Connects to OpenOCD to send commands to ST-Link USB dongle.
            "gdbpath": "arm-none-eabi-gdb",
            "debugger_args": [
                "-x",
                "openocd.gdb"
            ],

            //  For debugger display, don't interpret values returned by gdb.
            "valuesFormatting": "disabled",

            //  Enable debug output.
            "printCalls": false,
            "showDevDebugOutput": false,
        }
    ]
}




#########################################

# Documentation of the maker of the microcontroller

STM32F103C8 Website: 
https://www.st.com/en/microcontrollers/stm32f103c8.html

STM32F103C8 Datasheet: 
https://www.st.com/resource/en/datasheet/stm32f103c8.pdf

STM32F103C8 Reference Manual: 
https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf

STM32F103C8 Flash Programming: 
https://www.st.com/content/ccc/resource/technical/document/programming_manual/10/98/e8/d4/2b/51/4b/f5/CD00283419.pdf/files/CD00283419.pdf/jcr:content/translations/en.CD00283419.pdf

STM32F103C8 ARM Cortex M3 Programming: 
https://www.st.com/content/ccc/resource/technical/document/programming_manual/5b/ca/8d/83/56/7f/40/08/CD00228163.pdf/files/CD00228163.pdf/jcr:content/translations/en.CD00228163.pdf


E é tudo por hoje, 
eu testei todos estes passos num computador meu e funcionaram :-)


Cumprimentos,
João




