#lang racket

(provide to-roman)

(define (repeat chr num)
  (list->string (map (lambda(digit) chr) (range num) ))
  )

(define (to-roman num)
  (cond [(>= num 1000) (string-append (repeat #\M (quotient num 1000)) (to-roman (remainder num 1000)))]
        [(>= num 900) (string-append "CM" (to-roman (- num 900)))]
        [(>= num 500) (string-append "D" (to-roman (- num 500)))]
        [(>= num 400) (string-append "CD" (to-roman (- num 400)))]
        [(>= num 100) (string-append (repeat #\C (quotient num 100)) (to-roman (remainder num 100)))]
        [(>= num 90) (string-append "XC" (to-roman (- num 90)))]
        [(>= num 50) (string-append "L" (to-roman (- num 50)))]
        [(>= num 40) (string-append "XL" (to-roman (- num 40)))]
        [(>= num 10) (string-append (repeat #\X (quotient num 10)) (to-roman (remainder num 10)))]
        [(= num 9) "IX"]
        [(>= num 5) (string-append "V" (to-roman (- num 5)))]
        [(= num 4) "IV"]        
        [(<= num 3) (repeat #\I num)]
        [(<= num 0) ""]
      )
  )