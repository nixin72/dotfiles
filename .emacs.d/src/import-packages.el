;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Editing packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

(use-package highlight-indent-guides
  :ensure t
  :config
  (progn
    (setq highlight-indent-guides-method 'bitmap)
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    ))

(use-package rainbow-delimiters
   :ensure t
   :config
   (progn
     (rainbow-delimiters-mode t)
     ))

(use-package highlight-parentheses
  :ensure t
  :config
  (progn
    (highlight-parentheses-mode t)))

(use-package smooth-scroll :ensure t)
(use-package all-the-icons :ensure t)
(use-package dash :ensure t)
(use-package column-enforce-mode :ensure t)
(use-package flycheck :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Programming packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUST
(use-package rust-mode :ensure t)
(use-package clippy :ensure t)
(use-package cargo
  :ensure t
  :config
  (progn
    (add-hook 'rust-mode-hook 'cargo-minor-mode)))

;; TYPESCRIPT
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;; JAVASCRIPT
(use-package js2-refactor :ensure t)
(use-package xref-js2 :ensure t)
(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))))

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; MARKDOWN
(use-package markdown-mode
  :ensure markdown-mode
  :commands (markdown-mode gfm-mode)
  ;; Use GitHub markdown on README.md files, and regular Markdown on others
  :mode (("README\\.md'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)))

;; LISPs
(use-package clojure-mode :ensure t)
(use-package cider :ensure t)
(use-package racket-mode :ensure t)

;; JAVA
(use-package lsp-java :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package xref :ensure t)
(use-package dap-mode :ensure t)

;; OTHER
(use-package fish-mode :ensure t)
(use-package graphviz-dot-mode :ensure t)
(use-package pandoc :ensure t)
(use-package php-mode :ensure t)
(use-package vimrc-mode :ensure t)
(use-package tuareg :ensure t)
(use-package slime :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Productivity packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    (which-key-mode)))

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

(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode t)))

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (progn
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    (centaur-tabs-change-fonts "arial" 100)
    (setq centaur-tabs-style "rounded"
          centaur-tabs-set-icons t
          centaur-tabs-gray-out-icons 'buffer
          centaur-tabs-set-bar 'left
          x-underline-at-descent-line t
          centaur-tabs-set-modified-marker t
          centaur-tabs-height 35))
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package auto-complete :ensure t)
(use-package frame-local :ensure t)
(use-package fzf :ensure t)
(use-package ov :ensure t)
(use-package projectile :ensure t)
(use-package pdf-tools :ensure t)
(use-package winum :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Plugins packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package wakatime-mode
  :ensure t
  :config
  (progn
    (setq wakatime-python-bin "/usr/bin/python")
    (setq wakatime-api-key (get-wakatime-api-key))
    (setq wakatime-cli-path "/usr/bin/wakatime")))

(provide 'import-packages)
