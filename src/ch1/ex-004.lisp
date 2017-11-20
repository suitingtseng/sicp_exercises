(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(pretty-print (a-plus-abs-b 10 5))
(pretty-print (a-plus-abs-b 10 -5))
