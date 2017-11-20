(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(pretty-print (sqrt 2))
;; if is a special form uses normal order: first eval predicate. then decides
;; which to continue
;; on the other hand, new-if is a normal function. Lisp uses applicative model
;; which evaluate all operator and operands and therefore introduces intinite
;; loop in it's else-clause.
