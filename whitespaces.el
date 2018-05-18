(use-package whitespace
  :bind (("C-c T w" . whitespace-mode))
  :init
  ;; (dolist (hook '(prog-mode-hook))
  ;;   (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config (setq whitespace-line-column nil)
  :diminish whitespace-mode)
