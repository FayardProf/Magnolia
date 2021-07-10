//
// Created by François Fayard on 29/06/2021.
//

#ifndef MAGNOLIA_ARRAYD_H
#define MAGNOLIA_ARRAYD_H

#include "stdlib.h"
#include "string.h"
#include "stdint.h"

struct ArrayD {
    double* at;
    intptr_t _size;
    intptr_t _capacity;
};

struct ArrayD* newArrayD();
struct ArrayD* initArrayD(struct ArrayD* mem);
struct ArrayD* copyArrayD(struct ArrayD* other);

intptr_t sizeArrayD(struct ArrayD* self);
intptr_t capacityArrayD(struct ArrayD* self);
double backArrayD(const struct ArrayD* self);
void resizeArrayD(struct ArrayD* self, intptr_t n);
void reserveArrayD(struct ArrayD* self, intptr_t r);
void appendArrayD(struct ArrayD* self, double x);
double popArrayD(struct ArrayD* self);

void deleteArrayD(struct ArrayD* self);
void releaseArrayD(struct ArrayD* self);

void _increaseCapacityArrayD(struct ArrayD* self, intptr_t r);

struct ArrayD* newArrayD() {
    struct ArrayD* mem = malloc(sizeof(struct ArrayD));
    return initArrayD(mem);
}

struct ArrayD* initArrayD(struct ArrayD* mem) {
    mem->at = NULL;
    mem->_size = 0;
    mem->_capacity = 0;
    return mem;
}

struct ArrayD* copyArrayD(struct ArrayD* other) {
    struct ArrayD* ans = malloc(sizeof(struct ArrayD));
    intptr_t n = other->_size;
    ans->at = malloc(n * sizeof(double));
    memcpy(ans->at, other->at, n * sizeof(double));
    ans->_size = n;
    ans->_capacity = n;
    return ans;
}

intptr_t sizeArrayD(struct ArrayD* self) {
    return self->_size;
}
intptr_t capacityArrayD(struct ArrayD* self) {
    return self->_capacity;
}

double backArrayD(const struct ArrayD* self) {
   return self->at[self->_size - 1];
}

void resizeArrayD(struct ArrayD* self, intptr_t n) {
    if (n > self->_capacity) {
        _increaseCapacityArrayD(self, n);
    }
    self->_size = n;
}

void reserveArrayD(struct ArrayD* self, intptr_t r) {
    if (r > self->_capacity) {
        _increaseCapacityArrayD(self, r);
    }
    self->_capacity = r;
}

void appendArrayD(struct ArrayD* self, double x) {
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

double popArrayD(struct ArrayD* self) {
    intptr_t n = self->_size;
    --self->_size;
    return self->at[n - 1];
}

void _increaseCapacityArrayD(struct ArrayD* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->_size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->_capacity = r;
}

void deleteArrayD(struct ArrayD* self) {
    releaseArrayD(self);
    free(self);
}

void releaseArrayD(struct ArrayD* self) {
    free(self->at);
}

#endif //MAGNOLIA_ARRAYD_H
