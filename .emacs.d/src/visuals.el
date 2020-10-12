(straight-use-package 'hide-mode-line)
(straight-use-package 'mini-modeline)
(progn
  (mini-modeline-mode t)
  (setq mini-modeline-face-attr '(:background "#1c1e24")
        mini-modeline-r-format
        '("%e" (:eval (number-to-string (winum-get-number)))
               " "
               evil-mode-line-tag
               " "
               mode-line-modified
               mode-line-buffer-identification
               " "
               mode-line-position
               (:eval (symbol-name major-mode))
               "   "
               (:eval (magit-get-current-branch))
               (:eval (format-time-string "%H:%M%P")))
        mini-modeline-l-format nil))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(straight-use-package 'emojify)

(defun font-size (size)
  (set-frame-font (format "Fira code %d" size) nil t))

(font-size 12)

(provide 'visuals)
