;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Philip"
      user-mail-address "phdumaresq@protonmail.com")

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

(setq ispell-dictionary "en_CA")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; UI Changes/improvemenets ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  ;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
  ;; are the three important ones:
  ;;
  ;; + `doom-font'
  ;; + `doom-variable-pitch-font'
  ;; + `doom-big-font' -- used for `doom-big-font-mode'
  ;;
  ;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
  ;; font string. You generally only need these two:
  (setq doom-font (font-spec :family "Fira Code" :size 14))

  ;; There are two ways to load a theme. Both assume the theme is installed and
  ;; available. You can either set `doom-theme' or manually load a theme with the
  ;; `load-theme' function. These are the defaults.
  (setq doom-theme 'doom-one)

  ;; If you want to change the style of line numbers, change this to `relative' or
  ;; `nil' to disable it:
  (setq display-line-numbers-type nil)

  (defvar dock-side 'right)

  (defun set-dock-side ()
    (set-popup-rules!
      (when (featurep! +all)
        `(("^\\*"  :side ,dock-side :slot 1 :vslot -1 :select t)
          ("^ \\*" :side ,dock-side :slot 1 :vslot -1 :size +popup-shrink-to-fit)))
      (when (featurep! +defaults)
        `(("^\\*Completions" :ignore t)
          ("^\\*Local variables\\*$"
           :side ,dock-side :vslot -1 :slot 1 :size +popup-shrink-to-fit)
          ("^\\*\\(?:[Cc]ompil\\(?:ation\\|e-Log\\)\\|Messages\\)"
           :side ,dock-side :vslot -2 :size 0.3  :autosave t :quit t :ttl nil)
          ("^\\*\\(?:doom \\|Pp E\\)" ; transient buffers (no interaction required)
           :side ,dock-side :vslot -3 :size +popup-shrink-to-fit :autosave t :select ignore :quit t :ttl 0)
          ("^\\*doom:"                  ; editing buffers (interaction required)
           :side ,dock-side :vslot -4 :size 0.35 :autosave t :select t :modeline t :quit nil :ttl t)
          ("^\\*doom:\\(?:v?term\\|e?shell\\)-popup" ; editing buffers (interaction required)
           :side ,dock-side :vslot -5 :size 0.35 :select t :modeline nil :quit nil :ttl nil)
          ("^\\*\\(?:Wo\\)?Man "
           :side ,dock-side :vslot -6 :size 0.45 :select t :quit t :ttl 0)
          ("^\\*Calc"
           :side ,dock-side :vslot -7 :side ,side :size 0.4 :select t :quit nil :ttl 0)
          ("^\\*Customize"
           :side ,dock-side :slot 2 :size 0.5 :select t :quit nil)
          ("^ \\*undo-tree\\*"
           :slot 2 :side left :size 20 :select t :quit t)
          ;; `help-mode', `helpful-mode'
          ("^\\*[Hh]elp"
           :side ,doc,,k-side :slot 2 :vslot -8 :size 0.35 :select t)
          ("^\\*eww\\*"                 ; `eww' (and used by dash docsets)
           :side ,dock-side :vslot -11 :size 0.35 :select t)
          ("^\\*info\\*$"               ; `Info-mode'
           :side ,dock-side :slot 2 :vslot 2 :size 0.45 :select t)))
      `(("^\\*Warnings" :side ,dock-side :vslot 99 :size 0.25)
        ("^\\*Backtrace" :side ,dock-side :vslot 99 :size 0.4 :quit nil)
        ("^\\*CPU-Profiler-Report "    :side ,dock-side :vslot 100 :slot 1 :height 0.4 :width 0.5 :quit nil)
        ("^\\*Memory-Profiler-Report " :side ,dock-side :vslot 100 :slot 2 :height 0.4 :width 0.5 :quit nil)
        ("^\\*Process List\\*" :side ,dock-side :vslot 101 :size 0.25 :select t :quit t)
        ("^\\*\\(?:Proced\\|timer-list\\|Abbrevs\\|Output\\|Occur\\|unsent mail\\)\\*" :ignore t)))
    )

  (defun dock-to-side ()
    (interactive)
    (setq dock-side 'right)
    (set-dock-side))

  (defun dock-to-bottom ()
    (interactive)
    (setq dock-side 'bottom)
    (set-dock-side))

  (defun dock-toggle ()
    (interactive)
    (setq dock-side (case dock-side
                      ('bottom 'right)
                      ('right 'bottom)))
    (set-dock-side))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Extra packages to install ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (after! block-nav
    (setq block-nav-center-after-scroll t
          block-nav-skip-comment t))
  (after! mini-modeline
    (setq mini-modeline-face-attr '(:background "#1c1e24")
          mini-modeline-r-format
          '("%e" (:eval (number-to-string (winum-get-number)))
            " "
            evil-mode-line-tag
            " "
            mode-line-modified
            mode-line-buffer-identification
            " "
            mode-line-position
            (:eval (symbol-name major-mode))
            "   "
            (:eval (magit-get-current-branch))
            "  "
            (:eval (format-time-string "%H:%M%P")))
          mini-modeline-l-format nil))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Web-mode settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (defun insert-html-form ()
    (interactive)
    (save-excursion
      (insert "<form>\n\n</form>"))
    (sgml-indent-line)
    (forward-line 2)
    (sgml-indent-line)
    (forward-line -1))

  (defun insert-html-input ()
    (interactive)
    (save-excursion
      (insert "<input type=\"\" name=\"\" />"))
    (forward-char 12)
    (sgml-indent-line))

  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1)
    (company-tide)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Org-mode settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (straight-use-package 'org-bullets)
  (straight-use-package 'htmlize)

  (org-babel-do-load-languages
   '((js . t)
     (scheme . t)
     (lisp . t)))

  (add-hook
   'org-mode-hook
   (lambda ()
     (org-bullets-mode 1)
     (visual-line-mode 1)
     (auto-fill-mode 1)
     (setq fill-column 100
           line-spacing 0.2
           left-margin-width 2
           right-margin-width 2)
     (set-window-buffer nil (current-buffer))
     (variable-pitch-mode)))

  ;; Some nice defaults
  ;; Solution came from:
  ;; https://lepisma.xyz/2017/10/28/ricing-org-mode#other-tweaks
  (setq org-startup-indented t
        org-startup-with-inline-images t
        org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
        org-ellipsis "  "             ;; folding symbol
        org-pretty-entities t
        org-hide-emphasis-markers t
        ;; show actually italicized text instead of /italicized text/
        org-agenda-block-separator ""
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

  (let* ((headline `(:font "NotoSans" :weight bold))
         (code `(:font "FiraCode"))
         (code-block `(,@code :height 1.05
                              :background "#282C34"))
         (block-line `(,@code :height 90
                              :foreground "#abb2bf"
                              :background "#343843")))
    (custom-theme-set-faces
     'user
     `(org-table ((t (,@code-block))))
     `(org-code ((t (,@code-block))))
     `(org-block ((t (,@code-block))))
     `(org-block-begin-line ((t (,@block-line))))
     `(org-block-end-line ((t (,@block-line))))
     `(org-level-8 ((t (,@headline :height 1.1 :foreground "#9494E6"))))
     `(org-level-7 ((t (,@headline :height 1.15 :foreground "#c678dd"))))
     `(org-level-6 ((t (,@headline :height 1.2 :foreground "#e06c75"))))
     `(org-level-5 ((t (,@headline :height 1.25 :foreground "#d19a66"))))
     `(org-level-4 ((t (,@headline :height 1.3 :foreground "#B5AF70"))))
     `(org-level-3 ((t (,@headline :height 1.35 :foreground "#B5AF70"))))
     `(org-level-2 ((t (,@headline :height 1.4 :foreground "#98c379"))))
     `(org-level-1 ((t (,@headline :height 1.45 :foreground "#56b6c2"))))))

  (defun org-presentation-start ()
    (interactive)
    (evil-close-folds)
    (evil-goto-first-line)
    (org-next-visible-heading 1)
    (evil-open-fold)
    (forward-line 1)
    (evil-scroll-line-to-top (line-number-at-pos)))

  (defun org-presentation-next-slide ()
    (interactive)
    (org-next-heading)
    (forward-line 1)
    (evil-scroll-line-to-top (line-number-at-pos)))

  (defun org-next-heading ()
    (interactive)
    (evil-toggle-fold)
    (evil-next-line)
    (evil-toggle-fold))

  (defun org-presentation-previous-slide ()
    (interactive)
    (org-previous-heading)
    (forward-line 1)
    (evil-scroll-line-to-top (line-number-at-pos)))

  (defun org-previous-heading ()
    (interactive)
    (evil-toggle-fold)
    (evil-previous-line)
    (evil-toggle-fold)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (map! :i "," (insert ","))
  (setf doom-localleader-key ",")

  (setf keyboard-layout 'workman)

  (defun qwerty ()
    (setf keyboard-layout 'qwerty))

  (defun workman ()
    (setf keyboard-layout 'workman))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Treemacs keybinds ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (map! ;; Treemacs navigation
   :after treemacs-evil
   :map evil-treemacs-state-map
   ;; For workman
   "n" 'treemacs-next-line
   "e" 'treemacs-previous-line
   "C-n" 'treemacs-next-neighbour
   "C-e" 'treemacs-previous-neighbour
   ;; For qwerty
   "j" 'treemacs-next-line
   "k" 'treemacs-previous-line
   "C-j" 'treemacs-next-neighbour
   "C-k" 'treemacs-previous-neighbour

   "C-p" 'treemacs-goto-parent-node
   "u" 'treemacs-root-up
   "d" 'treemacs-root-down
   "R" 'treemacs-change-root)

  (map!
   :after company
   "C-c h" #'company-quickhelp-manual-begin)

  (map! ;; Treemacs opening nodes
   :after treemacs-evil
   :map evil-treemacs-state-map
   "o" nil
   :prefix "o"
   "f" 'treemacs-visit-node-in-most-recently-used-window
   "v" 'treemacs-visit-node-horizontal-split
   "h" 'treemacs-visit-node-vertical-split
   "e" 'treemacs-visit-node-in-external-application)

  (map! ;; Treemacs files stuffs
   :after treemacs-evil
   :map evil-treemacs-state-map
   "f" nil
   :prefix "f"
   "f" 'treemacs-create-file
   "d" 'treemacs-create-dir
   "r" 'treemacs-rename
   "x" 'treemacs-delete
   "m" 'treemacs-move-file
   "y" 'treemacs-copy-file)

  (map! ;; Treemacs toggles
   :after treemacs-evil
   :map evil-treemacs-state-map
   "t" nil
   :prefix "t"
   "f" 'treemacs-follow-mode
   "w" 'treemacs-filewatch-mode
   "g" 'treemacs-git-mode
   "i" 'treemacs-fringe-indicator-mode
   "h" 'treemacs-toggle-show-dotfiles
   "r" 'treemacs-toggle-fixed-width)

  (map! ;; Treemacs project stuffs
   :after treemacs-evil
   :map evil-treemacs-state-map
   "p" nil
   :prefix "p"
   "a" 'treemacs-add-project-to-workspace
   "r" 'treemacs-rename-project
   "x" 'treemacs-remove-project-from-workspace
   "c" 'treemacs-collapse-project)

  (map! ;; Treemacs workspaces
   :after treemacs-evil
   :map evil-treemacs-state-map
   "w" nil
   :prefix "w"
   "e" 'treemacs-edit-workspaces
   "c" 'treemacs-create-workspace
   "x" 'treemacs-remove-workspace
   "r" 'treemacs-rename-workspace
   "s" 'treemacs-switch-workspace
   "f" 'treemacs-set-fallback-workspace)

  (map! ;; Treemacs misc
   :after treemacs-evil
   :map evil-treemacs-state-map
   "r" 'treemacs-refresh
   "W" 'treemacs-set-width
   "c" 'treemacs-copy-path-at-point
   "C" 'treemacs-copy-project-root
   "s" 'treemacs-resort
   "b" 'treemacs-add-bookmark
   "?" 'treemacs-common-helpful-hydra
   "q" 'treemacs-quit
   "RET" 'treemacs-RET-action)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Window navigation/switching ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (map!
   :leader
   "SPC" #'counsel-M-x
   "?" #'+default/search-project
   "/" #'evilnc-comment-or-uncomment-lines
   "0" #'treemacs-select-window
   "1" #'winum-select-window-1
   "2" #'winum-select-window-2
   "3" #'winum-select-window-3
   "4" #'winum-select-window-4
   "5" #'winum-select-window-5
   "6" #'winum-select-window-6
   "7" #'winum-select-window-7
   "8" #'winum-select-window-8
   "9" #'winum-select-window-9
   "v" #'er/expand-region
   "s s" nil
   (:prefix ("s s" . "Header")
    "a" #'spell-fu-word-add
    "x" #'spell-fu-word-remove
    "n" #'spell-fu-goto-next-error
    "p" #'spell-fu-goto-next-error))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; when too close to god ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (map!
   :envm "M-[" #'centaur-tabs-backward
   :envm "M-]" #'centaur-tabs-forward
   "<f10>" #'kill-current-buffer
   "<f11>" #'delete-window
   "<f12>" #'kill-buffer-and-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Some evil modifications ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun qwerty ()
    (interactive)
    (map!
     :nv "h" #'evil-backward-char
     :nv "H" #'block-nav-previous-indentation-level
     :nv "j" #'evil-next-line
     :nv "J" #'block-nav-next-block
     :nv "k" #'evil-previous-line
     :nv "K" #'block-nav-previous-block
     :nv "l" #'evil-forward-char
     :nv "L" #'block-nav-next-indentation-level

     :nv "y" #'evil-yank
     :nv "n" #'evil-next-match
     :nv "N" #'evil-previous-match
     :nv "e" #'evil-forward-WORD-end
     :nv "o" #'evil-open-below
     :nv "O" #'evil-open-above))

  (defun workman ()
    (interactive)
    (map!
     :nv "y" #'evil-backward-char
     :nv "Y" #'block-nav-previous-indentation-level
     :nv "n" #'evil-next-line
     :nv "N" #'block-nav-next-block
     :nv "e" #'evil-previous-line
     :nv "E" #'block-nav-previous-block
     :nv "o" #'evil-forward-char
     :nv "O" #'block-nav-next-indentation-level

     :nv "h" #'evil-yank
     :nv "j" #'evil-next-match
     :nv "J" #'evil-previous-match
     :nv "k" #'evil-forward-WORD-end
     :nv "l" #'evil-open-below
     :nv "L" #'evil-open-above))

  ;; Determine which keybindings to use depending on if Moonlander is plugged
  ;; in or not.
  (if (string-empty-p (shell-command-to-string "moonlander"))
      (qwerty)
    (workman))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Language-specific keybinds ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (map! ;; Clojure
   :localleader :map cider-mode-map
   "'" #'cider-jack-in
   "\"" #'cider-jack-in-cljs
   "`" #'cider-jack-in-clj&clj)

  (map! ;; Racket
   :map racket-mode-map
   :i "[" #'self-insert-command
   :i "]" #'self-insert-command
   (:localleader
    "'" #'racket-repl
    "d" #'racket-doc
    "e r" #'racket-send-region
    "c d" #'racket-send-definition
    "e e" #'racket-send-last-sexp))

  (map! ;; Common Lisp
   :localleader :map lisp-mode-map
   "'" #'slime
   "e b" #'slime-eval-buffer
   "e r" #'slime-eval-region
   "c d" #'slime-compile-defun
   "c l" #'slime-compile-and-load-file
   "d" #'slide-describe-symbol
   "i" #'slime-interrupt)

  (map! ;; Emacs Lisp
   :localleader :map emacs-lisp-mode-map
   :desc "Describe" "h" #'describe-symbol
   (:prefix "l"
    :desc "Lint buffer" "l" #'package-lint-current-buffer
    :desc "Lint comments" "d" #'checkdoc)
   :n "[" #'lispy-backward
   :n "]" #'lispy-forward
   :i "[" (cmd! (insert "["))
   :i "]" (cmd! (insert "]")))

  (map! ;; Org-mode
   :localleader :map org-mode-map
   ":" #'org-babel-execute-src-block
   "B" #'org-babel-execute-buffer
   "d s" #'org-presentation-start
   "d j" #'org-presentation-next-slide
   "d k" #'org-presentation-previous-slide
   "j" #'org-presentation-next-slide
   "k" #'org-presentation-previous-slide
   "n" #'org-presentation-next-slide
   "m" #'org-presentation-previous-slide
   "t" #'evil-toggle-fold
   "e" #'org-html-export-to-html
   "x" #'org-toggle-checkbox
   "p" #'org-publish-current-project
   "a" nil
   "a d" #'org-time-stamp
   "a t" #'org-insert-todo-heading
   "i" nil
   :desc "Insert source block" "i s" (cmd! (org-insert-structure-template "src"))
   :desc "insert block quote" "i q" (cmd! (org-insert-structure-template "quote"))
   :desc "Insert example" "i e" (cmd! (org-insert-structure-template "example"))
   :desc "Insert comment" "i c" (cmd! (org-insert-structure-template "comment"))
   :desc "Insert center" "i C" (cmd! (org-insert-structure-template "centre")))

  (map! ;; Web mode
   :localleader :map web-mode-map
   "i" nil
   (:prefix ("i" . "Insert")
    (:prefix ("h" . "Header")
     "1" 'html-headline-1
     "2" 'html-headline-2
     "3" 'html-headline-3
     "4" 'html-headline-4
     "5" 'html-headline-5
     "6" 'html-headline-6)
    (:prefix ("l" . "List")
     "o" 'html-ordered-list
     "u" 'html-unordered-list
     "i" 'html-list-item)
    "d" 'html-div
    "s" 'html-span
    "I" 'html-image
    "a" 'html-href-anchor
    "p" 'html-paragraph
    "f" 'insert-html-form
    "i" 'insert-html-input)
   "c" 'sgml-close-tag
   "f" 'format))
