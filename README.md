# OS-DEV

Writing a simple Operating-System from scratch

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

we need to have x86 emulator, Assembler, Binary editor/viewer
```
Bochs emulator
Nasm assembler
Octal-Dump viewer (od command in linux)

```

### Installing


Clone the repository 

```
% git clone https://github.com/chenchuk77/os-dev.git
```

cd into the cloned folder and use a run.sh script to :

1. Assemble the asm code into binary code, using nasm
2. Show the binary data
3. Setup bochsrc in local workspace to boot the above bin
4. run bochs

Example:
```
% cd os-dev
os-dev % ./run.sh bs.asm

This will create a machine code binary file. 
The file will be linked into the boot sector (using bochsrc). 
Bochs will open a new emulator window and run this code.

```
NOTE:
When running bochs on debian/ubuntu, bochs starts in debug mode, 
if you will see blank window. press "c" to start
```

## Dependencies

* [Bochs](http://bochs.sourceforge.net/) - x86 Emulator
* [NASM](https://www.nasm.us/) - Assembler

## Author

* **Chen Alkabets** - *Initial work* - [Chenchuk77](https://github.com/chenchuk77)
