#lang racket

(provide collatz)

(define (collatz num)
  (cond 
    [(not (exact-positive-integer? num)) (error "Input positive integer")]
    [(= num 1) 0]
    [(even? num) (add1 (collatz (/ num 2)))]
    [ else (add1  (collatz (add1 (* num 3))))]
    )
  )