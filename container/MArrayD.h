//
// Created by François Fayard on 29/06/2021.
//

#ifndef MAGNOLIA_MARRAYD_H
#define MAGNOLIA_MARRAYD_H

#include "stdlib.h"
#include "MString.h"
#include "stdint.h"

struct VArrayD_s {
    double* at;
    intptr_t _size;
};
typedef struct VArrayD_s VArrayD;

struct ArrayD_s {
    double* at;
    intptr_t _size;
    intptr_t _capacity;
};
typedef struct ArrayD_s ArrayD;

ArrayD* newAd();
ArrayD* initAd(ArrayD* mem);
ArrayD* copyAd(ArrayD* other);

intptr_t sizeAd(ArrayD* self);
intptr_t capacityAd(ArrayD* self);
VArrayD viewAd(ArrayD* self);
double backAd(ArrayD* self);
void resizeAd(ArrayD* self, intptr_t n);
void reserveAd(ArrayD* self, intptr_t r);
void appendAd(ArrayD* self, double x);
double popAd(ArrayD* self);

void deleteAd(ArrayD* self);
void releaseAd(ArrayD* self);

void _increaseCapacityAd(ArrayD* self, intptr_t r);

ArrayD* newAd() {
    ArrayD* mem = malloc(sizeof(ArrayD));
    return initAd(mem);
}

ArrayD* initAd(ArrayD* mem) {
    mem->at = NULL;
    mem->_size = 0;
    mem->_capacity = 0;
    return mem;
}

ArrayD* copyAd(ArrayD* other) {
    ArrayD* ans = malloc(sizeof(ArrayD));
    intptr_t n = other->_size;
    ans->at = malloc(n * sizeof(double));
    memcpy(ans->at, other->at, n * sizeof(double));
    ans->_size = n;
    ans->_capacity = n;
    return ans;
}

intptr_t sizeAd(ArrayD* self) {
    return self->_size;
}
intptr_t capacityAd(ArrayD* self) {
    return self->_capacity;
}

VArrayD viewAd(ArrayD* self) {
    VArrayD ans;
    ans.at = self->at;
    ans._size = self->_size;
    return ans;
}

double backAd(ArrayD* self) {
   return self->at[self->_size - 1];
}

void resizeAd(ArrayD* self, intptr_t n) {
    if (n > self->_capacity) {
        _increaseCapacityAd(self, n);
    }
    self->_size = n;
}

void reserveAd(ArrayD* self, intptr_t r) {
    if (r > self->_capacity) {
        _increaseCapacityAd(self, r);
    }
    self->_capacity = r;
}

void appendAd(ArrayD* self, double x) {
    intptr_t n = self->_size;
    if (self->_capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increaseCapacityAd(self, r);
    }
    self->at[n] = x;
    ++self->_size;
}

double popAd(ArrayD* self) {
    intptr_t n = self->_size;
    --self->_size;
    return self->at[n - 1];
}

void _increaseCapacityAd(ArrayD* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->_size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->_capacity = r;
}

void deleteAd(ArrayD* self) {
    releaseAd(self);
    free(self);
}

void releaseAd(ArrayD* self) {
    free(self->at);
}

#endif //MAGNOLIA_MARRAYD_H
