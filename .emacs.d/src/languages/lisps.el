;; Clojure
(straight-use-package 'clojure-mode)
(straight-use-package 'cider)
(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'cider-mode-map
  "'" 'cider-jack-in
  "\"" 'cider-jack-in-cljs
  "`" 'cider-jack-in-clj&cljs)

;; Racket-mode
(straight-use-package 'racket-mode)
(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'racket-mode-map
  "r" 'racket-run
  "'" 'racket-repl
  "d" 'racket-doc
  "e r" 'racket-send-region
  "e e" 'racket-send-last-sexp)
;(straight-use-package ' geiser :ensure t)

;; Common Lisp
(straight-use-package 'slime)
(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'common-lisp-mode-map
  "e b" 'slime-eval-buffer
  "e r" 'slime-eval-region
  "c d" 'slime-compile-defun)

;; Emacs Lisp
(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'emacs-lisp-mode-map
  "e b" 'eval-buffer
  "e r" 'eval-region
  "c d" 'compile-defun)

;; All lisps
(defun lisp-programming-modes ()
  (interactive)
  (parinfer-mode t)
  (highlight-parentheses-mode t))

(add-hook 'lisp-mode-hook 'lisp-programming-modes)
(add-hook 'common-lisp-mode-hook 'lisp-programming-modes)
(add-hook 'emacs-lisp-mode-hook 'lisp-programming-modes)
(add-hook 'clojure-mode-hook 'lisp-programming-modes)
(add-hook 'racket-mode-hook 'lisp-programming-modes)
(add-hook 'scheme-mode-hook 'lisp-programming-modes)

(provide 'my-lisps-config)
