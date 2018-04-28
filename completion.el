;;;; Company auto completion
(use-package company
  :ensure t
  :diminish company-mode
  :defer t
  :config (global-company-mode))


;; Correction orthographique et syntaxique
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  ;; Pour que l'insertion de dates dans orgmode fonctionne :
  (define-key flycheck-mode-map (kbd "C-c ! !") 'org-time-stamp-inactive)
  )

;; Smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))
