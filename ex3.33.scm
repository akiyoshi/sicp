;ex3.33.scm

(define (averager a b c)
  (define (process-new value)
    (cond ((and (has-value? a) (has-value? b))
           (set-value! c
                       (/ (+ (get-value a) (get-value b))
                          2)
                       me))
          ((and (has-value? a) (has-value? c))
           (set-value! b
                       (- (* 2 (get-value c)) (get-value a))
                       me))
          ((and (has-value? c) (has-value? b))
           (set-value! a
                       (- (* 2 (get-value c)) (get-value b))
                       me)))
    (define (process-forget-value)
      (forget-value! c me)
      (forget-value! a me)
      (forget-value! b me)
      (process-new-value))
    (define (me request)
      (cond ((eq? request 'I-have-a-value)
             (process-new-value))
            ((eq? request 'I-lost-my-value)
             (process-forget-value))
            (else
              (error "Unknown request --AVERAGER" request)))))
  (connect a me)
  (connect b me)
  (connect c me)
  me)