(define (cont-frac-iterative n d k)
  (define (iter k accu)
    (if (= k 0)
        accu
        (iter (- k 1) (/ (n k) (+ (d k) accu)))))
  (iter k 0))


(printf "e = ~f\n" (+ (cont-frac-iterative
                        (lambda (x) 1)
                        (lambda (x)
                          (if (= (remainder x 3) 2)
                              (* 2 (/ (+ x 1) 3))
                              1))
                        1000)
                      2))
