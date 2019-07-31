(use-package which-key
  :ensure t
  :init
  (progn
    (setq which-key-separator " ")
    (setq which-key-prefix-prefix "+"))
  :config
  (progn
    (which-key-setup-side-window-right-bottom)
    (setq which-key-sort-order 'which-key-key-order-alpha
      which-key-side-window-max-width 0.33
      which-key-idle-delay 0.05))
  :diminish (which-key-mode))

(provide 'my-which-key)
