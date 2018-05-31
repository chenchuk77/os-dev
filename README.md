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

This will create a machine code binary file. The file will be linked into the boot sector (using bochsrc), and Bochs will run this code.

```
NOTE:
When running bochs on debian/ubuntu, bochs starts in debug mode and you will see blank window. press "c" to start
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
