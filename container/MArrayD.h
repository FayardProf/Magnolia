//
// Created by François Fayard on 29/06/2021.
//

#ifndef MAGNOLIA_MARRAYD_H
#define MAGNOLIA_MARRAYD_H

#include "stdlib.h"
#include "MString.h"
#include "stdint.h"

struct ArrayD_s {
    double* at;
    intptr_t _size;
    intptr_t _capacity;
};
typedef struct ArrayD_s ArrayD;

ArrayD* newArrayD();
ArrayD* initArrayD(ArrayD* mem);
ArrayD* copyArrayD(ArrayD* other);

intptr_t sizeArrayD(ArrayD* self);
intptr_t capacityArrayD(ArrayD* self);
double backArrayD(const ArrayD* self);
void resizeArrayD(ArrayD* self, intptr_t n);
void reserveArrayD(ArrayD* self, intptr_t r);
void appendArrayD(ArrayD* self, double x);
double popArrayD(ArrayD* self);

void deleteArrayD(ArrayD* self);
void releaseArrayD(ArrayD* self);

void _increaseCapacityArrayD(ArrayD* self, intptr_t r);

ArrayD* newArrayD() {
    ArrayD* mem = malloc(sizeof(ArrayD));
    return initArrayD(mem);
}

ArrayD* initArrayD(ArrayD* mem) {
    mem->at = NULL;
    mem->_size = 0;
    mem->_capacity = 0;
    return mem;
}

ArrayD* copyArrayD(ArrayD* other) {
    ArrayD* ans = malloc(sizeof(ArrayD));
    intptr_t n = other->_size;
    ans->at = malloc(n * sizeof(double));
    memcpy(ans->at, other->at, n * sizeof(double));
    ans->_size = n;
    ans->_capacity = n;
    return ans;
}

intptr_t sizeArrayD(ArrayD* self) {
    return self->_size;
}
intptr_t capacityArrayD(ArrayD* self) {
    return self->_capacity;
}

double backArrayD(const ArrayD* self) {
   return self->at[self->_size - 1];
}

void resizeArrayD(ArrayD* self, intptr_t n) {
    if (n > self->_capacity) {
        _increaseCapacityArrayD(self, n);
    }
    self->_size = n;
}

void reserveArrayD(ArrayD* self, intptr_t r) {
    if (r > self->_capacity) {
        _increaseCapacityArrayD(self, r);
    }
    self->_capacity = r;
}

void appendArrayD(ArrayD* self, double x) {
    intptr_t n = self->_size;
    if (self->_capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increaseCapacityArrayD(self, r);
        self->at[n] = x;
    } else {
        self->at[n] = x;
    }
    ++self->_size;
}

double popArrayD(ArrayD* self) {
    intptr_t n = self->_size;
    --self->_size;
    return self->at[n - 1];
}

void _increaseCapacityArrayD(ArrayD* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->_size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->_capacity = r;
}

void deleteArrayD(ArrayD* self) {
    releaseArrayD(self);
    free(self);
}

void releaseArrayD(ArrayD* self) {
    free(self->at);
    self->_size = 0;
    self->_capacity = 0;
}

#endif //MAGNOLIA_MARRAYD_H
