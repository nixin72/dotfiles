(straight-use-package 'org-bullets)
(straight-use-package 'htmlize)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

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
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(let* ((headline `(:font "NotoSans" :weight bold))
       (code `(:font "FiraCode"))
       (code-block `(,@code :height 1.05 :background "#282C34"))
       (block-line `(,@code :height 90 :foreground "#abb2bf" :background "#343843")))
  (custom-theme-set-faces
   'user
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
   
(defun org-next-heading ()
  (interactive)
  (evil-toggle-fold)
  (evil-next-line)
  (evil-toggle-fold))

(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps 'org-mode-map
  "n" 'org-next-heading
  "t" 'evil-toggle-fold
  "e" 'org-html-export-to-html
  "r" 'org-mode-restart
  "p" 'org-publish-current-project
  "i s" (lambda () (interactive) (org-insert-structure-template "src"))
  "i q" (lambda () (interactive) (org-insert-structure-template "quote"))
  "i e" (lambda () (interactive) (org-insert-structure-template "example"))
  "i c" (lambda () (interactive) (org-insert-structure-template "comment"))
  "i C" (lambda () (interactive) (org-insert-structure-template "center")))

(defvar my-css-github
  "<link rel='stylesheet'
         href='https://raw.githubusercontent.com/nixin72/dotfiles/master/.emacs.d/src/languages/my-org-css.css'
         type='text/css' />")

(defvar repos-dir "/run/media/nixin72/s/repos/")
(defvar my-site-dir (concat repos-dir "nixin72.github.com/"))

(defvar talks-dir (concat repos-dir "talks/"))

(setq org-publish-project-alist
      `(("nixin72.github.io:root"
         :base-directory ,my-site-dir
         :publishing-directory ,(concat my-site-dir "docs")
         :section-numbers nil
         :table-of-contents nil
         :publishing-function org-html-publish-to-html
         :style "<link rel='stylesheet' href='assets/my-org-css.css' type='text/css'")
        ("nixin72.github.io:questions"
         :base-directory ,(concat my-site-dir "questions")
         :publishing-directory ,(concat my-site-dir "docs/questions")
         :section-numbers nil
         :table-of-contents nil
         :publishing-function org-html-publish-to-html
         :style "<link rel='stylesheet' href='../assets/my-org-css.css' type='text/css'")
        ("nixin72.github.io:blog"
         :base-directory ,(concat my-site-dir "blog")
         :publishing-directory ,(concat my-site-dir "docs/blog")
         :section-numbers nil
         :table-of-contents nil
         :publishing-function org-html-publish-to-html
         :style "<link rel='stylesheet' href='../assets/my-org-css.css' type='text/css'")
        ("nixin72.github.io:assets"
         :base-directory ,(concat my-site-dir "assets")
         :base-extension "css\\|el\\|js\\|jpg\\|gif\\|png"
         :publishing-directory ,(concat my-site-dir "docs/assets")
         :publishing-function org-publish-attachment
         :style "<link rel='stylesheet' href='' type='text/css'")
        ("nixin72.github.io"
         :components ("nixin72.github.io:root"
                      "nixin72.github.io:questions"
                      "nixin72.github.io:blog"
                      "nixin72.github.io:assets"))
        ("talks:metaprogramming"
         :base-directory ,(concat talks-dir "meta-programming")
         :publishing-directory ,(concat talks-dir "meta-programming/pub")
         :section-numbers nil
         :publishing-function org-html-publish-to-html
         :style ,my-css-github)))

(provide 'my-org)
