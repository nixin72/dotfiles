(use-package window-number :ensure t)

(use-package winum
  :ensure t)
(use-package fzf :ensure t)

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
     "'" '(iterm-focus :which-key "iterm")
     "f t" 'neotree-toggle
     "b e" 'eval-buffer
     "b p" 'previous-buffer
     "b n" 'next-buffer
     "c l" '(comment-or-uncomment-region-or-line :which-key "comment line")
     "0" 'neotree
     "1" 'winum-select-window-1
     "2" 'winum-select-window-2
     "3" 'winum-select-window-3
     "4" 'winum-select-window-4
     "5" 'winum-select-window-5
     "6" 'winum-select-window-6
     "7" 'winum-select-window-7
     "8" 'winum-select-window-8
     "9" 'winum-select-window-9


				   )))
(winum-mode)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-change-root)
(evil-define-key 'normal neotree-mode-map (kbd "-") 'neotree-enter-horizontal-split)
(evil-define-key 'normal neotree-mode-map (kbd "\\") 'neotree-enter-vertical-split)

(provide 'my-general)
