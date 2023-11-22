# assembly-programming

![Maintained Label](https://img.shields.io/badge/Maintained-No-red?style=for-the-badge)
![Deprecated Label](https://img.shields.io/badge/Deprecated-Yes-lightgray?style=for-the-badge)
![Archived Label](https://img.shields.io/badge/Archived-Yes-lightgray?style=for-the-badge)

### Overview

Various dialects of assembly programming code, tested and run using GitHub actions.

### Commands

**Setup on macOS**

```bash
cd x86
docker-compose up --build
docker exec -it x86_arch_linux_1 /bin/bash
```

**Compile and run (on Docker)**

```bash
# Compile the assembly file
nasm -f elf64 arithmetic.asm -o arithmetic.o

# Link the object file
gcc arithmetic.o -o arithmetic -no-pie

# Run the executable
./arithmetic
```

### Files

| Filename  | Description                                     |
|-----------|-------------------------------------------------|
| `.github` | GitHub Actions for CI/CD pipelines.             |
| `x86`     | Code samples in the NASM x86 assembly language. |

### Version History

**[V.1.0.0](https://github.com/AJarombek/assembly-programming/tree/v1.0.0) - Basic x86/NASM Programs**

> Release Date: October 1st, 2023

* Create basic x86 assembly programs using NASM (for future reference).
* Create a Dockerfile for running NASM on archlinux.
* GitHub Actions for testing and running the assembly programs.
