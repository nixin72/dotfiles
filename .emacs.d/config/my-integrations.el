(require 'my-secrets)

(use-package alert
  :ensure t
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))
(use-package circe :ensure t)
(use-package request :ensure t)
(use-package websocket :ensure t)
(use-package emojify :ensure t)
(use-package oauth2 :ensure t)

;;; My slack configuration
;;;
;;; Documentation: 
;;; https://github.com/yuya373/emacs-slack
(use-package slack
  :ensure t
  :commands (slack-start)
  :init
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "github"
   :default t
   :client-id my-slack-client-id
   :client-secret my-slack-client-secret
   :token my-slack-token
   :subscribed-channels my-slack-channels
   :full-and-display-names t)


  )
