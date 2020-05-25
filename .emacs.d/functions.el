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
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq sgml-quick-keys 'close)
  
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
  )
