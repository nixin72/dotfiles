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

(general-define-key
  :states '(normal visual emacs)
  :prefix ","
  :keymaps '(html-mode-map mhtml-mode-map sgml-mode-map)
  "i h 1" 'html-headline-1
  "i h 2" 'html-headline-2
  "i h 3" 'html-headline-3
  "i h 4" 'html-headline-4
  "i h 5" 'html-headline-5
  "i h 6" 'html-headline-6
  "i l o" 'html-ordered-list
  "i l u" 'html-unordered-list
  "i l i" 'html-list-item
  "i d" 'html-div
  "i s" 'html-span
  "i I" 'html-image
  "i a" 'html-href-anchor
  "i p" 'html-paragraph
  "i f" 'insert-html-form
  "i i" 'insert-html-input
  "c" 'sgml-close-tag
  "f" 'format)
