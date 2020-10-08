(straight-use-package 'org-bullets)

(add-hook
 'org-mode-hook
 (lambda ()
   (org-bullets-mode 1)
   (visual-line-mode 1)
   (setq fill-column 100)
   (variable-pitch-mode)))
          
;; Some nice defaults
;; Solution came from:
;; https://lepisma.xyz/2017/10/28/ricing-org-mode#other-tweaks
(setq org-startup-indented t
      org-startup-with-inline-images t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(let* ((headline `(:font "NotoSans" :weight bold))
       (code `(:font "FiraCode" :height 1.0))
       (code-block `(,@code :background "#282C34"))
       (block-line `(,@code :foreground "#abb2bf" :background "#343843")))
  (custom-theme-set-faces
   'user
   `(org-code ((t (,@code-block))))
   `(org-block ((t (,@code-block))))
   `(org-block-begin-line ((t (,@block-line))))
   `(org-block-end-line ((t (,@block-line))))
   `(org-level-8 ((t (,@headline :height 1.1 :foreground "#9494E6"))))
   `(org-level-7 ((t (,@headline :height 1.15 :foreground "#c678dd"))))
   `(org-level-6 ((t (,@headline :height 1.2 :foreground "#e06c75"))))
   `(org-level-5 ((t (,@headline :height 1.25 :foreground "#d19a66"))))
   `(org-level-4 ((t (,@headline :height 1.3 :foreground "#B5AF70"))))
   `(org-level-3 ((t (,@headline :height 1.35 :foreground "#98c379"))))
   `(org-level-2 ((t (,@headline :height 1.4 :foreground "#56b6c2"))))
   `(org-level-1 ((t (,@headline :height 1.45 :foreground "#61afef"))))))
   
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

(provide 'my-org)
 
