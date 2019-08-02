;; Source: https://github.com/Llewxamris/my-emacs/blob/master/config/languages/my-markdown.el

(use-package markdown-mode
  :ensure markdown-mode
  :commands (markdown-mode gfm-mode)
  ;; Use GitHub markdown on README.md files, and regular Markdown on others
  :mode (("README\\.md'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)))

(provide 'my-markdown)
