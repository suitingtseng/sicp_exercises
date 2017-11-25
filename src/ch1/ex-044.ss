(define (repeated f n)
  (lambda (x)
    (if (= n 0)
        x
        ((repeated f (- n 1)) (f x)))))

(define dx 0.0001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (n-smooth f n) ((repeated smooth n) f))

(define (cube x) (* x x x))

(printf "(cube 1.5) = ~f\n" (cube 1.5))
(printf "((smooth cube) 1.5)) = ~f\n" ((smooth cube) 1.5))
(printf "((n-smooth cube 3) 1.5) = ~f\n" ((n-smooth cube 3) 1.5))
