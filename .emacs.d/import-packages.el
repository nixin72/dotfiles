(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    ))

(use-package winum
  :ensure t
  :config
  (progn
    (add-to-list 'winum-assign-functions #'winum-select-neotree-0)
    ))

(use-package evil
  :ensure t
  :config
  (progn
    (evil-mode 1)))

(use-package smartparens
  :ensure t
  :config
  (progn
    (smartparens-global-mode t)))

(use-package parinfer
  :ensure t
  :config
  (progn
    (add-hook 'racket-mode-hook 'parinfer-mode)))

(use-package wakatime-mode
  :ensure t
  :config
  (progn
    (setq wakatime-python-bin "/usr/bin/python")
    (setq wakatime-api-key "db15593f-9e41-4bc4-adbc-0037807bc981")
    (setq wakatime-cli-path "/usr/bin/wakatime")))

(use-package rust-mode
  :ensure t
  :config
  (progn
    (evil-define-key 'normal 'rust-mode-map (kbd "SPC m r") 'rust-run)))

(use-package cargo
  :ensure t
  :config
  (progn
    (add-hook 'rust-mode-hook 'cargo-minor-mode)))

(use-package racket-mode
  :ensure t
  :config
  (progn
    (evil-define-key 'normal racket-mode-map (kbd "SPC m r") 'racket-run)))

(use-package highlight-indent-guides
  :ensure t
  :config
  (progn
    (setq highlight-indent-guides-method 'bitmap)
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    ))
