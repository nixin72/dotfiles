(straight-use-package 'org-bullets)

(add-hook
 'org-mode-hook
 (lambda ()
   (org-bullets-mode 1)
   (setq buffer-face-mode-face '(:family "Noto Sans" :height 100))
   (buffer-face-mode)))
          
(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(defun org-next-heading ()
  (interactive)
  (evil-toggle-fold)
  (evil-next-line)
  (evil-toggle-fold))

(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'org-mode-map
  "n" 'org-next-heading
  "t" 'evil-toggle-fold
  "r" 'org-mode-restart)

(defun my-adjoin-to-list-or-symbol (element list-or-symbol)
  (let ((list (if (not (listp list-or-symbol))
                  (list list-or-symbol)
                  list-or-symbol)))
    (require 'cl-lib)
    (cl-adjoin element list)))

(eval-after-load "org"
  '(mapc
    (lambda (face)
      (set-face-attribute
       face nil
       :font "FiraCode"
       :height 1.0))
       ;:inherit
       ;(my-adjoin-to-list-or-symbol
       ; 'fixed-pitch
       ; (face-attribute face :inherit)))
    (list 'org-code 'org-block 'org-table))) ;'org-block-background)))

(provide 'my-org)
 
