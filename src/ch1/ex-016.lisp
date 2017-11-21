(define (iterate-exp b n) (imp 1 b n))

(define (imp a b n)
  (cond
    ((= n 0) a)
    ((odd n) (imp (* a b) b (- n 1)))
    (else (imp a (* b b) (/ n 2)))))

(define (odd n) (= 1 (remainder n 2)))

(pretty-print (iterate-exp 2 31))
(pretty-print (iterate-exp 2 32))
(pretty-print (iterate-exp 2 63))
(pretty-print (iterate-exp 2 64))
(pretty-print (iterate-exp 9 9))
