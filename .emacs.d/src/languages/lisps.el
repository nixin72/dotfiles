;; Clojure
(straight-use-package 'clojure-mode)
(straight-use-package
 'cider
 :config
 (general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'cider-mode-map
  "'" 'cider-jack-in
  "\"" 'cider-jack-in-cljs
  "`" 'cider-jack-in-clj&cljs))

;; Racket-mode
(straight-use-package
 'racket-mode
 (general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'racket-mode-map
  "r" 'racket-run
  "'" 'racket-repl
  "d" 'racket-doc
  "e r" 'racket-send-region
  "c d" 'racket-send-definition
  "e e" 'racket-send-last-sexp))
;(straight-use-package ' geiser :ensure t)

;; Common Lisp
(straight-use-package
 'slime
 :config
 (general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'lisp-mode-map
  "'" 'slime
  "e b" 'slime-eval-buffer
  "e r" 'slime-eval-region
  "c d" 'slime-compile-defun
  "c l" 'slime-compile-and-load-file
  "d" 'slide-describe-symbol
  "i" 'slime-interrupt))

;; Emacs Lisp
(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'emacs-lisp-mode-map
  "e b" 'eval-buffer
  "e r" 'eval-region
  "c d" 'compile-defun
  "d" 'describe-symbol
  "l l" 'package-lint-current-buffer
  "l d" 'checkdoc)

;; All lisps
(defun lisp-programming-modes ()
  (interactive)
  (parinfer-mode t)
  (prettify-symbols-mode t)
  (highlight-parentheses-mode t))

(add-hook 'lisp-mode-hook 'lisp-programming-modes)
(add-hook 'common-lisp-mode-hook 'lisp-programming-modes)
(add-hook 'emacs-lisp-mode-hook 'lisp-programming-modes)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (interactive)
            ;; For MELPA
            (setq fill-column 80)
            (auto-fill-mode 1)))
(add-hook 'clojure-mode-hook 'lisp-programming-modes)
(add-hook 'racket-mode-hook 'lisp-programming-modes)
(add-hook 'scheme-mode-hook 'lisp-programming-modes)

(provide 'lisps)
