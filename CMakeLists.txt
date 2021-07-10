cmake_minimum_required(VERSION 3.19)
project(Magnolia C)

set(CMAKE_C_STANDARD 99)

add_executable(Magnolia
        container/MArrayD.h
        container/MListD.h
        main.c container/MTreeD.h container/MString.h)