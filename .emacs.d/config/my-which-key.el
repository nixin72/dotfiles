(use-package which-key
  :ensure t
  :init
  (progn
    (setq which-key-separator " ")
    (setq which-key-prefix-prefix "+"))
  :config
  (progn
    (which-key-setup-side-window-bottom)
    (setq which-key-sort-order 'which-key-key-order-alpha)
    (setq which-key-side-window-max-width 0.33)
    (setq which-key-idle-delay 0.5)
  ))

(which-key-mode)

(provide 'my-which-key)
