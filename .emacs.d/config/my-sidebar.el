(use-package neotree
  :ensure t
  :config
  (progn
    (setq-default neo-show-hidden-files t)
    (setq-default neo-smart-open t)
  ))
  ;  (setq neo-theme
  ;    (if (display-graphic-p) 'icons 'arrow))))

(neotree-dir "~/repos")

(provide 'my-sidebar)
