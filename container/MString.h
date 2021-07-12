//
// Created by François Fayard on 10/07/2021.
//

#ifndef MAGNOLIA_MSTRING_H
#define MAGNOLIA_MSTRING_H

#include "stdlib.h"
#include "stdbool.h"
#include "string.h"
#include "stdint.h"

//////////
// Chars
//////////
intptr_t sizeCS(const char* cstr);

intptr_t sizeCS(const char* cstr) {
    intptr_t i = 0;
    while (cstr[i] != '\0') {
        ++i;
    }
    return i;
}

//////////
// VString
//////////
struct VString_s {
    char* at;
    intptr_t size;
};
typedef struct VString_s VString;

bool hasCharsVs(VString self, intptr_t i, const char* cstr);
bool hasCharVs(VString self, intptr_t i, char c);
bool hasSpaceVs(VString self, intptr_t i);
bool hasDigitVs(VString self, intptr_t i);
bool hasHexaDecimalVs(VString self, intptr_t i);
bool hasNewLineVs(VString self, intptr_t i);
bool startsWithCharsVs(VString self, const char* cstr);
bool startsWithVStringVs(VString self, VString s);
bool endsWithCharsVs(VString self, const char* cstr);
bool endsWithVStringVs(VString self, VString s);
intptr_t nextCharVs(VString self, intptr_t i, char c);
intptr_t nextDigitVs(VString self, intptr_t i);
intptr_t nextNewLineVs(VString self, intptr_t i);

bool hasCharsVs(VString self, intptr_t i, const char* cstr) {
    intptr_t n = self.size;
    const char* a = self.at;
    bool ans = true;
    intptr_t j = 0;
    while (ans && cstr[j] != '\0' && i + j < n) {
        if (a[i + j] != cstr[j]) {
            ans = false;
        }
        ++j;
    }
    return ans && cstr[j] == '\0';
}

bool hasCharVs(VString self, intptr_t i, char c) {
    return self.at[i] == c;
}

bool hasSpaceVs(VString self, intptr_t i) {
    return (self.at[i] == ' ') || (self.at[i] == '\f') || (self.at[i] == '\n') ||
           (self.at[i] == '\r') || (self.at[i] == '\t') || (self.at[i] == '\v');
}

bool hasDigitVs(VString self, intptr_t i) {
    return self.at[i] >= '0' && self.at[i] <= '9';
}

bool hasHexaDecimalVs(VString self, intptr_t i) {
    return (self.at[i] >= '0' && self.at[i] <= '9') ||
           (self.at[i] >= 'a' && self.at[i] <= 'f') ||
           (self.at[i] >= 'A' && self.at[i] <= 'F');
}

bool hasNewLineVs(VString self, intptr_t i) {
    return self.at[i] == '\n' ||
           (i + 1 < self.size && self.at[i] == '\r' && self.at[i + 1] == '\n');
}

