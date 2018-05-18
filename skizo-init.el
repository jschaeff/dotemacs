;; Pour tester : emacs -q -l skizo-emacs/skizo-init.e
;; Dans .emacs.d/init.el mettre :
;;  (load "~/skizo-emacs/skizo-init.el")

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

; Retours à la ligne
(global-visual-line-mode 1)

;; TODO : à configurer
;; (use-package 'whitespace-cleanup
;;   )

(setq user-full-name "Jonathan Schaeffer"
      user-mail-address "jonathan.schaeffer@univ-grenoble-alpes.fr")

;; Gestion des backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(fset 'yes-or-no-p 'y-or-n-p)

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
(load "~/skizo-emacs/multiple-cursors.el")
(load "~/skizo-emacs/shell.el")
(load "~/skizo-emacs/whitespaces.el")
(load "~/skizo-emacs/undo-tree.el")
(load "~/skizo-emacs/tex.el")
(provide 'skizo-init)
