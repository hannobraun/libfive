#|
Guile bindings to the libfive CAD kernel

DO NOT EDIT BY HAND!
This file is automatically generated from libfive/stdlib/stdlib.h

It was last generated on 2021-05-14 18:36:36 by user moritz
|#

(define-module (libfive stdlib generators))
(use-modules (system foreign) (libfive lib) (libfive kernel) (libfive vec))

(define ffi_array-x (pointer->procedure '*
  (dynamic-func "libfivestd_array_x" stdlib)
  (list '* int '*)))
(define* (array-x shape nx dx)
  "array-x shape nx dx
  Iterates a part in a 1D array"
  (ptr->shape (ffi_array-x
    (shape->ptr (ensure-shape shape))
    nx
    (shape->ptr (ensure-shape dx)))))
(export array-x)

(define ffi_array-xy (pointer->procedure '*
  (dynamic-func "libfivestd_array_xy" stdlib)
  (list '* int int (list '* '*))))
(define* (array-xy shape nx ny delta)
  "array-xy shape nx ny delta
  Iterates a part in a 2D array"
  (ptr->shape (ffi_array-xy
    (shape->ptr (ensure-shape shape))
    nx
    ny
    (vec2->tvec2 delta))))
(export array-xy)

(define ffi_array-xyz (pointer->procedure '*
  (dynamic-func "libfivestd_array_xyz" stdlib)
  (list '* int int int (list '* '* '*))))
(define* (array-xyz shape nx ny nz delta)
  "array-xyz shape nx ny nz delta
  Iterates a part in a 3D array"
  (ptr->shape (ffi_array-xyz
    (shape->ptr (ensure-shape shape))
    nx
    ny
    nz
    (vec3->tvec3 delta))))
(export array-xyz)

(define ffi_array-polar-z (pointer->procedure '*
  (dynamic-func "libfivestd_array_polar_z" stdlib)
  (list '* int (list '* '*))))
(define* (array-polar-z shape n #:optional (center #[0 0]))
  "array-polar-z shape n #:optional (center #[0 0])
  Iterates a shape about an optional center position"
  (ptr->shape (ffi_array-polar-z
    (shape->ptr (ensure-shape shape))
    n
    (vec2->tvec2 center))))
(export array-polar-z)

(define ffi_extrude-z (pointer->procedure '*
  (dynamic-func "libfivestd_extrude_z" stdlib)
  (list '* '* '*)))
(define* (extrude-z t zmin zmax)
  "extrude-z t zmin zmax
  Extrudes a 2D shape between zmin and zmax"
  (ptr->shape (ffi_extrude-z
    (shape->ptr (ensure-shape t))
    (shape->ptr (ensure-shape zmin))
    (shape->ptr (ensure-shape zmax)))))
(export extrude-z)

(define-public array-polar array-polar-z)