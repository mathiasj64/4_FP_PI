
;;
;; Preamble: Lisp prerequisits
;;

;; These two lines sets the number of binary digits used to represent a float
;; in Lisp. This is necessary because you'll be working with tiny numbers
;; TL;DR ignore these two lines
(setf (EXT:LONG-FLOAT-DIGITS) 35000)
(setf *read-default-float-format* 'long-float)

;; This method rounds a number to a certain precision
;; It takes two arguments: the number to round and the number of digits to
;; round in decimals
;;
;; Example: (roundToPrecision 10.0044 3) -> 10.004
(defun roundToPrecision (number precision)
  (let
    ((p (expt 10 precision)))
    (/ (round (* number p)) p)
  )
)

;;
;; Exercise
;;

;; Exercise
;; Your task is to implement the Gauss-Legendre algorithm for calculating pi
;; and extract 10.000 (ten thousand) digits

;; Gauss-Legendre algorithm on Wikipedia
;; https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm

(setf a 1)
(setf b (/ 1 (sqrt 2)))
(setf ts (/ 1 4))
(setf p 1)
(setf prevPi 0)

;;Functions:

;;(a+b)/2
(defun calcA (a b)
(/ (+ a b) 2))

;;sqaure(a*b)
(defun calcB (a b)
(sqrt (* a b)))

(defun calcT (a p ts)
;(- t (pow((- (* p a) (* p (nextA a0 b0))) 2)))
( - ts (* p (expt (- a (calcA a b)) 2)))
)

;;2*p
(defun calcP (p)
(* 2 p))

;;Recursive method:

;;(/ (+ (+ 1 b) (+ 1 a)) (* 4 t))
(defun calcPI(a b ts p prevPi)

;(/ (+ (+ 1 (calcB a0 b0)) (+ 1 (calcA a0 b0))) (* 4 (calcT a0 p0 t0)))
(setf prevPi (/ (expt ( + (calcA a b) (calcB a b)) 2) (* 4 (calcT ts p a))))

)

(write (calcPi a b ts p prevPi))