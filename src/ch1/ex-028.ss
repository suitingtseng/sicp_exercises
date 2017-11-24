(define (prime? n)
  (fast-prime? n (/ n 2)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square
                 (if (and
                      (not (= (expmod base (/ exp 2) m) 1))
                      (not (= (expmod base (/ exp 2) m) (- m 1)))
                      (= 1 (remainder (square (expmod base (/ exp 2) m)) m)))
                   0
                   (expmod base (/ exp 2) m)))
                m))
    (else
     (remainder (* base (expmod base (- exp 1) m))
                m))))

(define (fermat-test n)
  (define (try-it a)
    (define a-n-mod-n (expmod a n n))
    (and
     (= a-n-mod-n a)
     (not (= a-n-mod-n 0))))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond
    ((<= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)))

(define (square x) (* x x))

(define (print-is-prime n)
  (printf "(prime? ~d) => ~s\n" n (prime? n)))

(print-is-prime 199)
(print-is-prime 561)
(print-is-prime 1105)
