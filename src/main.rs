#![no_main]
#![no_std]

// Set the panic handler
extern crate panic_semihosting;

// use nb::block;
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
