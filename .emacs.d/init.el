;;; Author: Philip Dumaresq
;;; Description: My person emacs configurations
;;;
;;; This is my personal emacs configs. I'm pretty new to emacs, so this is all new to me.

(load-file "~/.emacs.d/lib/functions.el")
(start-package-manager)
(load-paths)


(require 'my-evil)
(require 'my-defaults)
(require 'my-general)
(require 'my-sidebar)
(require 'my-which-key)
(require 'my-themes)

(set-font "Fira Code")



;; Disable menu bar at the top of the window
(if window-system
    (tool-bar-mode 0))

(add-to-list 'load-path "~/.local/share/icons-in-terminal/") ;; If it's not already done


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-themes evil use-package undo-tree js2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
