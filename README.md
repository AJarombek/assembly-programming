# assembly-programming

Various dialects of assembly programming code, tested and run using GitHub actions.

### Commands

** Setup on macOS **

```bash
brew install nasm
nasm --version
```

** Compile and run **

```bash
nasm -f elf64 atomic.asm -o atomic.o
```