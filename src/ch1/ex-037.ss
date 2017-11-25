(define (cont-frac-iterative n d k)
  (define (iter k accu)
    (if (= k 0)
        accu
        (iter (- k 1) (/ (n k) (+ (d k) accu)))))
  (iter k 0))

(define (cont-frac-recursive n d k)
  (define (reverse-frac i)
        (/ (n k) (+ (d k) (if (= i k)
                           0
                           (reverse-frac (+ i 1))))))
  (reverse-frac 1))

(printf "golden ratio = ~f (iterative)\n" (cont-frac-iterative
                                                 (lambda (i) 1.0)
                                                 (lambda (i) 1.0)
                                                 100))

(printf "golden ratio = ~f (recursive)\n" (cont-frac-recursive
                                                 (lambda (i) 1.0)
                                                 (lambda (i) 1.0)
                                                 100))
