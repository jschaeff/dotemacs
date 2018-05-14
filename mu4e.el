(setq send-mail-function 'smtpmail-send-it)
(use-package mu4e
  :commands (mu4e mu4e-headers-search mu4e-compose-new mu4e~proc-add)
  :bind ("C-c m" . mu4e)
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :config
  (progn
    (add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)
    ;;; configure to kill draft buffers
    ;;;    (load-library "mu4e-kill-empty-drafts")
    (setq mu4e-maildir (expand-file-name "~/mail")
          user-mail-address "jonathan.schaeffer@univ-grenoble-alpes.fr"
          user-full-name "Jonathan Schaeffer"
          mu4e-user-mail-address-list (list "jonathan.schaeffer@univ-grenoble-alpes.fr" "jonathan.schaeffer@ntymail.com" "jonathan.schaeffer@gmx.fr")
          mu4e-compose-reply-ignore-address '("undisclosed-recipients.*" "jonathan\\.schaeffer@.*" ".*@ujf-grenoble.fr")
          mu4e-compose-complete-ignore-address-regexp  "\\(no-?reply\\|reply.github.com\\|ujf-grenoble.fr\\)"
          mu4e-use-fancy-chars t
          mu4e-sent-messages-behavior 'sent
          mu4e-get-mail-command "mbsync -a"
          mu4e-html2text-command "w3m -T text/html"
          mu4e-update-interval 120
          mu4e-headers-auto-update t
          mu4e-headers-fields '((:human-date . 12)
                                (:flags . 6)
                                (:maildir . 10)
                                (:mailing-list . 15)
                                (:from . 22)
                                (:subject))
          message-signature-file "~/skizo-emacs/mail-signature" ; put your signature in this file
          mu4e-change-filenames-when-moving t
          mu4e-headers-date-format "%F"
          mu4e-headers-time-format "%R"
          smtpmail-queue-mail nil  ;; start in normal mode
          smtpmail-queue-dir   "~/mail/queue/cur"
          smime-keys '(("jonathan.schaeffer@univ-grenoble-alpes.fr" "~/Certs/2017TerenaSchaeffer_UGA.pem" nil))
          smime-certificate-directory "~/mail/certs/"
          mu4e-maildir-shortcuts '(("/uga/INBOX" . ?i)
                                   ("/uga/alertes" . ?a)
                                   ("/uga/Sent" . ?s)
                                   ("/ntymail/INBOX" . ?n)
                                   ("/gmx/INBOX" . ?g))
          )
    ;; Contexts (setup smtp servers)
    ;;
    (setq mu4e-compose-context-policy 'ask-if-none
          mu4e-context-policy 'pick-first
          mu4e-contexts
          `( ,(make-mu4e-context
               :name "UGA"
               :enter-func (lambda () (mu4e-message "Switch to UGA"))
               ;; leave-func not defined
               :match-func (lambda (msg)
                             (when msg
                               (string-match-p "^/uga" (mu4e-message-field msg :maildir))))
               :vars '((smtpmail-smtp-user           . "schaeffj@univ-grenoble-alpes.fr")
                       (smtpmail-default-smtp-server . "smtps.univ-grenoble-alpes.fr")
                       (smtpmail-smtp-server         . "smtps.univ-grenoble-alpes.fr")
                       (smtpmail-smtp-service        . 587)
                       (mail-reply-to                . "jonathan.schaeffer@univ-grenoble-alpes.fr")
                       (user-mail-address            . "jonathan.schaeffer@univ-grenoble-alpes.fr")
                       (user-full-name               . "Jonathan Schaeffer")
                       (mu4e-compose-signature       . t)
                       (message-signature-file       . "~/.emacs.d/mail-signature")
                       (mu4e-sent-folder             . "/uga/Sent")
                       (mu4e-drafts-folder           . "/Brouillons")
                       (mu4e-trash-folder            . "/uga/Trash")
                       (mu4e-refile-folder           . "/uga/Archives")
                       (add-hook 'message-send-hook 'mml-secure-message-sign-smime)
                       ))
             ,(make-mu4e-context
               :name "NTYMAIL"
               :enter-func (lambda () (mu4e-message "Switch to NewManity Mail"))
               :match-func (lambda (msg)
                             (when msg
                               (string-match-p "^/ntymail" (mu4e-message-field msg :maildir))))
               :vars '((smtpmail-smtp-user           . "jonathan.schaeffer@ntymail.com")
                       (smtpmail-default-smtp-server . "webmail.ntymail.com")
                       (smtpmail-smtp-server         . "webmail.ntymail.com")
                       (smtpmail-smtp-service        . 587)
                       (mail-reply-to                . "jonathan.schaeffer@ntymail.com")
                       (user-mail-address            . "jonathan.schaeffer@ntymail.com")
                       (user-full-name               . "Jonathan Schaeffer")
                       (mu4e-compose-signature       . t)
                       (mu4e-sent-folder             . "/Sent")
                       (mu4e-drafts-folder           . "/Brouillons")
                       (mu4e-trash-folder            . "/ntymail/Trash")
                       (mu4e-refile-folder           . "/ntymail/Archives")))
             ,(make-mu4e-context
               :name "GMX"
               :enter-func (lambda () (mu4e-message "Switch to GMX Mail"))
               :match-func (lambda (msg)
                             (when msg
                               (string-match-p "^/gmx" (mu4e-message-field msg :maildir))))
               :vars '((smtpmail-smtp-user           . "jonathan.schaeffer@gmx.fr")
                       (smtpmail-default-smtp-server . "mail.gmx.com")
                       (smtpmail-smtp-server         . "mail.gmx.com")
                       (smtpmail-smtp-service        . 587)
                       (mail-reply-to                . "jonathan.schaeffer@gmx.fr")
                       (user-mail-address            . "jonathan.schaeffer@gmx.fr")
                       (user-full-name               . "Jonathan Schaeffer")
                       (mu4e-compose-signature       . t)
                       (mu4e-sent-folder             . "/Sent")
                       (mu4e-drafts-folder           . "/Brouillons")
                       (mu4e-trash-folder            . "/gmx/Trash")
                       (mu4e-refile-folder           . "/gmx/Archives"))
             )))
    )
  :init
  (use-package org-mu4e
    :config
    (setq org-mu4e-link-query-in-headers-mode nil)
    )
  ;; Display desktop notifications
  (use-package mu4e-alert
    :config
    (progn
      (mu4e-alert-set-default-style 'libnotify)
      (mu4e-alert-enable-mode-line-display)
      (mu4e-alert-enable-notifications)
      (setq mu4e-alert-interesting-mail-query
          (concat
           "maildir:\"/uga/INBOX\""
           " AND flag:unread")))
    :ensure t)
   )
