; Git
;; désactiver VC mode pour laisser la place à MAGIT, mais en perdant la belle icône dans spaceline...
(use-package magit
  :ensure t
;  :init
;  (setq vc-handled-backends ())
  :bind ("C-c g" . magit-status)
  )

