(use-package memoize :ensure t)
(use-package all-the-icons :ensure t)
(use-package cl-lib :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

; (set-theme 'nord)

(provide 'my-themes)
