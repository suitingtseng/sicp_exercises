(define (cont-frac-iterative n d k)
  (define (iter k accu)
    ;(printf "~f/~f\n" (n k) (d k))
    (if (= k 0)
        accu
        (iter (- k 1) (/ (n k) (+ (d k) accu)))))
  (iter k 0))

(define (tan-cf x k)
  (define (n k) (if (= k 1)
                    x
                    (* x x (- 1))))
  (define (d k) (- (* k 2) 1))
  (cont-frac-iterative n d k))

(printf "tan 45 degree = ~f\n" (tan-cf 0.785398 10000))
(printf "tan 1 = ~f\n" (tan-cf 1 1000))
(printf "tan 2 = ~f\n" (tan-cf 2 1000))
