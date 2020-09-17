(use-package doom-modeline)

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

(set-frame-font "Fira Code 12" nil t)

(provide 'visuals)
