# FuncAddressPro

FuncAddressPro demonstrates a sophisticated method of using an external assembly file to dynamically retrieve function addresses, serving as an advanced alternative to the standard `GetProcAddress`. This approach, specifically designed to enhance stealth and security in software development, moves beyond conventional techniques as showcased in [this Gist](https://gist.github.com/WKL-Sec/4589927d184d904eed37a572847c72ef).

## Building from Source

While `FuncAddressPro` includes a Makefile for building with `mingw32-make.exe`, you can also compile and link manually using the following commands:

```bash
clang++ -Wall -Wextra -std=c++17 -c main.cpp -o main.o
nasm -f win64 FindFunctionAddress.asm -o FindFunctionAddress.obj
clang++ -o Program.exe main.o FindFunctionAddress.obj
```

The output of the build process will be `Program.exe`.

## Origin

This project is inspired by the content and teachings of the Offensive Development course offered by White Knight Labs. For more information on the course and to enhance your skills in offensive development, visit [White Knight Labs Offensive Development Training](https://training.whiteknightlabs.com/offensive-development-training/).
```
