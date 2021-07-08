//
// Created by François Fayard on 29/06/2021.
//

#ifndef MAGNOLIA_VECTOR_D_H
#define MAGNOLIA_VECTOR_D_H

#include "stdlib.h"
#include "string.h"
#include "stdint.h"

struct vector_d {
    double* at;
    intptr_t size;
    intptr_t capacity;
};

struct vector_d new_vector_d(intptr_t n);
struct vector_d copy_vector_d(const struct vector_d* other);

double back_vector_d(const struct vector_d* self);
void resize_vector_d(struct vector_d* self, intptr_t n);
void reserve_vector_d(struct vector_d* self, intptr_t r);
void append_vector_d(struct vector_d* self, double x);
double pop_vector_d(struct vector_d* self);

void delete_vector_d(struct vector_d* self);

void _increase_capacity_vector_d(struct vector_d* self, intptr_t r);

struct vector_d new_vector_d(intptr_t n) {
    struct vector_d ans;
    ans.at = malloc(n * sizeof(double));
    ans.size = n;
    ans.capacity = n;
    return ans;
}

struct vector_d copy_vector_d(const struct vector_d* other) {
    struct vector_d ans;
    intptr_t n = other->size;
    ans.at = malloc(n * sizeof(double));
    memcpy(ans.at, other->at, n * sizeof(double));
    ans.size = n;
    ans.capacity = n;
    return ans;
}

double back_vector_d(const struct vector_d* self) {
   return self->at[self->size - 1];
}

void resize_vector_d(struct vector_d* self, intptr_t n) {
    if (n > self->capacity) {
        _increase_capacity_vector_d(self, n);
    }
    self->size = n;
}

void reserve_vector_d(struct vector_d* self, intptr_t r) {
    if (r > self->capacity) {
        _increase_capacity_vector_d(self, r);
    }
    self->capacity = r;
}

void append_vector_d(struct vector_d* self, double x) {
    intptr_t n = self->size;
    if (self->capacity == n) {
        intptr_t r = n > 1 ? 2 * n : n + 1;
        _increase_capacity_vector_d(self, r);
        self->at[n] = x;
    } else {
        self->at[n] = x;
    }
    ++self->size;
}

double pop_vector_d(struct vector_d* self) {
    intptr_t n = self->size;
    --self->size;
    return self->at[n - 1];
}

void _increase_capacity_vector_d(struct vector_d* self, intptr_t r) {
    double* new_at = malloc(r * sizeof(double));
    if (self->at) {
        memcpy(new_at, self->at, self->size * sizeof(double));
        free(self->at);
    }
    self->at = new_at;
    self->capacity = r;
}

void delete_vector_d(struct vector_d* self) {
    free(self->at);
    self->at = NULL;
    self->size = 0;
    self->capacity = 0;
}

#endif //MAGNOLIA_VECTOR_D_H
