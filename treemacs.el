(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq ; treemacs-header-function            #'treemacs--create-header-projectile
        treemacs-follow-after-init          t
        treemacs-width                      35
        treemacs-indentation                2
        treemacs-git-integration            t
        treemacs-change-root-without-asking nil
        treemacs-sorting                    'alphabetic-desc
        treemacs-show-hidden-files          t
        treemacs-never-persist              nil
        treemacs-silent-refresh             t
        treemacs-goto-tag-strategy          'refetch-index)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  :bind
  (:map global-map
        ([f8]        . treemacs-toggle)
        ("<C-M-tab>" . treemacs-toggle)
        ("M-0"       . treemacs-select-window)
        ("C-c 1"     . treemacs-delete-other-windows)
        )
  )
