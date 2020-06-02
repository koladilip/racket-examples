#lang racket

(provide classify)

(define (get-factors num)
  (stream-filter (lambda (i) (zero? (remainder num i))) (in-range 1 num))
  )

(define (aliquot-sum num)
  (stream-fold + 0 (get-factors num))
  )

(define (classify num)
  (cond [(< num 1) #f]
        [(= num 1) 'deficient]
        [else (let ([asum (aliquot-sum num)])
                (cond [(= asum num) 'perfect]
                      [(< asum num) 'deficient]
                      [(> asum num) 'abundant]
                      )
                )
              ]
        )
  )
