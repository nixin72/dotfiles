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

(add-to-list 'load-path "~/.emacs.d/src/")
(require 'functions)
(require 'import-packages)
(require 'keybinds)
(require 'visuals)
(require 'sane-defaults)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(list-packages-ext cider centaur-tabs smooth-scroll speechd-el fic-mode treemacs-magit magit java-imports treemacs-projectile logview git-gutter dap-mode lsp-ui go-mode company-lsp rainbow-identifiers highlight-function-calls slime-company slime javap-mode lsp-java evil-collection gitignore-mode vimrc-mode yaml-mode org-working-set which-key column-enforce-mode company auto-complete pandoc helm dash frame-local ov projectile fish-mode tuareg pdf-tools auctex graphviz-dot-mode php-mode clippy flycheck cargo lsp-mode rust-mode parinfer rainbow-mode racket-mode rainbow-delimiters rainbow-parens wakatime-mode winum window-number use-package smartparens general fzf evil-commentary all-the-icons))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#636363")))))
