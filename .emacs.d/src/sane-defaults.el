;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Disable some stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(tooltip-mode -1)
(setq ring-bell-function 'ignore)
(setq-default message-log-max nil)
; Disable completions buffer
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Enable some stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(company-mode t)
(auto-complete-mode t)
(column-number-mode t)
(global-hl-line-mode 1)
(winum-mode 1)
(global-wakatime-mode 1)
(rainbow-delimiters-mode t)
(save-place-mode 1)
(ido-mode t)
(global-whitespace-mode t)
(smooth-scroll-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Set some stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)
(setq sgml-quick-keys 'close
      uniquify-buffer-name-style 'forward
      ido-enable-flex-matching t
      default-fill-column 80
      delete-old-versions -1		; delete excess backup versions silently
      version-control t		        ; use version control
      vc-make-backup-files t		; make backups file even when in version controlled dir
      vc-follow-symlinks t ; don't ask for confirmation when opening symlinks
      coding-system-for-read 'utf-8	; use utf-8 by default
      coding-system-for-write 'utf-8
      backup-directory-alist `(("." . "~/.emacs.d/.saves"))
      backup-by-copying t
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))
      whitespace-line-column 80
      whitespace-style '(face lines-tail)
      ;; Smooth scrolling stuff
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      show-trailing-whitespace t
      explicit-shell-file-name "/usr/bin/zsh"
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Managing indentation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-tab-width 2)
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t
	tab-width custom-tab-width))

(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)
(add-hook 'racket-mode-hook 'disable-tabs)

(setq-default python-indent-offset custom-tab-width
	      js-indent-level custom-tab-width
	      electric-indent-inhibit t)

(setq backward-delete-char-untabify-method 'hungry)
(setq-default evil-shift-width custom-tab-width)

(setq whitespace-style '(face tabs tab-mark-trailing))
(custom-set-faces '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings '((tab-mark 9 [124 9] [92 9])))
(global-whitespace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Automate some shit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun kill-term-on-exit ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (progn (kill-buffer ,buff)
                   (delete-window)))))))

(add-hook 'term-exec-hook 'kill-term-on-exit)

(provide 'sane-defaults)
