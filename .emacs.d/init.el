;;; Author: Philip Dumaresq
;;; Description: My person emacs configurations
;;;
;;; This is my personal emacs configs. I'm pretty new to emacs, so this is all new to me.

(load-file "~/.emacs.d/functions.el")
(start-package-manager)
(load-paths)

(require 'my-defaults)
(require 'my-evil)
(require 'my-general)
(require 'my-sidebar)
(require 'my-which-key)
(require 'my-themes)
(require 'my-wakatime)
(require 'my-ivy)
(require 'my-ts)

;; Disable menu bar at the top of the window

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tabbar evil-tabs fzf winum doom-themes evil use-package undo-tree js2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
