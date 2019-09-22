#!/bin/bash

slide()
{
    mkdir -p $1
    cd $1
}

burst()
{
    file=$1
    mkdir -p "${file%/*}" touch "$file"
    cd  "${file%/*}"
}