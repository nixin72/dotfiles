;;; Author: Philip Dumaresq
;;; Description: My person emacs configurations
;;;
;;; This is my personal emacs configs. I'm pretty new to emacs, so this is all new to me.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-refresh-contents))

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
