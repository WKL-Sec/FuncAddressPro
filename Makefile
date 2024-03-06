# Makefile for building the Program with clang++ and NASM

# Compiler and assembler definitions
CC=clang++
AS=nasm
LD=clang++

# Flags for the compiler and assembler
CFLAGS=-Wall -Wextra -std=c++17
ASFLAGS=-f win64
LDFLAGS=

# Source files
CPP_SOURCES=main.cpp
ASM_SOURCES=FindFunctionAddress.asm

# Object files
CPP_OBJECTS=$(CPP_SOURCES:.cpp=.o)
ASM_OBJECTS=$(ASM_SOURCES:.asm=.obj)

# Output binary
EXECUTABLE=Program.exe

all: $(EXECUTABLE)

$(EXECUTABLE): $(CPP_OBJECTS) $(ASM_OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

%.obj: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f $(CPP_OBJECTS) $(ASM_OBJECTS) $(EXECUTABLE)
