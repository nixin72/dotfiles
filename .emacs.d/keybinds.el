(use-package general
  :ensure t
  :config
  (progn
   (general-define-key
     :states '(insert)
     "M-h" 'evil-backward-char
     "M-j" 'evil-next-line
     "M-k" 'evil-previous-line
     "M-l" 'evil-forward-char)
    (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "M-SPC"
     "SPC" 'execute-extended-command
     "'" #'(lambda (interactive) (iterm-focus :which-key "iterm"))
     ; Open shit
     "o t" 'neotree-toggle
     "o c" #'(lambda () (interactive) (find-file "~/.emacs.d/init.el"))
     "o k" #'(lambda () (interactive) (find-file "~/.emacs.d/keybinds.el"))
     "o s" 'term
     ; Org-mode
     "O t l" 'org-toggle-latex-fragment

     ; Buffers
     "b c" 'buffer-create
     "b e" 'eval-buffer
     "b p" 'previous-buffer
     "b n" 'next-buffer
     "b k" 'kill-buffer
     "b s" 'save-buffer
     "b u" 'undo-tree-undo
     "b r" 'undo-tree-redo
     ; Windows
     "w k" 'delete-window
     "w =" 'text-scale-increase
     "w -" 'text-scale-decrease
     "w v" 'split-window-horizontally
     "w h" 'split-window-vertically
     ; Text
     "t a" 'mark-whole-buffer
     "t w c" 'count-words
     "t c" 'comment-line
     "t e" 'eval-region
     ; Files
     "f f" 'fzf
     "f t" 'treemacs
     "f c" 'kill-buffer
     ; Package management
     "p i" 'package-install
     "p r" 'package-refresh-contents
     "p R" 'package-reinstall
     ; Slime
     "s s" 'slime
     "s c d" 'slime-compile-defun
     "s c l" 'slime-compile-and-load-file
     ; Winum
     "0" 'winum-select-window-0-or-10
     "1" 'winum-select-window-1
     "2" 'winum-select-window-2
     "3" 'winum-select-window-3
     "4" 'winum-select-window-4
     "5" 'winum-select-window-5
     "6" 'winum-select-window-6
     "7" 'winum-select-window-7
     "8" 'winum-select-window-8
     "9" 'winum-select-window-9)
    (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "M-SPC"
     :keymaps '(lisp-mode common-lisp-mode scheme-mode racket-mode)
     "t p" 'parinfer-mode
     "t r" 'rainbow-delimiters-mode
     )
    (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "M-SPC"
     :keymaps 'common-lisp-mode
     "b e" 'slime-eval-buffer
     )
    (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "M-SPC"
     :keymaps 'emacs-lisp-mode
     "b e" 'eval-buffer
     )
    ))

(global-set-key (kbd "∇") 'company-complete)

(use-package treemacs
  :ensure t
  :config
  (progn
					; General Treemacs
    (evil-define-key 'normal treemacs-mode-map (kbd "TAB") 'neotree-quick-look)
    (evil-define-key 'normal treemacs-mode-map (kbd "q") 'treemacs-quit)
    (evil-define-key 'normal treemacs-mode-map (kbd "RET") 'treemacs-RET-action)
    (evil-define-key 'normal treemacs-mode-map (kbd "j") 'treemacs-next-line)
    (evil-define-key 'normal treemacs-mode-map (kbd "k") 'treemacs-previous-line)
    (evil-define-key 'normal treemacs-mode-map (kbd "t r") 'treemacs-refresh)
    
					; Opening nodes
    (evil-define-key 'normal treemacs-mode-map (kbd "o o") 'treemacs-visit-node-no-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o v") 'treemacs-visit-node-horizontal-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o h") 'treemacs-visit-node-vertical-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a o") 'treemacs-visit-node-ace)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a v") 'treemacs-visit-node-ace-horizontal-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o e") 'treemacs-visit-node-in-external-application)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)

					; Files stuffs
    (evil-define-key 'normal treemacs-mode-map (kbd "f f") 'treemacs-create-file)
    (evil-define-key 'normal treemacs-mode-map (kbd "f d") 'treemacs-create-dir)
    (evil-define-key 'normal treemacs-mode-map (kbd "f r") 'treemacs-rename)
    (evil-define-key 'normal treemacs-mode-map (kbd "f x") 'treemacs-delete)
    (evil-define-key 'normal treemacs-mode-map (kbd "f m") 'treemacs-move-file)
    (evil-define-key 'normal treemacs-mode-map (kbd "f y") 'treemacs-copy-file)

					; Toggles
    (evil-define-key 'normal treemacs-mode-map (kbd "t f") 'treemacs-follow-mode)
    (evil-define-key 'normal treemacs-mode-map (kbd "t w") 'treemacs-filewatch-mode)
    (evil-define-key 'normal treemacs-mode-map (kbd "t g") 'treemacs-git-mode)
    (evil-define-key 'normal treemacs-mode-map (kbd "t i") 'treemacs-fringe-indicator-mode)
    (evil-define-key 'normal treemacs-mode-map (kbd "t h") 'treemacs-toggle-show-dotfiles)
    (evil-define-key 'normal treemacs-mode-map (kbd "t r") 'treemacs-toggle-fixed-width)

					; Project stuffs
    (evil-define-key 'normal treemacs-mode-map (kbd "p a") 'treemacs-add-project-to-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "p d") 'treemacs-remove-project-from-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "p r") 'treemacs-rename-project)

					; Workspaces
    (evil-define-key 'normal treemacs-mode-map (kbd "w e") 'treemacs-edit-workspaces)
    (evil-define-key 'normal treemacs-mode-map (kbd "w c") 'treemacs-create-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w r") 'treemacs-remove-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w R") 'treemacs-rename-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w s") 'treemacs-switch-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w f") 'treemacs-set-fallback-workspace)

					; Misc
    (evil-define-key 'normal treemacs-mode-map (kbd "r") 'treemacs-refresh)
    (evil-define-key 'normal treemacs-mode-map (kbd "W") 'treemacs-set-width)
    (evil-define-key 'normal treemacs-mode-map (kbd "c") 'treemacs-copy-path-at-point)
    (evil-define-key 'normal treemacs-mode-map (kbd "C") 'treemacs-copy-project-root)
    (evil-define-key 'normal treemacs-mode-map (kbd "s") 'treemacs-resort)
    (evil-define-key 'normal treemacs-mode-map (kbd "b") 'treemacs-add-bookmark)
    (evil-define-key 'normal treemacs-mode-map (kbd "?") 'treemacs-helpful-hydra)

    ))

