(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq-default neo-show-hidden-files t)
    (setq-default neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-show-updir-line nil)
  ))

(neotree-dir "~/repos")

(provide 'my-sidebar)
