(use-package evil
  :ensure t
  :config
  (progn
    (evil-mode 1)))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun open-split-terminal ()
  (interactive)
  (split-window-right)
  (evil-window-right 1)
  (ansi-term "zsh"))

(defvar presentation-mode? nil)
(defun toggle-presentation-mode ()
  (interactive)
  (treemacs)
  (cond
   (presentation-mode?
    (setq presentation-mode? nil)
    (centaur-tabs-mode 0)
    (font-size 15))
   (t
    (setq presentation-mode? t)
    (centaur-tabs-mode 1)
    (font-size 12))))

(use-package general
  :ensure t
  :config
  (progn
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Insert-mode bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (general-define-key
     :states '(insert)
     "M-h" 'evil-backward-char
     "M-j" 'evil-next-line
     "M-k" 'evil-previous-line
     "M-l" 'evil-forward-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Major-mode bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (general-define-key
     :states '(normal visual emacs)
     :prefix ","
     :keymaps 'emacs-lisp-mode-map
     "e b" 'eval-buffer
     "e r" 'eval-region
     "c d" 'compile-defun
     )
   (general-define-key
     :states '(normal visual emacs)
     :prefix ","
     :keymaps 'cider-mode-map
     "'" 'cider-jack-in
     "\"" 'cider-jack-in-cljs
     "`" 'cider-jack-in-clj&cljs
     )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; General bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "M-SPC"
     "SPC" 'execute-extended-command
     "'" 'open-split-terminal
     ;; Open shit
     "o t" 'treemacs
     "o c" #'(lambda () (interactive) (find-file "~/.emacs.d/init.el"))
     "o k" #'(lambda () (interactive) (find-file "~/.emacs.d/src/keybinds.el"))
     "o s" 'term
     ;; Org-mode
     "O t l" 'org-toggle-latex-fragment
     ;; Emacs
     "e c d" 'compile-defun
     "e d s" 'describe-symbol
     ;; Buffers
     "b 1" 'centaur-tabs-select-beg-tab
     "b 0" 'centaur-tabs-select-end-tab
     "b a" 'list-buffers
     "b d" 'kill-current-buffer
     "b p" 'centaur-tabs-backward
     "b n" 'centaur-tabs-forward
     "b N" 'buffer-create
     "b s" 'save-buffer
     "b u" 'undo-tree-undo
     "b r" 'undo-tree-redo
     "b w" 'kill-buffer-and-window
     ;; Magit
     "g a" 'magit-stage-file
     "g b" 'magit-blame
     "g c" 'magit-commit
     "g d" 'magit-diff
     "g m" 'magit-merge
     "g p" 'magit-push
     "g s" 'magit-status
     "g C" 'magit-commit
     ;; Windows
     "w k" 'delete-window
     "w =" 'text-scale-increase
     "w -" 'text-scale-decrease
     "w v" 'split-window-horizontally
     "w h" 'split-window-vertically
     "w ." 'split-window-horizontally
     "w /" 'split-window-vertically
     ;; Text
     "t a" 'mark-whole-buffer
     "t w c" 'count-words
     "/" 'comment-line
     "t e" 'eval-region
     "t f" 'find-function-at-point
     ;; Toggles
     "T f" 'toggle-frame-fullscreen
     "T r" 'rainbow-delimiters-mode
     "T p" 'toggle-presentation-mode
     ;; Files
     "f f" 'fzf
     "f t" 'treemacs-select-window
     "f c" 'kill-buffer
     ;; Package management
     "p i" 'package-install
     "p r" 'package-refresh-contents
     "p R" 'package-reinstall
     ;; Slime
     "s s" 'slime
     "s c d" 'slime-compile-defun
     "s c l" 'slime-compile-and-load-file
     "s d f" 'slime-describe-function
     "s d s" 'slime-describe-symbol
     "s i" 'slime-interrupt
     ; Window navigation
     "l" 'centaur-tabs-forward
     "h" 'centaur-tabs-backward
     ; Winum
     "0" 'treemacs-select-window
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

; This is because in my .Xmodmap I remap the Capslock key to this symbol: nabla
(global-set-key (kbd "∇") 'company-complete)
(global-set-key (kbd "M-x") 'execute-extended-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Treemacs bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-width 30)
					; Navigation 
    (evil-define-key 'normal treemacs-mode-map (kbd "j") 'treemacs-next-line)
    (evil-define-key 'normal treemacs-mode-map (kbd "k") 'treemacs-previous-line)
    (evil-define-key 'normal treemacs-mode-map (kbd "C-j") 'treemacs-next-neighbour)
    (evil-define-key 'normal treemacs-mode-map (kbd "C-k") 'treemacs-previous-neighbour)
    (evil-define-key 'normal treemacs-mode-map (kbd "C-h") 'treemacs-goto-parent-node)
    (evil-define-key 'normal treemacs-mode-map (kbd "u") 'treemacs-root-up)
    (evil-define-key 'normal treemacs-mode-map (kbd "d") 'treemacs-root-down)
    (evil-define-key 'normal treemacs-mode-map (kbd "R") 'treemacs-change-root)
    
					; Opening nodes
    (evil-define-key 'normal treemacs-mode-map (kbd "o f") 'treemacs-visit-node-no-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o v") 'treemacs-visit-node-horizontal-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o h") 'treemacs-visit-node-vertical-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a o") 'treemacs-visit-node-ace)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a v") 'treemacs-visit-node-ace-horizontal-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o e") 'treemacs-visit-node-in-external-application)
    (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)
    (evil-define-key 'normal treemacs-mode-map (kbd "o o") 'treemacs-visit-node-in-most-recently-used-window)

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
    (evil-define-key 'normal treemacs-mode-map (kbd "p r") 'treemacs-rename-project)
    (evil-define-key 'normal treemacs-mode-map (kbd "p x") 'treemacs-remove-project-from-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "p c") 'treemacs-collapse-project)

					; Workspaces
    (evil-define-key 'normal treemacs-mode-map (kbd "w e") 'treemacs-edit-workspaces)
    (evil-define-key 'normal treemacs-mode-map (kbd "w c") 'treemacs-create-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w x") 'treemacs-remove-workspace)
    (evil-define-key 'normal treemacs-mode-map (kbd "w r") 'treemacs-rename-workspace)
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
    (evil-define-key 'normal treemacs-mode-map (kbd "q") 'treemacs-quit)
    (evil-define-key 'normal treemacs-mode-map (kbd "RET") 'treemacs-RET-action)

    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Bindings to navigate out of other buffers ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-key 'emacs slime-mode-map (kbd "j") 'evil-next-line)
(evil-define-key 'emacs slime-mode-map (kbd "k") 'evil-previous-line)
(evil-define-key 'emacs slime-mode-map (kbd "h") 'evil-backward-char)
(evil-define-key 'emacs slime-mode-map (kbd "l") 'evil-forward-char)
(evil-define-key 'emacs slime-mode-map (kbd "v") 'evil-visual-char)
(evil-define-key 'emacs slime-mode-map (kbd "V") 'evil-visual-line)
(evil-define-key 'emacs slime-mode-map (kbd "y") 'evil-yank)

(evil-define-key 'normal compilation-mode-map (kbd "j") 'evil-next-line)
(evil-define-key 'normal compilation-mode-map (kbd "k") 'evil-previous-line)
(evil-define-key 'normal compilation-mode-map (kbd "h") 'evil-backward-char)
(evil-define-key 'normal compilation-mode-map (kbd "l") 'evil-forward-char)
(evil-define-key 'normal compilation-mode-map (kbd "v") 'evil-visual-char)
(evil-define-key 'normal compilation-mode-map (kbd "V") 'evil-visual-line)
(evil-define-key 'normal compilation-mode-map (kbd "y") 'evil-yank)
(evil-define-key 'normal compilation-mode-map (kbd "SPC b k") 'kill-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Some global bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-l") 'evil-window-right)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)

(global-set-key (kbd "M-[") 'centaur-tabs-backward)
(global-set-key (kbd "M-]") 'centaur-tabs-forward)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(provide 'keybinds)
