(define (filtered-accumulate combiner null-value term filter a next b)
  (define (iter a accu)
    (if (> a b)
        accu
        (iter (next a) (combiner accu (if (filter a)
                                          (term a)
                                          null-value)))))
  (iter a null-value))

(define (filter-sum term filter a next b) (filtered-accumulate + 0 term filter a next b))

(define (add-one x) (+ x 1))

(define (identity x) x)

(define (odd? x) (= 1 (remainder x 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n
                            (if (= test-divisor 2)
                              3
                              (+ test-divisor 2))))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(define (relative-prime? n)
  (define (f x) (= 1 (gcd n x)))
  f)

(define (sum-of-all-relative-prime n) (filter-sum identity (relative-prime? n) 2 add-one n))

(pretty-print (filter-sum identity prime? 2 add-one 20))
(pretty-print (sum-of-all-relative-prime 10))
