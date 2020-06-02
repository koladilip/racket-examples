#lang racket

(provide armstrong-number?)

(define (get-digits n)
  (cond [(< n 10) (list n)]
        [else (append (get-digits (quotient n 10)) (list (remainder n 10)))]
        )
  )
(define (armstrong-number? n)
  (let* ([digits (get-digits n)]
         [digits-len (length digits)]
         [arm-sum (foldl (lambda (digit result) (+ result (expt digit digits-len))) 0 digits)]
          )
    (cond [(= arm-sum n) #t]
          [else #f]
          )
  )
)
