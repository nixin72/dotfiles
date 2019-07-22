;;; Author: Philip Dumaresq
;;; Description: My person emacs configurations
;;;
;;; This is my personal emacs configs. I'm pretty new to emacs, so this is all new to me. 

(load-file "~/.emacs.d/lib/functions.el")

(import-packages
 "evil" 'evil)

(set-font "Fira Code")
(set-theme 'nord)
(evil-mode 1)


;; Disable menu bar at the top of the window
(if window-system
    (tool-bar-mode 0))

(add-to-list 'load-path "~/.local/share/icons-in-terminal/") ;; If it's not already done
