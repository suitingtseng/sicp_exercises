(define (cbrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (cbrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (/ (+ (/ x (power guess 2)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (power guess 3) x)) 0.001))

(define (power x n) (power_imp x n 1))

(define (power_imp x n cur)
  (if (= n 0)
    cur
    (power_imp x (- n 1) (* cur x))))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(pretty-print (cbrt 8))
(pretty-print (cbrt 100))
(pretty-print (cbrt 1000))
