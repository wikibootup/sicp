(load "chap-1-2-6.scm")

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

;; Test counts 1000 : the failure rate of test result : 2^(-1000)
(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
	  (report-prime n (- (runtime) start-time))
	  '()))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  elapsed-time)

(define (primes-from n count)
  (define (_primes-from n count start-time)
	(cond ((= count 0)
		   (- (runtime) start-time))
		  ((null? (timed-prime-test n))
		   (_primes-from (+ n 1) count start-time))
		  (else (_primes-from (+ n 1) (- count 1) start-time))))
  (_primes-from n count (runtime)))