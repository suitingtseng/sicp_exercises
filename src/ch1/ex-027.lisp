(define (show-carmichael n) (iter-carmichael n 1))

(define (iter-carmichael n a)
  (if (< a n)
    (begin
     (printf "~d ^ ~d (mod ~d) = ~d\n" a n n (expmod a n n))
     (iter-carmichael n (+ a 1)))))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square (expmod base (/ exp 2) m))
                m))
    (else
     (remainder (* base (expmod base (- exp 1) m))
                m))))

(define (square x) (* x x))

(show-carmichael 561)
