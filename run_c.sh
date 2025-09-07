#!/usr/bin/env bash

set -e

script_dir="$(dirname "$(readlink -f "$0")")"

info() {
    echo -e "\e[92;1m+++\e[0m $1"
}

warn() {
    echo -e "\e[93;1m+++ WARN:\e[0m $1"
}

error() {
    echo -e "\e[91;1m+++ ERROR:\e[0m $1" >&2
    if [ $2 -ne 0 ]; then exit $2; fi
}

cd "$script_dir"

file="./main.c"
#file="./main.cpp"

cmd="gcc -o ./out/main_c $file -lglfw3 -lGL -lm -Wall"
info "Building ($cmd) ..."
$cmd

cmd="./out/main_c"
info "Running ($cmd) ..."
$cmd
