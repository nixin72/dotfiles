(straight-use-package 'evil)
(progn
  (evil-mode 1)
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  )

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

(straight-use-package 'general)
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
   "w m j" 'evil-window-move-very-bottom
   "w m h" 'evil-window-move-far-left
   "w m k" 'evil-window-move-very-top
   "w m l" 'evil-window-move-far-right
   ;; Text
   "t a" 'mark-whole-buffer
   "t w c" 'count-words
   "/" 'comment-line
   "t e" 'eval-region
   "t f" 'find-function-at-point
   ;; Toggles
   "T F" 'toggle-frame-fullscreen
   "T r" 'rainbow-delimiters-mode
   "T p" 'toggle-presentation-mode
   "T l" 'global-display-line-numbers-mode
   "T f" 'evil-toggle-fold
   ;; Files
   "f f" 'project-find-file
   "f t" 'treemacs-select-window
   "f c" 'kill-buffer
   ;;
   ;; Package management
   "p i" 'package-install
   "p r" 'package-refresh-contents
   "p R" 'package-reinstall
   ;; Single-key bindings
   "l" 'centaur-tabs-forward
   "h" 'centaur-tabs-backward
   "v" 'er/expand-region
   "F" 'evil-toggle-fold
   "r" 'View-back-to-mark
   ;; Winum
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
   "t r" 'rainbow-delimiters-mode)
  
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   :keymaps 'common-lisp-mode
   "b e" 'slime-eval-buffer)
  
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   :keymaps 'emacs-lisp-mode
   "b e" 'eval-buffer))
   
  

; This is because in my .Xmodmap I remap the Capslock key to this symbol: nabla
(global-set-key (kbd "∇") 'company-complete)
(global-set-key (kbd "M-x") 'execute-extended-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Treemacs bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'treemacs)
(progn
  (setq treemacs-width 30)
  ;; Navigation 
  (evil-define-key 'normal treemacs-mode-map (kbd "j") 'treemacs-next-line)
  (evil-define-key 'normal treemacs-mode-map (kbd "k") 'treemacs-previous-line)
  (evil-define-key 'normal treemacs-mode-map (kbd "C-j") 'treemacs-next-neighbour)
  (evil-define-key 'normal treemacs-mode-map (kbd "C-k") 'treemacs-previous-neighbour)
  (evil-define-key 'normal treemacs-mode-map (kbd "C-h") 'treemacs-goto-parent-node)
  (evil-define-key 'normal treemacs-mode-map (kbd "u") 'treemacs-root-up)
  (evil-define-key 'normal treemacs-mode-map (kbd "d") 'treemacs-root-down)
  (evil-define-key 'normal treemacs-mode-map (kbd "R") 'treemacs-change-root)
  
  ;; Opening nodes
  (evil-define-key 'normal treemacs-mode-map (kbd "o f") 'treemacs-visit-node-no-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o v") 'treemacs-visit-node-horizontal-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o h") 'treemacs-visit-node-vertical-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o a o") 'treemacs-visit-node-ace)
  (evil-define-key 'normal treemacs-mode-map (kbd "o a v") 'treemacs-visit-node-ace-horizontal-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o e") 'treemacs-visit-node-in-external-application)
  (evil-define-key 'normal treemacs-mode-map (kbd "o a h") 'treemacs-visit-node-ace-vertical-split)
  (evil-define-key 'normal treemacs-mode-map (kbd "o o") 'treemacs-visit-node-in-most-recently-used-window)

  ;; Files stuffs
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

  )

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
;;;;;;;;;;;;;;;; Redefining evil-mode keys ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map "0" 'back-to-indentation)
(define-key evil-normal-state-map "H" 'block-nav-previous-indentation-level)
(define-key evil-normal-state-map "J" 'block-nav-next-block)
(define-key evil-normal-state-map "K" 'block-nav-previous-block)
(define-key evil-normal-state-map "L" 'block-nav-next-indentation-level)
(define-key evil-normal-state-map "f" 'ace-jump-char-mode)
(define-key evil-normal-state-map "F" 'ace-jump-mode)
(define-key evil-normal-state-map "U" 'undo-tree-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Some global bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Removed these because they don't work with i3 :'(
;; Moving between windows
;(global-set-key (kbd "M-h") 'evil-window-left)
;(global-set-key (kbd "M-l") 'evil-window-right)
;(global-set-key (kbd "M-j") 'evil-window-down)
;(global-set-key (kbd "M-k") 'evil-window-up)

;; Changing buffers
(global-set-key (kbd "M-[") 'centaur-tabs-backward)
(global-set-key (kbd "M-]") 'centaur-tabs-forward)

;; Change font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Kill any buffer/window
(global-set-key (kbd "<f10>") 'kill-current-buffer)
(global-set-key (kbd "<f11>") 'delete-window)
(global-set-key (kbd "<f12>") 'kill-buffer-and-window)

(provide 'keybinds)
