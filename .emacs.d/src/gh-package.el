(defvar gh-package-dir "~/.emacs.d/ghpkg")

(add-to-list 'load-path gh-package-dir)

(defvar gh-package-use-ssh t)

(defun gh-package (package &rest options)
  (let* ((package-name (symbol-name package))
         (dir-name (replace-regexp-in-string "/" "--" package-name)))
    (shell-command
      (concat
       (if gh-package-use-ssh
           "git clone git@github.com:"
           "git clone https://github.com/")
       package-name ".git "
       gh-package-dir "/" dir-name))))

(provide 'gh-package)
