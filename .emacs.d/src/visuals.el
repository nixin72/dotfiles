(straight-use-package
 'mini-modeline
 :config
 (progn
   (mini-modeline-mode t)
   (setq mini-modeline-r-format
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
                (:eval (magit-get-current-branch)))
         mini-modeline-l-format nil)))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-modeline-mode 1)
  (doom-themes-org-config))

(defun font-size (size)
  (set-frame-font (format "Fira code %d" size) nil t))

(font-size 12)

(provide 'visuals)
