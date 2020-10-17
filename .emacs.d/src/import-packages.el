;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Editing packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'smartparens
 :config
 (progn
   (smartparens-global-mode t)))

(straight-use-package 'parinfer
 :config
 (progn
   (add-hook 'racket-mode-hook 'parinfer-mode)))

(straight-use-package 'highlight-indent-guides
 :config
 (progn
   (setq highlight-indent-guides-method 'bitmap)
   (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  ))

(straight-use-package 'rainbow-delimiters
 :config
 (progn
   (rainbow-delimiters-mode t)
   ))

(straight-use-package 'highlight-parentheses
 :config
 (progn
   (highlight-parentheses-mode t)))

(straight-use-package 'block-nav)
(progn
  (setf block-nav-move-skip-shallower t
        block-nav-center-after-scroll t))

(straight-use-package 'hl-todo)
(progn
  (hl-todo-mode 1)
  (add-hook 'text-mode-hook #'hl-todo-mode))

(straight-use-package 'expand-region)
(straight-use-package 'smooth-scroll)
(require 'smooth-scroll)
(straight-use-package 'all-the-icons)
(straight-use-package 'dash)
(straight-use-package 'column-enforce-mode)
(straight-use-package 'flycheck)
(straight-use-package 'ace-jump-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Programming packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUST
(straight-use-package 'rust-mode)
(straight-use-package 'clippy)
(straight-use-package 'cargo
  :config
  (progn
    (add-hook 'rust-mode-hook 'cargo-minor-mode)))

;; JAVASCRIPT
(straight-use-package 'js2-refactor)
(straight-use-package 'xref-js2)
(straight-use-package 'js2-mode
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
(straight-use-package 'markdown-mode
  ;;:commands (markdown-mode gfm-mode)
  ;; Use GitHub markdown on README.md files, and regular Markdown on others
  ;:mode (("README\\.md'" . gfm-mode)
	 ;("\\.md\\'" . markdown-mode)))
	 )

;; JAVA
(straight-use-package 'lsp-java)
(straight-use-package 'company-lsp)
(straight-use-package 'lsp-ui)
(straight-use-package 'xref)
(straight-use-package 'dap-mode)

;; OTHER
(straight-use-package 'fish-mode)
(straight-use-package 'graphviz-dot-mode)
(straight-use-package 'pandoc)
(straight-use-package 'php-mode)
(straight-use-package 'vimrc-mode)
(straight-use-package 'tuareg)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Productivity packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'which-key)
(progn
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+"))
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-side-window-max-width 0.33)
  (setq which-key-idle-delay 0.5)
  (which-key-mode)

(straight-use-package 'ivy)
(progn
  ;:diminish (ivy-mode . "") ; does not display ivy in the modeline
  (ivy-mode 1)        ; enable ivy globally at startup
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ")
  )

(straight-use-package 'company)
(progn
  (global-company-mode t))

(straight-use-package
 '(centaur-tabs :type git :host github :repo "ema2159/centaur-tabs"
                :fork (:host github
                             :repo "MoritzMaxeiner/centaur-tabs"
                             :branch "daemon"))
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
         centaur-tabs-height 35)))

(straight-use-package 'auto-complete)
(straight-use-package 'frame-local)
(straight-use-package 'fzf)
(straight-use-package 'ov)
(straight-use-package 'projectile)
(straight-use-package 'pdf-tools)
(straight-use-package 'winum)
(straight-use-package 'magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Plugins packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'wakatime-mode)
(progn
  (setq wakatime-python-bin "/usr/bin/python")
  (setq wakatime-api-key (get-wakatime-api-key))
  (setq wakatime-cli-path "/usr/bin/wakatime"))

(provide 'import-packages)
