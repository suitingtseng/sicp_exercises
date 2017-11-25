(define (repeated f n)
  (lambda (x)
    (if (= n 0)
        x
        ((repeated f (- n 1)) (f x)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2.0))

(define (log2 x) (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (log2 n)))
                (lambda (t) (/ x (expt t (- n 1)))))
               1)
)

(printf "32 ^ (1/5) = ~f\n" (nth-root 32 5))
(printf "2 ^ (1/6) = ~f\n" (nth-root 2 6))
(printf "2 ^ (1/8) = ~f\n" (nth-root 2 8))
(printf "2 ^ (1/10) = ~f\n" (nth-root 2 10))
(printf "2 ^ (1/12) = ~f\n" (nth-root 2 12))
