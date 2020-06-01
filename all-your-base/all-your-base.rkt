#lang racket

(provide rebase)

(define (lrest l) (take l (- (length l) 1)))

(define (get-bad-digits list-digits base)
  (memf (lambda (digit)
          (or (>= digit base) (< digit 0)))
        list-digits)
  )

(define (to-decimal-num list-digits base)
  (cond
    [(empty? list-digits) 0]
    [else (+ (last list-digits) (* base (to-decimal-num (lrest list-digits) base)))]
    )
  )

(define (to-list decimal-num base)
  (cond
    [(eq? decimal-num 0) '()]
    [else (append (to-list (quotient decimal-num base) base) (list (remainder decimal-num base)))]
    )
  )

(define (append-zero list-digits)
  (cond
    [(empty? list-digits) '(0) ]
    [else list-digits]
   )
  )

(define (rebase list-digits in-base out-base)
  (cond
    [(<= in-base 1) #f]
    [(<= out-base 1) #f]
    [(get-bad-digits list-digits in-base) #f]
    [(empty? list-digits) '( 0 )]
    [(eq? in-base out-base) list-digits]
    [else (append-zero (to-list (to-decimal-num list-digits in-base) out-base))]
    )
  )
