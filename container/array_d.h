//
// Created by François Fayard on 29/06/2021.
//

#ifndef MAGNOLIA_ARRAY_D_H
#define MAGNOLIA_ARRAY_D_H

#include "stdlib.h"
#include "string.h"
#include "stdint.h"

struct array_d {
    double* at;
    intptr_t size;
    intptr_t capacity;
};

struct array_d* new_array_d(intptr_t n);
struct array_d* new_empty_array_d();
struct array_d* copy_array_d(const struct array_d* other);

intptr_t size_array_d(const struct array_d* self);
intptr_t capacity_array_d(const struct array_d* self);
double back_array_d(const struct array_d* self);
void resize_array_d(struct array_d* self, intptr_t n);
void reserve_array_d(struct array_d* self, intptr_t r);
void append_array_d(struct array_d* self, double x);
double pop_array_d(struct array_d* self);

void delete_array_d(struct array_d* self);

void _increase_capacity_array_d(struct array_d* self, intptr_t r);

struct array_d* new_empty_array_d() {
    return new_array_d(0);
}

struct array_d* new_array_d(intptr_t n) {
    struct array_d* ans = malloc(sizeof(struct array_d));
    ans->at = malloc(n * sizeof(double));
    ans->size = n;
    ans->capacity = n;
    return ans;
}

struct array_d* copy_array_d(const struct array_d* other) {
    struct array_d* ans = malloc(sizeof(struct array_d));
    intptr_t n = other->size;
    ans->at = malloc(n * sizeof(double));
    memcpy(ans->at, other->at, n * sizeof(double));
    ans->size = n;
    ans->capacity = n;
    return ans;
}

intptr_t size_array_d(const struct array_d* self) {
    return self->size;
}
intptr_t capacity_array_d(const struct array_d* self) {
    return self->capacity;
}

double back_array_d(const struct array_d* self) {
   return self->at[self->size - 1];
}

void resize_array_d(struct array_d* self, intptr_t n) {
    if (n > self->capacity) {
        _increase_capacity_array_d(self, n);
    }
    self->size = n;
}

void reserve_array_d(struct array_d* self, intptr_t r) {
    if (r > self->capacity) {
        _increase_capacity_array_d(self, r);
    }
    self->capacity = r;
}

void append_array_d(struct array_d* self, double x) {
    intptr_t n = self->size;
    if (self->capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increase_capacity_array_d(self, r);
        self->at[n] = x;
    } else {
        self->at[n] = x;
    }
    ++self->size;
}

double pop_array_d(struct array_d* self) {
    intptr_t n = self->size;
    --self->size;
    return self->at[n - 1];
}

void _increase_capacity_array_d(struct array_d* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->capacity = r;
}

void delete_array_d(struct array_d* self) {
    free(self->at);
    free(self);
}

#endif //MAGNOLIA_ARRAY_D_H
