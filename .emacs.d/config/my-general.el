(use-package general
  :ensure t
  :config
  (progn
    (general-create-definer my-leader-def
      :prefix "SPC")
    (my-leader-def
      :states 'normal
      :keymaps 'normal
      "f t" 'neotree-toggle
    )))

(provide 'my-general)
