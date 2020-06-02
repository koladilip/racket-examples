#lang racket

(provide response-for)
 
(define (response-for stmt)
  (let* ([is-not-empty (non-empty-string? (string-trim stmt))]
        [ contains-letters (regexp-match? #rx"[a-z]|[A-Z]" stmt)]
        [is-upcase (and is-not-empty contains-letters (equal? stmt (string-upcase stmt)))]
        [ends-with-question-mark (string-suffix? stmt "?")]
        )
     (cond [(not is-not-empty) "Fine. Be that way!"]
           [(and is-upcase ends-with-question-mark) "Calm down, I know what I'm doing!"]
           [is-upcase "Whoa, chill out!"]
           [ends-with-question-mark "Sure."]
           [else "Whatever."]
    ))
  )