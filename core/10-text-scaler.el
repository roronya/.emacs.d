;;; zoom in and zoom out settings for linum mode
;; This script is set for a `text-scale-mode-step` of `1.04`
(setq text-scale-mode-step 1.08)
;;
;; List: `Sub-Zoom Font Heights per text-scale-mode-step`  
;;   eg.  For a default font-height of 120 just remove the leading `160 150 140 130` 
(defvar sub-zoom-ht (list 160 150 140 130 120 120 110 100 100  90  80  80  80  80  70  70  60  60  50  50  50  40  40  40  30  20  20  20  20  20  20  10  10  10  10  10  10  10  10  10  10   5   5   5   5   5   2   2   2   2   2   2   2   2   1   1   1   1   1   1   1   1   1   1   1   1))
(defvar sub-zoom-len (safe-length sub-zoom-ht))
(defvar def-zoom-ht (car sub-zoom-ht))
(set-face-attribute 'default nil :height def-zoom-ht)

(defun text-scale-adjust-zAp ()
   (interactive)
   (text-scale-adjust 0)
   (set-face-attribute 'linum nil :height def-zoom-ht)
   )

(defun my/text-scale-decrease ()
   (interactive)
   (if (not (boundp 'text-scale-mode-amount)) ;; first-time init  
              (setq  text-scale-mode-amount 0))
   (setq text-scale (round (/ (* 1 text-scale-mode-amount) 
                                   text-scale-mode-step)))
   (if (> text-scale (- 1 sub-zoom-len))
       (progn
         (text-scale-decrease text-scale-mode-step)
         (if (<= 0 text-scale-mode-amount)
             (set-face-attribute 'linum nil :height def-zoom-ht)
           (if (> 0 text-scale-mode-amount)
               (set-face-attribute 'linum nil :height 
                                     (elt sub-zoom-ht (- 0 text-scale)))))))
   )

(defun my/text-scale-increase ()
   (interactive)
   (if (not (boundp 'text-scale-mode-amount)) ;; first-time init  
              (setq  text-scale-mode-amount 0))
   (setq text-scale (round (/ (* 1 text-scale-mode-amount) 
                                   text-scale-mode-step)))
   (if (< text-scale 85)
       (progn
         (text-scale-increase text-scale-mode-step)
         (if (< (- 0 text-scale-mode-step) text-scale-mode-amount)
             (set-face-attribute 'linum nil :height def-zoom-ht)
           (if (> 0 text-scale-mode-amount)
               (set-face-attribute 'linum nil :height 
                                     (elt sub-zoom-ht (- 0 text-scale)))))))
   )
