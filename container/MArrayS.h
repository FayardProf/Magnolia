//
// Created by François Fayard on 11/07/2021.
//

#ifndef MAGNOLIA_MARRAYS_H
#define MAGNOLIA_MARRAYS_H

#include "stdlib.h"
#include "MString.h"
#include "stdint.h"

struct VArrayS_s {
    String* at;
    intptr_t size;
};
typedef struct VArrayS_s VArrayS;

struct ArrayS_s {
    String* at;
    intptr_t _size;
    intptr_t _capacity;
};
typedef struct ArrayS_s ArrayS;

ArrayS* newAs();
ArrayS* initAs(ArrayS* mem);
ArrayS* initCopyAs(ArrayS* mem, ArrayS* other);
ArrayS* copyAs(ArrayS* other);

intptr_t sizeAs(ArrayS* self);
intptr_t capacityAs(ArrayS* self);
VArrayS viewAs(ArrayS* self);
String* backAs(ArrayS* self);
void resizeAs(ArrayS* self, intptr_t n);
void reserveAs(ArrayS* self, intptr_t r);
void appendCopyAs(ArrayS* self, String* s);
void appendMoveAs(ArrayS* self, String* s);
String* popAs(ArrayS* self);

void deleteAs(ArrayS* self);
void releaseAs(ArrayS* self);

void _increaseCapacityAs(ArrayS* self, intptr_t r);

ArrayS* newAs() {
    ArrayS* mem = malloc(sizeof(ArrayS));
    return initAs(mem);
}

ArrayS* initAs(ArrayS* mem) {
    mem->at = NULL;
    mem->_size = 0;
    mem->_capacity = 0;
    return mem;
}

ArrayS* copyAs(ArrayS* other) {
    ArrayS* ans = malloc(sizeof(ArrayS));
    intptr_t n = other->_size;
    ans->at = malloc(n * sizeof(String));
    memcpy(ans->at, other->at, n * sizeof(String));
    ans->_size = n;
    ans->_capacity = n;
    return ans;
}

intptr_t sizeAs(ArrayS* self) {
    return self->_size;
}
intptr_t capacityAs(ArrayS* self) {
    return self->_capacity;
}

VArrayS viewAs(ArrayS* self) {
    VArrayS ans;
    ans.at = self->at;
    ans.size = self->_size;
    return ans;
}

String* backAs(ArrayS* self) {
    return self->at + (self->_size - 1);
}

void resizeAs(ArrayS* self, intptr_t n) {
    if (n > self->_capacity) {
        _increaseCapacityAs(self, n);
    }
    self->_size = n;
}

void reserveAs(ArrayS* self, intptr_t r) {
    if (r > self->_capacity) {
        _increaseCapacityAs(self, r);
    }
    self->_capacity = r;
}

void appendCopyAs(ArrayS* self, String* s) {
    intptr_t n = self->_size;
    if (self->_capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increaseCapacityAs(self, r);
    }
    initCopyS(self->at + n, s);
    ++(self->_size);
}

void appendMoveAs(ArrayS* self, String* s) {
    intptr_t n = self->_size;
    if (self->_capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increaseCapacityAs(self, r);
    }
    initMoveS(self->at + n, s);
    ++(self->_size);
}

String* popAs(ArrayS* self) {
    intptr_t n = self->_size;
    --(self->_size);
    return self->at + (n - 1);
}

void _increaseCapacityAs(ArrayS* self, intptr_t r) {
    String* new_at = malloc(r * sizeof(String));
    if (self->at) {
        memcpy(new_at, self->at, self->_size * sizeof(String));
        free(self->at);
    }
    self->at = new_at;
    self->_capacity = r;
}

void deleteAs(ArrayS* self) {
    releaseAs(self);
    free(self);
}

void releaseAs(ArrayS* self) {
    free(self->at);
}
#endif //MAGNOLIA_MARRAYS_H
