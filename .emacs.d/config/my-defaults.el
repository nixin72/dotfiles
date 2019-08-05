(setq delete-old-versions -1)		                ; delete excess backup versions silently
(setq version-control t)		                      ; use version control
(setq vc-make-backup-files t)		                ; make backups file even when in version controlled dir
(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))           ; which directory to put backups file
(setq vc-follow-symlinks t)				              ; don't ask for confirmation when opening symlinked file
(set-font "Fira Code")
(if window-system (tool-bar-mode 0))
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))  ;transform backups file name
(setq inhibit-startup-screen t)	                ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore)	              ; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8)	            ; use utf-8 by default
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)	            ; sentence SHOULD end with only a point.
(setq default-fill-column 80)		                  ; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup

;; Maintain state when exiting emacs
(desktop-save-mode 1)

;; Change the colour of highlighted line
(global-hl-line-mode 1)

;; Remove scroll bars 
(scroll-bar-mode)
(scroll-bar-mode)

(use-package smartparens
  :ensure t
  :config
  (progn
    (smartparens-global-mode t)))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local tide-format-options `(:indentSize ,n :tabSize ,n))
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  (setq-local indent-tabs-mode nil)
  (my-setup-indent 2))

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  (setq indent-tabs-mode t) ; t = tabs, nil = spaces
  (my-setup-indent 2))

(my-office-code-style)

(provide 'my-defaults)
