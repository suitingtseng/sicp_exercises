(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (iter n)
    (if (> (remainder (/ z (expt 2 n)) 2) 0)
        n
        (iter (+ n 1))))
  (iter 0))

(define (cdr z)
  (define (iter n)
    (if (> (remainder (/ z (expt 3 n)) 3) 0)
        n
        (iter (+ n 1))))
  (iter 0))



(printf "(car (cons 3 5)) = ~d\n" (car (cons 3 5)))
(printf "(cdr (cons 3 5)) = ~d\n" (cdr (cons 3 5)))
