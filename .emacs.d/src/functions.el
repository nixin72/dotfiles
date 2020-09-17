(defun set-theme (theme-name)
  "Sets the theme for emacs to use"
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (load-theme theme-name t))

(defun set-font (font-name)
  "Sets the font for emacs to use"
  (add-to-list 'default-frame-alist '(font . ,font-name))
  (set-face-attribute 'default t :font font-name)
  (set-frame-font font-name nil t))

(defun buffer-create ()
  "Create a new empty buffer and focus in it"
  (interactive)
  (switch-to-buffer "*new*"))

(defun my-setup-indent (n)
  (setq-local c-basic-offset n) ; C/C++
  (setq-local coffee-tab-width n) ; cofeescript
  (setq-local javascript-indent-level n) ; JS
  (setq-local js-indent-level n) ; JS
  (setq-local js2-basic-offset n) ; JS
  (setq-local tide-format-options `(:indentSize ,n :tabSize ,n)) ; TS
  (setq-local web-mode-markup-indent-offset n) ; HTML/CSS
  (setq-local web-mode-css-indent-offset n) ; CSS
  (setq-local web-mode-code-indent-offset n) ; HTML
  (setq-local css-indent-offset n) ; CSS
  (setq-local fish-indent-offset n) ; Fish
  )

(defun my-office-indent-style ()
  (interactive)
  (setq-local indent-tabs-mode nil)
  (my-setup-indent 2))

(defun my-personal-indent-style ()
  (interactive)
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


(defun treemacs-change-root ()
  "Input a new root to change to, same as neotree-change-root"
  (interactive)
  (treemacs-block
   (treemacs-unless-let (btn (treemacs-current-button))
      (let ((current-root (treemacs-project-at-point))
            (new-root (treemacs-button-get btn :path)))
    ;;      (expand-file-name (read-directory-name
    ;;                                   "Change root to: "
    ;;                                   nil
    ;;                                   default-directory
    ;;                                   :must-match))))
    (message new-root)
    (treemacs-do-remove-project-from-workspace current-root)
    (treemacs--reset-dom)
    (treemacs-do-add-project-to-workspace new-root (file-name-nondirectory new-root))
    (treemacs-goto-file-node new-root)
    (treemacs-toggle-node)
    ))))

(provide 'functions)
