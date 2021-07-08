cmake_minimum_required(VERSION 3.19)
project(Magnolia C)

set(CMAKE_C_STANDARD 99)

add_executable(Magnolia
        container/array_d.h
        container/slist_d.h
        main.c)