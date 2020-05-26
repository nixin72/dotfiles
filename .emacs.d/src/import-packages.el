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
    (setq wakatime-api-key (get-wakatime-api-key))
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

(use-package clippy
  :ensure t)

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
    (which-key-mode)
  ))

(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
         ("C-'" . ivy-avy)) ; C-' to ivy-avy
  :config
  (progn
    (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
    (setq ivy-height 20)               ; set height of the ivy window
    (setq ivy-count-format "(%d/%d) ")
    (ivy-mode)
    ))

(use-package markdown-mode
  :ensure markdown-mode
  :commands (markdown-mode gfm-mode)
  ;; Use GitHub markdown on README.md files, and regular Markdown on others
  :mode (("README\\.md'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)))

(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    ))

(use-package js2-refactor :ensure t)
(use-package xref-js2 :ensure t)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode t)))

(use-package all-the-icons :ensure t)
(use-package auto-complete :ensure t)
(use-package column-enforce-mode :ensure t)
(use-package dash :ensure t)
(use-package fish-mode :ensure t)
(use-package flycheck :ensure t)
(use-package frame-local :ensure t)
(use-package fzf :ensure t)
(use-package graphviz-dot-mode :ensure t)
(use-package ov :ensure t)
(use-package pandoc :ensure t)
(use-package pdf-tools :ensure t)
(use-package php-mode :ensure t)
(use-package projectile :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package sly :ensure t)
(use-package tuareg :ensure t)
(use-package vimrc-mode :ensure t)

(provide 'import-packages)
