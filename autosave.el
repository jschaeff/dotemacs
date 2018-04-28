(use-package real-auto-save
  :ensure t
  :config
  (progn
    (add-hook 'prog-mode-hook 'real-auto-save-mode)
    (setq real-auto-save-interval 3)
    )
  )
