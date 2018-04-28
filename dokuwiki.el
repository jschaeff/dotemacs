(use-package atomic-chrome
  :ensure t
  :config
  (atomic-chrome-start-server)
  )

(use-package dokuwiki
  :ensure t
;  :init
;  (load-library "outline-magic")
  :config
  (add-hook 'dokuwiki-mode-hook 'orgtbl-mode)
  (add-hook 'dokuwiki-mode-hook 'outline-minor-mode)

  )
