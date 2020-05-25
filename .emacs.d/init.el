;; Initialize package management
(require 'package)
(setq load-prefer-newer t)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package
(require 'use-package)

(load "~/.emacs.d/import-packages.el")
(load "~/.emacs.d/keybinds.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/visuals.el")

(sane-defaults)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company sly auto-complete pandoc helm dash frame-local ov projectile fish-mode tuareg pdf-tools auctex graphviz-dot-mode php-mode clippy flycheck cargo lsp-mode rust-mode parinfer rainbow-mode racket-mode rainbow-delimiters rainbow-parens wakatime-mode winum window-number use-package smartparens neotree general fzf evil-commentary all-the-icons)))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
