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