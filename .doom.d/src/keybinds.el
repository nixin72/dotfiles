(setf doom-localleader-alt-key ",")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Treemacs keybinds ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Navigation
(progn
  (map! :n :map treemacs-mode-map"j" 'treemacs-next-line)
  (map! :n :map treemacs-mode-map "j" 'treemacs-next-line)
  (map! :n :map treemacs-mode-map "k" 'treemacs-previous-line)
  (map! :n :map treemacs-mode-map "C-j" 'treemacs-next-neighbour)
  (map! :n :map treemacs-mode-map "C-k" 'treemacs-previous-neighbour)
  (map! :n :map treemacs-mode-map "C-h" 'treemacs-goto-parent-node)
  (map! :n :map treemacs-mode-map "u" 'treemacs-root-up)
  (map! :n :map treemacs-mode-map "d" 'treemacs-root-down)
  (map! :n :map treemacs-mode-map "R" 'treemacs-change-root)

  ;; Opening nodes
  (map!)
  (map! :n :map treemacs-mode-map "o f" 'treemacs-visit-node-no-split)
  (map! :n :map treemacs-mode-map "o v" 'treemacs-visit-node-horizontal-split)
  (map! :n :map treemacs-mode-map "o h" 'treemacs-visit-node-vertical-split)
  (map! :n :map treemacs-mode-map "o a o" 'treemacs-visit-node-ace)
  (map! :n :map treemacs-mode-map "o a v" 'treemacs-visit-node-ace-horizontal-split)
  (map! :n :map treemacs-mode-map "o a h" 'treemacs-visit-node-ace-vertical-split)
  (map! :n :map treemacs-mode-map "o e" 'treemacs-visit-node-in-external-application)
  (map! :n :map treemacs-mode-map "o a h" 'treemacs-visit-node-ace-vertical-split)
  (map! :n :map treemacs-mode-map "o o" 'treemacs-visit-node-in-most-recently-used-window)

  ;; Files stuffs
  (map! :n :map treemacs-mode-map "f f" 'treemacs-create-file)
  (map! :n :map treemacs-mode-map "f d" 'treemacs-create-dir)
  (map! :n :map treemacs-mode-map "f r" 'treemacs-rename)
  (map! :n :map treemacs-mode-map "f x" 'treemacs-delete)
  (map! :n :map treemacs-mode-map "f m" 'treemacs-move-file)
  (map! :n :map treemacs-mode-map "f y" 'treemacs-copy-file)

  ;; Toggles
  (map! :n :map treemacs-mode-map "t f" 'treemacs-follow-mode)
  (map! :n :map treemacs-mode-map "t w" 'treemacs-filewatch-mode)
  (map! :n :map treemacs-mode-map "t g" 'treemacs-git-mode)
  (map! :n :map treemacs-mode-map "t i" 'treemacs-fringe-indicator-mode)
  (map! :n :map treemacs-mode-map "t h" 'treemacs-toggle-show-dotfiles)
  (map! :n :map treemacs-mode-map "t r" 'treemacs-toggle-fixed-width)

  ;; Project stuffs
  (map! :n :map treemacs-mode-map "p a" 'treemacs-add-project-to-workspace)
  (map! :n :map treemacs-mode-map "p r" 'treemacs-rename-project)
  (map! :n :map treemacs-mode-map "p x" 'treemacs-remove-project-from-workspace)
  (map! :n :map treemacs-mode-map "p c" 'treemacs-collapse-project)

  ;; Workspaces
  (map! :n :map treemacs-mode-map "w e" 'treemacs-edit-workspaces)
  (map! :n :map treemacs-mode-map "w c" 'treemacs-create-workspace)
  (map! :n :map treemacs-mode-map "w x" 'treemacs-remove-workspace)
  (map! :n :map treemacs-mode-map "w r" 'treemacs-rename-workspace)
  (map! :n :map treemacs-mode-map "w s" 'treemacs-switch-workspace)
  (map! :n :map treemacs-mode-map "w f" 'treemacs-set-fallback-workspace)

  ;; Misc
  (map! :n :map treemacs-mode-map "r" 'treemacs-refresh)
  (map! :n :map treemacs-mode-map "W" 'treemacs-set-width)
  (map! :n :map treemacs-mode-map "c" 'treemacs-copy-path-at-point)
  (map! :n :map treemacs-mode-map "C" 'treemacs-copy-project-root)
  (map! :n :map treemacs-mode-map "s" 'treemacs-resort)
  (map! :n :map treemacs-mode-map "b" 'treemacs-add-bookmark)
  (map! :n :map treemacs-mode-map "?" 'treemacs-helpful-hydra)
  (map! :n :map treemacs-mode-map "q" 'treemacs-quit)
  (map! :n :map treemacs-mode-map "RET" 'treemacs-RET-action)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Window navigation/switching ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (map! :leader "0" #'treemacs-select-window)
  (map! :leader "1" #'winum-select-window-1)
  (map! :leader "2" #'winum-select-window-2)
  (map! :leader "3" #'winum-select-window-3)
  (map! :leader "4" #'winum-select-window-4)
  (map! :leader "5" #'winum-select-window-5)
  (map! :leader "6" #'winum-select-window-6)
  (map! :leader "7" #'winum-select-window-7)
  (map! :leader "8" #'winum-select-window-8)
  (map! :leader "9" #'winum-select-window-9)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Helpful bindings when away from evil-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (map! "M-[" #'centaur-tabs-backward)
  (map! "M-]" #'centaur-tabs-forward)

  (map! "<f10>" #'kill-current-buffer)
  (map! "<f11>" #'delete-window)
  (map! "<f12>" #'kill-buffer-and-window)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; General key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (map! :leader "SPC" #'counsel-M-x)
  (map! :leader "v" #'er/expand-region)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Lisp-modes keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map! :localleader :keymap cide-mode-map
      "'" 'cider-jack-in
      "\"" 'cider-jack-in-cljs
      "`" 'cider-jack-in-clj&clj)

(map! :localleader :keymap racket-mode-map
      "r" 'racket-run
      "'" 'racket-repl
      "d" 'racket-doc
      "e r" 'racket-send-region
      "c d" 'racket-send-definition
      "e e" 'racket-send-last-sexp)

(map! :localleader :keymap lisp-mode-map
      "'" 'slime
      "e b" 'slime-eval-buffer
      "e r" 'slime-eval-region
      "c d" 'slime-compile-defun
      "c l" 'slime-compile-and-load-file
      "d" 'slide-describe-symbol
      "i" 'slime-interrupt)

(map! :localleader :keymap emacs-lisp-mode-map
  "e b" 'eval-buffer
  "e r" 'eval-region
  "c d" 'compile-defun
  "d" 'describe-symbol
  "l l" 'package-lint-current-buffer
  "l d" 'checkdoc)

(map! :localleader :keymaps org-mode-map
  "d s" 'org-presentation-start
  "d j" 'org-presentation-next-slide
  "d k" 'org-presentation-previous-slide
  "j" 'org-presentation-next-slide
  "k" 'org-presentation-previous-slide
  "n" 'org-presentation-next-slide
  "m" 'org-presentation-previous-slide
  "t" 'evil-toggle-fold
  "e" 'org-html-export-to-html
  "r" 'org-mode-restart
  "p" 'org-publish-current-project
  "i s" (lambda () (interactive) (org-insert-structure-template "src"))
  "i q" (lambda () (interactive) (org-insert-structure-template "quote"))
  "i e" (lambda () (interactive) (org-insert-structure-template "example"))
  "i c" (lambda () (interactive) (org-insert-structure-template "comment"))
  "i C" (lambda () (interactive) (org-insert-structure-template "center")))
