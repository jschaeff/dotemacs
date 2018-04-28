;; Pour tester : emacs -q -l skizo-emacs/skizo-init.e
;; Dans .emacs.d/init.el mettre :
;;  (load "~/skizo-emacs/skizo-init.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(package-selected-packages
   (quote
    (mu4e-alert smart-mode-line-powerline-theme flyspell-correct-ivy markdown-mode yaml-mode kanban counsel multiple-cursors sublimity smooth-scrolling real-auto-save calfw-ical outshine jinja2-mode outline-magic atomic-chrome ox-reveal projectile company dokuwiki dokuwiki-mode treemacs pdf-tools ivy spacemacs-theme org)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#262626" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "GOOG" :family "Noto Sans Mono")))))
(put 'downcase-region 'disabled nil)



(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq current-language-environment "UTF-8")
(tool-bar-mode 0)  ;; Désactiver la barre de boutons très moche

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


; Tabulations :
; toujours 4 espaces :
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; TODO : à configurer
;; (use-package 'whitespace-cleanup

;;   )


(load "~/skizo-emacs/settings.el")
(load "~/skizo-emacs/mu4e.el")
(load "~/skizo-emacs/spelling.el")
(load "~/skizo-emacs/eyecandy.el")
(load "~/skizo-emacs/erc.el")
(load "~/skizo-emacs/completion.el")
(load "~/skizo-emacs/orgmode.el")
(load "~/skizo-emacs/treemacs.el")
(load "~/skizo-emacs/dokuwiki.el")
(load "~/skizo-emacs/magit.el")
(load "~/skizo-emacs/ivy.el")
(load "~/skizo-emacs/markdown.el")
(load "~/skizo-emacs/multiple-cursos.el")
