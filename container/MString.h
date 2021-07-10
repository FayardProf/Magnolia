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
String* initStringCString(String* s, const char* cstr);

intptr_t sizeString(String* self);
intptr_t capacityString(String* self);
char* asCStringString(String* self);
bool isSmallString(String* self);
bool isRuneBoundary(String* self, intptr_t i);
intptr_t nextRune(String* self, intptr_t i);
void appendCharString(String* self, char c);
void appendRuneString(String* self, int rune);
void appendCStringString(String* self, const char* cstr);
void appendStringString(String* self, String* s);
void insertCharString(String* self, intptr_t i, char c);
void insertRuneString(String* self, intptr_t i, int rune);
void insertCStringString(String* self, intptr_t i, const char* cstr);
void insertStringString(String* self, intptr_t i, String* s);
bool startsWithCStringString(String* self, const char* cstr);
bool startsWithStringString(String* self, String* s);
bool endsWithCStringString(String* self, const char* cstr);
bool endsWithStringString(String* self, String* s);
void clearString(String* self);
intptr_t searchCharString(String* self, char c);
intptr_t searchCStringString(String* self, const char* cstr);
intptr_t searchStringString(String* self, String* s);

intptr_t _nextCapacity(intptr_t r);
void _setSmallString(String* self, intptr_t n);
void _setLargeString(String* self, intptr_t n, intptr_t r);
void _growString(String* self, intptr_t n_to_copy, intptr_t n);
void _setInvariantString(String* self, intptr_t n);

void deleteString(String* s);
void releaseString(String* s);

String* newStringCString(const char* cstr) {
    String* mem = malloc(sizeof(String));
    return initStringCString(mem, cstr);
}

String* initStringCString(String* s, const char* cstr) {
    intptr_t n = sizeCString(cstr);
    if (n <= (sizeof(_LargeString) - 2)) {
        memcpy(s->_small, cstr, ((uintptr_t) n) + 1);
        _setSmallString(s, n);
    } else {
        intptr_t r = _nextCapacity(n);
        s->_large._data = malloc((((uintptr_t) n) + 1) * sizeof(char));
        memcpy(s->_large._data, cstr, ((uintptr_t) n) + 1);
        _setLargeString(s, n, r);
    }
    return s;
}

intptr_t sizeString(String* self) {
   if (isSmallString(self)) {
       return (intptr_t) (((unsigned char) self->_small[sizeof(_LargeString) - 1]) & ((unsigned char) 0x1F));
   } else {
       return self->_large._size;
   }
}
intptr_t capacityString(String* self) {
    if (isSmallString(self)) {
        return (intptr_t) (sizeof(_LargeString) - 2);
    } else {
        return (intptr_t) ((((uintptr_t) (self->_large._capacity)) & ~(((uintptr_t) 0xD0) << ((sizeof(uintptr_t) - 1) * 8))) << 3);
    }
}

char* asCStringString(String* s) {
    if (isSmallString(s)) {
        return s->_small;
    } else {
        return s->_large._data;
    }
}

bool isSmallString(String* s) {
    return (((unsigned char) s->_small[sizeof(_LargeString) - 1]) & ((unsigned char) 0x80)) == ((unsigned char) 0x00);
}

bool isRuneBoundary(String* self, intptr_t i) {
    const char* data = asCStringString(self);
    unsigned char c = (unsigned char) data[i];
    return (c < ((unsigned char) 0x80)) || ((c & ((unsigned char) 0xC0)) != ((unsigned char) 0x80));
}

intptr_t nextRune(String* self, intptr_t i) {
    intptr_t n = sizeString(self);
    const char* p = asCStringString(self);
    do {
        ++i;
    } while (i < n && ((p[i] & ((unsigned char) 0xC0)) == ((unsigned char) 0x80)));
    return i;
}

