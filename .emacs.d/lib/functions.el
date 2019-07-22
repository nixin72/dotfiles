(defun import-packages (&rest packages)
  "Loads a package from the packages directory and imports it"
  (while packages
    (let ((name (pop packages))
	  (literal (pop packages)))
      (add-to-list 'load-path (concat "~/.emacs.d/packages/" name))
      (require literal))))

(defun set-theme (theme-name)
  "Sets the theme for emacs to use"
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (load-theme theme-name t))

(defun set-font (font-name)
  "Sets the font for emacs to use"
  (add-to-list 'default-frame-alist '(font . ,font-name))
  (set-face-attribute 'default t :font font-name)
  (set-frame-font font-name nil t))

(defun set-keybindings ()
  "Set all keybindings in here"
  (global-set-key (kbd "C-x C-f") 'sidebar-open)
  (global-set-key (kbd "C-x C-a") 'sidebar-buffers-open))

