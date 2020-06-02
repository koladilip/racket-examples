#lang racket

(provide two-fer)
(define (two-fer . name)
  (string-replace "One for X, one for me." "X"
                  (cond ((empty? name) "you")
                        (else (string-join name ""))
                  )
  )
)
