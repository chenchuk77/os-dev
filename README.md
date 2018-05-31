# OS-DEV

Writing a simple Operating-System from scratch

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

we need to have x86 emulator, Assembler, Binary editor/viewer
```
Bochs emulator
Nasm assembler
Octal-Dump viewer (od command in linux)

```

### Installing


Clone the repository and install dependencies

```
% git clone https://github.com/chenchuk77/os-dev.git
% sudo apt install bochs-x
% sudo apt install nasm
```

cd into the cloned folder and use a run.sh script to :

1. Assemble the asm code into binary code, using nasm
2. Show and log the binary data 
3. Setup bochsrc in local workspace to boot the above bin
4. run bochs

Example:

This will create a machine code binary file (bs.bin) . 
The file will be linked into the boot sector of floppy drive (using bochsrc). 
Bochs will open a new emulator window and run this code.

```
% cd os-dev
os-dev % ./run.sh bs.asm
```

NOTE:

When running bochs on debian/ubuntu, bochs starts in debug mode, 
if you will see blank a window :


```
press "c" to start
```
On success, you will see something like this:

```
Booting from Floppy...
Hello, World !Goodbye !0x12AB
```
#### Dependencies

* [Bochs](http://bochs.sourceforge.net/) - x86 Emulator
* [NASM](https://www.nasm.us/) - Assembler

## Author

* **Chen Alkabets** - *Initial work* - [Chenchuk77](https://github.com/chenchuk77)
