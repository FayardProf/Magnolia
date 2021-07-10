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
    intptr_t size;
    intptr_t capacity;
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
    mem->size = 0;
    mem->capacity = 0;
    return mem;
}

struct ArrayD* copyArrayD(struct ArrayD* other) {
    struct ArrayD* ans = malloc(sizeof(struct ArrayD));
    intptr_t n = other->size;
    ans->at = malloc(n * sizeof(double));
    memcpy(ans->at, other->at, n * sizeof(double));
    ans->size = n;
    ans->capacity = n;
    return ans;
}

intptr_t sizeArrayD(struct ArrayD* self) {
    return self->size;
}
intptr_t capacityArrayD(struct ArrayD* self) {
    return self->capacity;
}

double backArrayD(const struct ArrayD* self) {
   return self->at[self->size - 1];
}

void resizeArrayD(struct ArrayD* self, intptr_t n) {
    if (n > self->capacity) {
        _increaseCapacityArrayD(self, n);
    }
    self->size = n;
}

void reserveArrayD(struct ArrayD* self, intptr_t r) {
    if (r > self->capacity) {
        _increaseCapacityArrayD(self, r);
    }
    self->capacity = r;
}

void appendArrayD(struct ArrayD* self, double x) {
    intptr_t n = self->size;
    if (self->capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increaseCapacityArrayD(self, r);
        self->at[n] = x;
    } else {
        self->at[n] = x;
    }
    ++self->size;
}

double popArrayD(struct ArrayD* self) {
    intptr_t n = self->size;
    --self->size;
    return self->at[n - 1];
}

void _increaseCapacityArrayD(struct ArrayD* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->capacity = r;
}

void deleteArrayD(struct ArrayD* self) {
    releaseArrayD(self);
    free(self);
}

void releaseArrayD(struct ArrayD* self) {
    free(self->at);
}

#endif //MAGNOLIA_ARRAYD_H
