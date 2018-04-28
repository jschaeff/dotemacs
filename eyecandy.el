
(use-package spacemacs-common
    :ensure spacemacs-theme
    :config
    (load-theme 'spacemacs-dark t)
    (setq spacemacs-theme-org-agenda-height nil)
    (setq spacemacs-theme-org-height nil)
    )


(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'powerline)
(sml/setup))
;; (use-package spaceline
;;    :ensure t
;;    :demand t
;;    :init
;;  ;  (setq powerline-default-separator 'arrow-fade)
;;    :config
;;    (require 'spaceline-config)
;;    (spaceline-spacemacs-theme)
;;    )
 
;;  (use-package spaceline-all-the-icons
;;    :ensure t
;;    :after spaceline
;;    :config
;;    (spaceline-all-the-icons-theme)
;;    )

(use-package sublimity
  :ensure t
  :config
  (require 'sublimity)
  (require 'sublimity-scroll)
  ;  (require 'sublimity-map)
  ;  (sublimity-map-set-delay 3))
  (sublimity-mode 1))

;;;;;;;;;;;; Highlighting ;;;;;;;;;;;;;;
;; highlight parentheses
(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :init (add-hook 'prog-mode-hook #'highlight-parentheses-mode)
  :config (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))

;; Interactively highlight the current-window (by dimming the others)
;; (use-package Dimmer
;;  :init (add-hook 'after-init-hook #'dimmer-mode))

;; Highlight symbol under cursor
(use-package symbol-overlay
  :ensure t
  :diminish symbol-overlay-mode
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-jump-next)
         ("M-p" . symbol-overlay-jump-prev)
         ([C-f3] . symbol-overlay-put)
         ([f3] . symbol-overlay-jump-next)
         ([S-f3] . symbol-overlay-jump-prev)
         ([M-f3] . symbol-overlay-remove-all))
  :init (add-hook 'prog-mode-hook #'symbol-overlay-mode))

;;;;;;;;;;;;; End Highlighting ;;;;;;;;;;;;;
