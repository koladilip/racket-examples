#lang racket

(provide hamming-distance)

(define (compute-hamming-distance dna1 dna2)
  (let ([dna1-list (string->list dna1)]
        [dna2-list (string->list dna2)]
        )
    (foldl (lambda (c1 c2 result) (cond [(char=? c1 c2) result] [else (add1 result)])) 0 dna1-list dna2-list)
  )
  )

(define (hamming-distance dna1 dna2)
  (cond [(= (string-length dna1) (string-length dna2)) (compute-hamming-distance dna1 dna2)]
        [else (error "Input same length DNA strings")]
        )
  )