bool startsWithCharsVs(VString self, const char* cstr) {
    intptr_t n = self.size;
    const char* a = self.at;
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

bool startsWithVStringVs(VString self, VString s) {
    intptr_t n = self.size;
    intptr_t m = s.size;
    if (m > n) {
        return false;
    }
    const char* a = self.at;
    const char* b = s.at;
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

bool endsWithCharsVs(VString self, const char* cstr) {
    intptr_t n = self.size;
    intptr_t m = sizeCS(cstr);
    if (m > n) {
        return false;
    }
    const char* a = self.at;
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

bool endsWithVStringVs(VString self, VString s) {
    intptr_t n = self.size;
    intptr_t m = s.size;
    if (m > n) {
        return false;
    }
    const char* a = self.at;
    const char* b = s.at;
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

intptr_t nextCharVs(VString self, intptr_t i, char c) {
    while (i < self.size && self.at[i] != c) {
        ++i;
    }
    return i < self.size ? i : -1;
}

intptr_t nextDigitVs(VString self, intptr_t i) {
    while (i < self.size && !(self.at[i] >= '0' && self.at[i] <= '9')) {
        ++i;
    }
    return i < self.size ? i : -1;
}

intptr_t nextNewLineVs(VString self, intptr_t i) {
    while (i < self.size && self.at[i] != '\n') {
        ++i;
    }
    return i < self.size ? i : -1;
}

/////////
// String
/////////
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

String* newCharsS(const char* cstr);
String* newCopyS(String* s);
String* newMoveS(String* s);
String* initS(String* mem);
String* initCharsS(String* mem, const char* cstr);
String* initCopyS(String* mem, String* other);
String* initMoveS(String* mem, String* other);

intptr_t sizeS(String* self);
intptr_t capacityS(String* self);
VString viewS(String* self);
char* asCharsS(String* self);
char* data(String* self);
bool isSmallS(String* self);
bool isRuneBoundaryS(String* self, intptr_t i);
intptr_t nextRuneS(String* self, intptr_t i);
void appendCharS(String* self, char c);
void appendRuneS(String* self, int rune);
void appendCharsS(String* self, const char* cstr);
void appendStringS(String* self, String* s);
void insertCharS(String* self, intptr_t i, char c);
void insertRuneS(String* self, intptr_t i, int rune);
void insertCharsS(String* self, intptr_t i, const char* cstr);
void insertStringS(String* self, intptr_t i, String* s);
bool startsWithCharsS(String* self, const char* cstr);
bool startsWithStringS(String* self, String* s);
bool endsWithCharsS(String* self, const char* cstr);
bool endsWithStringS(String* self, String* s);
void clearS(String* self);
intptr_t searchCharS(String* self, char c);
intptr_t searchCharsS(String* self, const char* cstr);
intptr_t searchStringS(String* self, String* s);

intptr_t _nextCapacity(intptr_t r);
void _setSmallS(String* self, intptr_t n);
void _setLargeS(String* self, intptr_t n, intptr_t r);
void _growS(String* self, intptr_t n_to_copy, intptr_t n);
void _setInvariantS(String* self, intptr_t n);

void deleteS(String* s);
void releaseS(String* s);

String* newCharsS(const char* cstr) {
    String* mem = malloc(sizeof(String));
    return initCharsS(mem, cstr);
}

String* newCopyS(String* s) {
    String* mem = malloc(sizeof(String));
    return initCopyS(mem, s);
}

String* newMoveS(String* s) {
    String* mem = malloc(sizeof(String));
    return initMoveS(mem, s);
}

String* initS(String* mem) {
    mem->_small[0] = '\0';
    _setSmallS(mem, 0);
    return mem;
}

String* initCharsS(String* s, const char* cstr) {
    intptr_t n = sizeCS(cstr);
    if (n <= (sizeof(_LargeString) - 2)) {
        memcpy(s->_small, cstr, ((uintptr_t) n) + 1);
        _setSmallS(s, n);
    } else {
        intptr_t r = _nextCapacity(n);
        s->_large._data = malloc((((uintptr_t) n) + 1) * sizeof(char));
        memcpy(s->_large._data, cstr, ((uintptr_t) n) + 1);
        _setLargeS(s, n, r);
    }
    return s;
}

String* initCopyS(String* mem, String* other) {
    intptr_t n = sizeS(other);
    if (isSmallS(other)) {
        memcpy(mem->_small, other->_small, sizeof(_LargeString));
        _setSmallS(mem, n);
    } else {
        intptr_t r = capacityS(other);
        mem->_large._data = malloc(r + 1);
        memcpy(mem->_large._data, other->_large._data, n + 1);
        _setLargeS(mem, n, r);
    }
    return mem;
}

String* initMoveS(String* mem, String* other) {
    intptr_t n = sizeS(other);
    if (isSmallS(other)) {
        memcpy(mem->_small, other->_small, sizeof(_LargeString));
        _setSmallS(mem, n);
    } else {
        mem->_large._data = other->_large._data;
        mem->_large._size = other->_large._size;
        mem->_large._capacity = other->_large._capacity;
        initS(other);
    }
    return mem;
}

intptr_t sizeS(String* self) {
   if (isSmallS(self)) {
       return (intptr_t) (((unsigned char) self->_small[sizeof(_LargeString) - 1]) & ((unsigned char) 0x1F));
   } else {
       return self->_large._size;
   }
}

intptr_t capacityS(String* self) {
    if (isSmallS(self)) {
        return (intptr_t) (sizeof(_LargeString) - 2);
    } else {
        return (intptr_t) ((((uintptr_t) (self->_large._capacity)) & ~(((uintptr_t) 0xD0) << ((sizeof(uintptr_t) - 1) * 8))) << 3);
    }
}

VString viewS(String* self) {
    VString ans;
    ans.at = asCharsS(self);
    ans.size = sizeS(self);
    return ans;
}

char* asCharsS(String* s) {
    if (isSmallS(s)) {
        return s->_small;
    } else {
        return s->_large._data;
    }
}

char* data(String* self) {
    if (isSmallS(self)) {
        return self->_small;
    } else {
        return self->_large._data;
    }
}

bool isSmallS(String* s) {
    return (((unsigned char) s->_small[sizeof(_LargeString) - 1]) & ((unsigned char) 0x80)) == ((unsigned char) 0x00);
}

bool isRuneBoundaryS(String* self, intptr_t i) {
    const char* data = asCharsS(self);
    unsigned char c = (unsigned char) data[i];
    return (c < ((unsigned char) 0x80)) || ((c & ((unsigned char) 0xC0)) != ((unsigned char) 0x80));
}

intptr_t nextRuneS(String* self, intptr_t i) {
    intptr_t n = sizeS(self);
    const char* p = asCharsS(self);
    do {
        ++i;
    } while (i < n && ((p[i] & ((unsigned char) 0xC0)) == ((unsigned char) 0x80)));
    return i;
}

void appendCharS(String* self, char c) {
    intptr_t old_n = sizeS(self);
    _growS(self, old_n, old_n + 1);
    char* p = asCharsS(self);
    p[old_n] = c;
    p[old_n + 1] = '\0';
    _setInvariantS(self, old_n + 1);
}

void appendRuneS(String* self, int rune) {
    unsigned int urune = (unsigned int) rune;
    intptr_t old_n = sizeS(self);
    if (urune < 0x00000080u) {
        _growS(self, old_n, old_n + 1);
        char* p = asCharsS(self);
        p[old_n] = (char) rune;
        p[old_n + 1] = '\0';
        _setInvariantS(self, old_n + 1);
    } else if (urune < 0x00000800u) {
        _growS(self, old_n, old_n + 2);
        char* p = asCharsS(self);
        p[old_n] = (char) ((urune >> 6) | 0x000000C0u);
        p[old_n + 1] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = '\0';
        _setInvariantS(self, old_n + 2);
    } else if (urune < 0x00010000u) {
        _growS(self, old_n, old_n + 3);
        char* p = asCharsS(self);
        p[old_n] = (char) ((urune >> 12) | 0x000000E0u);
        p[old_n + 1] = (char) (((urune >> 6) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 3] = '\0';
        _setInvariantS(self, old_n + 3);
    } else {
        _growS(self, old_n, old_n + 4);
        char* p = asCharsS(self);
        p[old_n] = (char) ((urune >> 18) | 0x000000F0u);
        p[old_n + 1] = (char) (((urune >> 12) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 2] = (char) (((urune >> 6) & 0x0000003Fu) | 0x00000080u);
        p[old_n + 3] = (char) ((urune & 0x0000003Fu) | 0x00000080u);
        p[old_n + 4] = '\0';
        _setInvariantS(self, old_n + 4);
    }
}

void appendCharsS(String* self, const char* cstr) {
    intptr_t old_n = sizeS(self);
    intptr_t n0 = sizeCS(cstr);
    _growS(self, old_n, old_n + n0);
    char* p = asCharsS(self);
    memcpy(p + old_n, cstr, n0);
    p[old_n + n0] = '\0';
    _setInvariantS(self, old_n + n0);
}

void appendStringS(String* self, String* s) {
    intptr_t old_n = sizeS(self);
    intptr_t n0 = sizeS(s);
    _growS(self, old_n, old_n + n0);
    char* p = asCharsS(self);
    memcpy(p + old_n, asCharsS(s), n0);
    p[old_n + n0] = '\0';
    _setInvariantS(self, old_n + n0);
}

void insertCharS(String* self, intptr_t i, char c) {
    intptr_t old_size = sizeS(self);
    intptr_t old_capacity = capacityS(self);
    bool old_is_small = isSmallS(self);
    char* p = asCharsS(self);
    if (old_size + 1 <= old_capacity) {
        for (intptr_t k = old_size; k >= i + 1; k--) {
            p[k] = p[k - 1];
        }
        p[i] = c;
        if (old_is_small) {
            _setSmallS(self, old_size + 1);
        } else {
            _setLargeS(self, old_size + 1, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + 1);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        new_p[i] = c;
        memcpy(new_p + i + 1, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeS(self, old_size + 1, r);
    }
}

void insertCharsS(String* self, intptr_t i, const char* cstr) {
    intptr_t n = sizeCS(cstr);
    intptr_t old_size = sizeS(self);
    intptr_t old_capacity = capacityS(self);
    bool old_is_small = isSmallS(self);
    char* p = asCharsS(self);
    if (old_size + n <= old_capacity) {
        for (intptr_t k = old_size + (n - 1); k >= i + n; k--) {
            p[k] = p[k - n];
        }
        memcpy(p + i, cstr, n);
        if (old_is_small) {
            _setSmallS(self, old_size + n);
        } else {
            _setLargeS(self, old_size + n, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + n);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        memcpy(new_p + i, cstr, n);
        memcpy(new_p + i + n, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeS(self, old_size + n, r);
    }
}

void insertStringS(String* self, intptr_t i, String* s) {
    intptr_t n = sizeS(s);
    intptr_t old_size = sizeS(self);
    intptr_t old_capacity = capacityS(self);
    bool old_is_small = isSmallS(self);
    char* p = asCharsS(self);
    if (old_size + n <= old_capacity) {
        for (intptr_t k = old_size + (n - 1); k >= i + n; k--) {
            p[k] = p[k - n];
        }
        memcpy(p + i, asCharsS(s), n);
        if (old_is_small) {
            _setSmallS(self, old_size + n);
        } else {
            _setLargeS(self, old_size + n, old_capacity);
        }
    } else {
        intptr_t r = _nextCapacity(old_size + n);
        char* new_p = malloc((r + 1) * sizeof(char));
        memcpy(new_p, p, i);
        memcpy(new_p + i, asCharsS(s), n);
        memcpy(new_p + i + n, p + i, old_size - i);
        self->_large._data = new_p;
        _setLargeS(self, old_size + n, r);
    }
}

bool startsWithCharsS(String* self, const char* cstr) {
    intptr_t n = sizeS(self);
    const char* a = asCharsS(self);
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

bool startsWithStringS(String* self, String* s) {
    intptr_t n = sizeS(self);
    intptr_t m = sizeS(s);
    if (m > n) {
        return false;
    }
    const char* a = asCharsS(self);
    const char* b = asCharsS(s);
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

bool endsWithCharsS(String* self, const char* cstr) {
    intptr_t n = sizeS(self);
    intptr_t m = sizeCS(cstr);
    if (m > n) {
        return false;
    }
    const char* a = asCharsS(self);
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

bool endsWithStringS(String* self, String* s) {
    intptr_t n = sizeS(self);
    intptr_t m = sizeS(s);
    if (m > n) {
        return false;
    }
    const char* a = asCharsS(self);
    const char* b = asCharsS(s);
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

void clearS(String* self) {
    if (isSmallS(self)) {
        self->_small[0] = '\0';
        _setSmallS(self, 0);
    } else {
        self->_large._data[0] = '\0';
        _setLargeS(self, 0, capacityS(self));
    }
}

intptr_t _nextCapacity(intptr_t r) {
    return (intptr_t) ((((uintptr_t) r) + ((uintptr_t) 7)) & ~((uintptr_t) 7));
}

void _setSmallS(String* s, intptr_t n) {
    unsigned char value = (unsigned char) n;
    s->_small[sizeof(_LargeString) - 1] = value;
}

void _setLargeS(String* s, intptr_t n, intptr_t r) {
    s->_large._size = n;
    s->_large._capacity = (((uintptr_t) r) >> 3) | (((uintptr_t) 0x80) << ((sizeof(uintptr_t) - 1) * 8));
}

void _growS(String* self, intptr_t n_to_copy, intptr_t n) {
    bool old_is_small = isSmallS(self);
    char* old_data = asCharsS(self);
    intptr_t old_capacity = capacityS(self);
    if (n <= sizeof(_LargeString) - 2) {
        if (!old_is_small) {
            memcpy(self->_small, old_data, n_to_copy);
        }
        _setSmallS(self, n);
    } else if (n <= old_capacity) {
        _setLargeS(self, n, old_capacity);
    } else {
        intptr_t r = _nextCapacity(n);
        char* p = malloc((r + 1) * sizeof(char));
        memcpy(p, old_data, n_to_copy);
        self->_large._data = p;
        if (!old_is_small) {
            free(old_data);
        }
        _setLargeS(self, n, r);
    }
}

void _setInvariantS(String* self, intptr_t n) {
    if (isSmallS(self)) {
        _setSmallS(self, n);
    } else {
        _setLargeS(self, n, capacityS(self));
    }
}

void deleteS(String* s) {
    releaseS(s);
    free(s);
}

void releaseS(String* s) {
    if (!isSmallS(s)) {
        free(s->_large._data);
    }
}
#endif //MAGNOLIA_MSTRING_H
