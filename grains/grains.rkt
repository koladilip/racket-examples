#lang racket

(provide square total)
(define (square num)
  (cond ((<= num 1) 1)
        (else (* 2 (square (- num 1))))))


(define (total)
  (let ((grains-per-square 1))
    (foldl (lambda (num total-grains) 
             (set! grains-per-square (* 2 grains-per-square))
             (+ total-grains grains-per-square)
             )
           1
           (range 63)))
  )