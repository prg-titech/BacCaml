#ifndef RUNTIMR_CAML_H
#define RUNTIME_CAML_H

#include <caml/mlvalues.h>

value call_caml_jit_tracing(int *, int, int *,
                            int) asm("call_caml_jit_tracing");

value call_caml_jit_method(int *, int, int *, int) asm("call_caml_jit_method");

value call_caml_jit_setup(int *, int, int *, int) asm("call_caml_jit_setup");

#endif /* RUNTIME_CAML_H */
