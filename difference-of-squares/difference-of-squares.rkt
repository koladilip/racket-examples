#lang racket

(provide sum-of-squares square-of-sum difference)

; Using math formula for sum-of-squares
(define (sum-of-squares num)
  (cond ((<= num 0) 0)
        (else (/ (* (* num (add1 num)) (add1 (* 2 num))) 6)
              )
        )
  )

; Using math formula for sum-of-numbers
(define (sum-of-numbers num)
  (/ (* num (add1 num)) 2)
  )
  
(define (square-of-sum num)
  (cond ((<= num 0) 0)
        (else (* (sum-of-numbers num) (sum-of-numbers num)))
        )
  )

(define (difference num)
  (- (square-of-sum num) (sum-of-squares num))
  )