

(use-package ispell
  :if (not (bound-and-true-p disable-pkg-ispell))
  :defer 15
  :config
  (progn
    (cond
     ((executable-find "aspell")
      (setq ispell-program-name "aspell")
      (setq ispell-extra-args   '("--sug-mode=ultra"
                                  "--lang=fr_FR")))
     ((executable-find "hunspell")
      (setq ispell-program-name "hunspell")
      (setq ispell-extra-args   '("-d fr_FR"))))

    ;; Save a new word to personal dictionary without asking
    (setq ispell-silently-savep t)

    (use-package flyspell
      :init
      (progn
        ;; Below variables need to be set before `flyspell' is loaded.
        (setq flyspell-use-meta-tab nil)
        ;; Binding for `flyspell-auto-correct-previous-word'.
        (setq flyspell-auto-correct-binding (kbd "<S-f12>")))
      :config
      (progn
        (add-hook 'prog-mode-hook #'flyspell-prog-mode)
        (with-eval-after-load 'auto-complete
          (ac-flyspell-workaround))
        ;; https://github.com/larstvei/dot-emacs#flyspell
        (add-hook 'text-mode-hook #'turn-on-flyspell)
        (add-hook 'org-mode-hook  #'turn-on-flyspell)

        ;; https://github.com/d12frosted/flyspell-correct
        (use-package flyspell-correct-ivy
          :after flyspell-correct
          :bind (:map modi-mode-map
                 ("<f12>" . flyspell-correct-word-generic)))

        (bind-keys
         :map flyspell-mode-map
          ;; Stop flyspell overriding other key bindings
          ("C-," . nil)
          ("C-." . nil)
          ("<C-f12>" . flyspell-goto-next-error))))))


(use-package flyspell
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode)
    )
  ;; :config
  ;; Sets flyspell correction to use two-finger mouse click
  ;; (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  )
