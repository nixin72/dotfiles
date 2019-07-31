(require 'my-secrets)

(use-package wakatime-mode
  :ensure t
  :config
  (progn
    (setq wakatime-python-bin "/usr/local/bin/python3")
    (setq wakatime-api-key my-wakatime-api-key)
    (setq wakatime-cli-path "/usr/local/bin/wakatime")))

(provide 'my-wakatime)
