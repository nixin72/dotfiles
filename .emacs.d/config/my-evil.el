(use-package evil
	 :ensure t
	 :config
	 (progn
	   (evil-mode 1)))

;(use-package evil-cleverparens
;  :ensure t
;  :config
;  (progn
;    ;; Hook onto Lisp and Elisp modes
;    (add-hook 'lisp-mode-hook 'evil-cleverparens-mode)
;    (add-hook 'emacs-lisp-mode-hook 'evil-cleverparens-mode)))

(use-package evil-commentary
  :ensure t
  :config
  (progn
    ;; Enable by default
    (evil-commentary-mode)))

(provide 'my-evil)