void appendCharString(String* self, char c) {
    intptr_t old_n = sizeString(self);
    _growString(self, old_n, old_n + 1);
    char* p = asCStringString(self);
    p[old_n] = c;
    p[old_n + 1] = '\0';
    _setInvariantString(self, old_n + 1);
}

void appendRuneString(String* self, int rune) {
    unsigned int urune = (unsigned int) rune;
    intptr_t old_n = sizeString(self);
    if (urune < 0x00000080u) {
        _growString(self, old_n, old_n + 1);
        char* p = asCStringString(self);
        p[old_n] = (char) rune;
        p[old_n + 1] = '\0';
        _setInvariantString(self, old_n + 1);
    } else if (urune < 0x00000800u) {
        _growString(self, old_n, old_n + 2);
        char* p = asCStringString(self);
        p[old_n] = (char) ((urune >> 6) | 0x000000C0u);
        p[old_n + 1] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = '\0';
        _setInvariantString(self, old_n + 2);
    } else if (urune < 0x00010000u) {
        _growString(self, old_n, old_n + 3);
        char* p = asCStringString(self);
        p[old_n] = (char) ((urune >> 12) | 0x000000E0u);
        p[old_n + 1] = (char) (((urune >> 6) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 3] = '\0';
        _setInvariantString(self, old_n + 3);
    } else {
        _growString(self, old_n, old_n + 4);
        char* p = asCStringString(self);
        p[old_n] = (char) ((urune >> 18) | 0x000000F0u);
        p[old_n + 1] = (char) (((urune >> 12) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = (char) (((urune >> 6) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 3] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 4] = '\0';
        _setInvariantString(self, old_n + 4);
    }
}

void appendCStringString(String* self, const char* cstr) {
    intptr_t old_n = sizeString(self);
    intptr_t n0 = sizeCString(cstr);
    _growString(self, old_n, old_n + n0);
    char* p = asCStringString(self);
    memcpy(p + old_n, cstr, n0);
    p[old_n + n0] = '\0';
    _setInvariantString(self, old_n + n0);
}

void appendStringString(String* self, String* s) {
    intptr_t old_n = sizeString(self);
    intptr_t n0 = sizeString(s);
    _growString(self, old_n, old_n + n0);
    char* p = asCStringString(self);
    memcpy(p + old_n, asCStringString(s), n0);
    p[old_n + n0] = '\0';
    _setInvariantString(self, old_n + n0);
}

void insertCharString(String* self, intptr_t i, char c) {
    intptr_t old_size = sizeString(self);
    intptr_t old_capacity = capacityString(self);
    bool old_is_small = isSmallString(self);
    char* p = asCStringString(self);
    if (old_size + 1 <= old_capacity) {
        for (intptr_t k = old_size; k >= i + 1; k--) {
            p[k] = p[k - 1];
        }
        p[i] = c;
        if (old_is_small) {
            _setSmallString(self, old_size + 1);
        } else {
            _setLargeString(self, old_size + 1, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + 1);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        new_p[i] = c;
        memcpy(new_p + i + 1, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeString(self, old_size + 1, r);
    }
}

void insertCStringString(String* self, intptr_t i, const char* cstr) {
    intptr_t n = sizeCString(cstr);
    intptr_t old_size = sizeString(self);
    intptr_t old_capacity = capacityString(self);
    bool old_is_small = isSmallString(self);
    char* p = asCStringString(self);
    if (old_size + n <= old_capacity) {
        for (intptr_t k = old_size + (n - 1); k >= i + n; k--) {
            p[k] = p[k - n];
        }
        memcpy(p + i, cstr, n);
        if (old_is_small) {
            _setSmallString(self, old_size + n);
        } else {
            _setLargeString(self, old_size + n, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + n);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        memcpy(new_p + i, cstr, n);
        memcpy(new_p + i + n, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeString(self, old_size + n, r);
    }
}

void insertStringString(String* self, intptr_t i, String* s) {
    intptr_t n = sizeString(s);
    intptr_t old_size = sizeString(self);
    intptr_t old_capacity = capacityString(self);
    bool old_is_small = isSmallString(self);
    char* p = asCStringString(self);
    if (old_size + n <= old_capacity) {
        for (intptr_t k = old_size + (n - 1); k >= i + n; k--) {
            p[k] = p[k - n];
        }
        memcpy(p + i, asCStringString(s), n);
        if (old_is_small) {
            _setSmallString(self, old_size + n);
        } else {
            _setLargeString(self, old_size + n, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + n);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        memcpy(new_p + i, asCStringString(s), n);
        memcpy(new_p + i + n, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeString(self, old_size + n, r);
    }
}

bool startsWithCStringString(String* self, const char* cstr) {
    intptr_t n = sizeString(self);
    const char* a = asCStringString(self);
    bool ans = true;
    intptr_t i = 0;
    while (ans && cstr[i] != '\0' && i < n) {
        if (a[i] != cstr[i]) {
            ans = false;
        }
        ++i;
    }
    return ans && cstr[i] == '\0';
}

bool startsWithStringString(String* self, String* s) {
    intptr_t n = sizeString(self);
    intptr_t m = sizeString(s);
    if (m > n) {
        return false;
    }
    const char* a = asCStringString(self);
    const char* b = asCStringString(s);
    bool ans = true;
    intptr_t i = 0;
    while (ans && i < m) {
        if (a[i] != b[i]) {
            ans = false;
        }
        ++i;
    }
    return ans;
}

bool endsWithCStringString(String* self, const char* cstr) {
    intptr_t n = sizeString(self);
    intptr_t m = sizeCString(cstr);
    if (m > n) {
        return false;
    }
    const char* a = asCStringString(self);
    bool ans = true;
    intptr_t i = 0;
    while (ans && i < m) {
        if (a[n - m + i] != cstr[i]) {
            ans = false;
        }
        ++i;
    }
    return ans;
}

bool endsWithStringString(String* self, String* s) {
    intptr_t n = sizeString(self);
    intptr_t m = sizeString(s);
    if (m > n) {
        return false;
    }
    const char* a = asCStringString(self);
    const char* b = asCStringString(s);
    bool ans = true;
    intptr_t i = 0;
    while (ans && i < m) {
        if (a[n - m + i] != b[i]) {
            ans = false;
        }
        ++i;
    }
    return ans;
}

void clearString(String* self) {
    if (isSmallString(self)) {
        self->_small[0] = '\0';
        _setSmallString(self, 0);
    } else {
        self->_large._data[0] = '\0';
        _setLargeString(self, 0, capacityString(self));
    }
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

void _growString(String* self, intptr_t n_to_copy, intptr_t n) {
    bool old_is_small = isSmallString(self);
    char* old_data = asCStringString(self);
    intptr_t old_capacity = capacityString(self);
    if (n <= sizeof(_LargeString) - 2) {
        if (!old_is_small) {
            memcpy(self->_small, old_data, n_to_copy);
        }
        _setSmallString(self, n);
    } else if (n <= old_capacity) {
        _setLargeString(self, n, old_capacity);
    } else {
        intptr_t r = _nextCapacity(n);
        char* p = malloc((r + 1) * sizeof(char));
        memcpy(p, old_data, n_to_copy);
        self->_large._data = p;
        if (!old_is_small) {
            free(old_data);
        }
        _setLargeString(self, n, r);
    }
}

void _setInvariantString(String* self, intptr_t n) {
    if (isSmallString(self)) {
        _setSmallString(self, n);
    } else {
        _setLargeString(self, n, capacityString(self));
    }
}

void deleteString(String* s) {
    releaseString(s);
    free(s);
}

void releaseString(String* s) {
    if (!isSmallString(s)) {
        free(s->_large._data);
    }
}
#endif //MAGNOLIA_MSTRING_H
