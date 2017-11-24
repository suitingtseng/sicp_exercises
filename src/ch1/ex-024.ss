(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (fast-prime? n 12))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square (expmod base (/ exp 2) m))
                m))
    (else
     (remainder (* base (expmod base (- exp 1) m))
                m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)))

(define (square x) (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (real-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (real-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from n)
   (if (> n 0)
     (cond
       ((even? from) (search-for-primes (+ from 1) n))
       ((prime? from)
        (begin
         (timed-prime-test from)
         (search-for-primes (+ from 2) (- n 1))))
       (else (search-for-primes (+ from 2) n)))))

(define (even? n) (= 0 (remainder n 2)))

(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)
(search-for-primes 1000000000000000 3)
(search-for-primes 10000000000000000 3)
