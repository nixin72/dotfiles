(defun set-theme (theme-name)
  "Sets the theme for emacs to use"
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (load-theme theme-name t))

(defun set-font (font-name)
  "Sets the font for emacs to use"
  (add-to-list 'default-frame-alist '(font . ,font-name))
  (set-face-attribute 'default t :font font-name)
  (set-frame-font font-name nil t))

(defun winum-select-neotree-0 ()
  "Returns 10 when Treemacs buffer is open - used to bind 0 to Treemacs for winum"
  (when (string-match-p (buffer-name) ".*\\*Treemacs\\*.*") 10))

(defun buffer-create ()
  "Create a new empty buffer and focus in it"
  (interactive)
  (switch-to-buffer "*new*"))

(defun sane-defaults ()
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message t)
  (setq inhibit-startup-message t)
  (setq initial-scratch-message nil)
  (setq initial-major-mode 'org-mode)
  (setq-default indent-tabs-mode nil)
  (setq pop-up-windows nil)

  ; Disable some stuff
  (tool-bar-mode -1)
  (menu-bar-mode -1) 
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (tooltip-mode -1)
  (setq ring-bell-function 'ignore)
  
  ; Enable some stuff
  (company-mode t)
  (auto-complete-mode t)
  (column-number-mode t)
  (global-hl-line-mode 1)
  (winum-mode 1)
  (global-wakatime-mode 1)
  (doom-modeline-mode 1)
  (rainbow-delimiters-mode t)
  (save-place-mode 1)
  (ido-mode t)

  (fset 'yes-or-no-p 'y-or-n-p)
  (setq sgml-quick-keys 'close
	uniquify-buffer-name-style 'forward
	ido-enable-flex-matching t
	default-fill-column 80
	delete-old-versions -1		; delete excess backup versions silently
	version-control t		; use version control
	vc-make-backup-files t		; make backups file even when in version controlled dir
	backup-directory-alist `(("." . "~/.emacs.d/backups")) ; which directory to put backups file
	vc-follow-symlinks t	        ; don't ask for confirmation when opening symlinked file
	coding-system-for-read 'utf-8	; use utf-8 by default
	coding-system-for-write 'utf-8
	)

  (if window-system (tool-bar-mode 0))
  (setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))  ;transform backups file name
(setq inhibit-startup-screen t)	                ; inhibit useless and old-school startup screen
(setq sentence-end-double-space nil)	            ; sentence SHOULD end with only a point.
		                  ; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup

  
  ; Change Emacs backup files
  (setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
  (setq backup-by-copying t)
  (setq delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t)
  (setq-default
   whitespace-line-column 80
   whitespace-style '(face lines-tail))

  (my-personal-code-style)
  )

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

(defun get-wakatime-api-key ()
  (with-temp-buffer
    (insert-file-contents "~/.wakatime.cfg")
    (loop-over-lines (split-string (buffer-string) "\n" t)
		     (lambda (line)
		       (let ((split (split-string line " ")))
			 (if (equal (car split) "api-key")
			     (caddr split)))))))

(defun loop-over-lines (lines callback)
  (cond (lines
	 (let ((res (funcall callback (car lines))))
	   (if res res
	     (loop-over-lines (cdr lines) callback))))
	(t (loop-over-lines (cdr lines) callback))))
