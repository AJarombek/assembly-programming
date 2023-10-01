FROM archlinux:base

LABEL maintainer="andrew@jarombek.com" \
      version="1.0.0" \
      description="Dockerfile for using NASM x86 assembly language on archlinux"

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm nasm gcc
