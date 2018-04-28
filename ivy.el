(use-package swiper                     ; Isearch with an overview
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  :init
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	magit-completing-read-function 'ivy-completing-read
;;    counsel-grep-base-command "rg -i -M 120 --no-heading --line-number --color never '%s' %s" ; Recherche plus rapide que grep
    )
  (global-set-key "\C-s" 'ora-swiper)
  :bind
  ("C-s" . swiper)
;;   ("M-x" . counsel-M-x)
  )



;;    :bind (("C-c s s" . swiper)
;;    :bind (("C-c s s" . mu-swiper)
;;           ("C-c s S" . swiper-all))
;;    :init
;;    (defun mu-swiper ()
;;      "Choose between `swiper--ivy' and `counsel-grep' based upon file size."
;;      (interactive)
;;      (if (and (buffer-file-name)
;;               (not (ignore-errors
;;                      (file-remote-p (buffer-file-name))))
;;               (if (eq major-mode 'org-mode)
;;                   (> (buffer-size) 60000)
;;                 (> (buffer-size) 300000)))
;;          (progn
;;            (save-buffer)
;;            (counsel-grep))
;;        (swiper--ivy (swiper--candidates))))
;;    :bind (:map isearch-mode-map
;;                ("M-i" . swiper-from-isearch)))
;; )
