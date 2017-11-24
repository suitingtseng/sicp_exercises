(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* a (product-recursive term (next a) next b))))

(define (identity x) x)

(define (add-one x) (+ x 1))

(define (add-two x) (+ x 2))

(define (my-func x) (/ (* (- x 1) (+ x 1)) (* x x)))

(pretty-print (product-iterative identity 1 add-one 10))
(pretty-print (product-recursive identity 1 add-one 10))
(printf "pi = ~f\n" (* 4 (product-iterative my-func 3 add-two 10000)))
