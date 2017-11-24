;; layer: [0-]
;; position: [0-layer]
(define (elem-pascal layer position)
  (cond
    ((or (= position 0) (= position layer)) 1)
    (else (+
           (elem-pascal (- layer 1) position)
           (elem-pascal (- layer 1) (- position 1))))))


(pretty-print (elem-pascal 4 2))
