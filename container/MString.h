//
// Created by François Fayard on 10/07/2021.
//

#ifndef MAGNOLIA_MSTRING_H
#define MAGNOLIA_MSTRING_H

#include "stdlib.h"
#include "stdbool.h"
#include "string.h"
#include "stdint.h"

intptr_t sizeCString(const char* cstr);


intptr_t sizeCString(const char* cstr) {
    intptr_t i = 0;
    while (cstr[i] != '\0') {
        ++i;
    }
    return i;
}

struct _LargeString_s {
    char* _data;
    intptr_t _size;
    uintptr_t _capacity;
};
typedef struct _LargeString_s _LargeString;

struct String_s {
    union {
        char _small[sizeof(_LargeString)];
        _LargeString _large;
    };
};
typedef struct String_s String;

String* newStringCString(const char* cstr);
const char* asCStringString(String* s);
bool isSmallString(String* s);

intptr_t _nextCapacity(intptr_t r);
void _setSmallString(String* s, intptr_t n);
void _setLargeString(String* s, intptr_t n, intptr_t r);

void deleteString(String* s);

String* newStringCString(const char* cstr) {
    String* mem = malloc(sizeof(String));
    intptr_t n = sizeCString(cstr);
    if (n <= (sizeof(_LargeString) - 2)) {
        memcpy(mem->_small, cstr, ((uintptr_t) n) + 1);
        _setSmallString(mem, n);
    } else {
        intptr_t r = _nextCapacity(n);
        mem->_large._data = malloc((((uintptr_t) n) + 1) * sizeof(char));
        memcpy(mem->_large._data, cstr, ((uintptr_t) n) + 1);
        _setLargeString(mem, n, r);
    }
    return mem;
}

const char* asCStringString(String* s) {
    if (isSmallString(s)) {
        return s->_small;
    } else {
        return s->_large._data;
    }
}

bool isSmallString(String* s) {
    return (((unsigned char) s->_small[sizeof(_LargeString) - 1]) & ((unsigned char) 0x80)) == ((unsigned char) 0x00);
}

intptr_t _nextCapacity(intptr_t r) {
    return (intptr_t) ((((uintptr_t) r) + ((uintptr_t) 7)) & ~((uintptr_t) 7));
}

void _setSmallString(String* s, intptr_t n) {
    unsigned char value = (unsigned char) n;
    s->_small[sizeof(_LargeString) - 1] = value;
}

void _setLargeString(String* s, intptr_t n, intptr_t r) {
    s->_large._size = n;
    s->_large._capacity = (((uintptr_t) r) >> 3) | (((uintptr_t) 0x80) << ((sizeof(uintptr_t) - 1) * 8));
}

void deleteString(String* s) {
    if (!isSmallString(s)) {
        free(s->_large._data);
    }
    free(s);
}

#endif //MAGNOLIA_MSTRING_H
