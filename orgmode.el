;;;;;;;;;;;;;;;;;;;
;; Config OrgMode
;;;;;;;;;;;;;;;;;;;
;; Pour que ces raccourcis soient dispos partout :
(require 'org-install)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(require 'org-protocol)
(require 'ox-org)
(use-package org
  :bind ("C-c c" . org-capture)
  :ensure t
  :mode (("\\.org$" . org-mode))
  :ensure org
  :requires ox-org
  :config
  ; (add-hook 'org-mode-hook 'flyspell-mode)
  ; cosmétique
  (setq
   org-fontify-whole-heading-line t
   org-fontify-done-headline t
   org-fontify-quote-and-verse-blocks t
   org-ellipsis " …"
  ;; Other settings
   org-log-done t
   org-enforce-todo-dependencies t
   org-directory "~/org"
   org-agenda-files '("~/org/ecoinfo" "~/org/osug" "~/org/sist" "~/org/resif" "~/org/perso" "~/org/tickler.org" "~/org/inbox.org" "org/agendas.org")
   org-agenda-strategy '(tag-up)
   org-default-notes-file (concat org-directory "inbox.org")
   org-capture-templates
   (quote (("t" "Todo" entry (file+headline "~/org/inbox.org" "Inbox")
            "* TODO %i%?\n%a\n")
           ("T" "Tickler" entry (file+headline "~/org/tickler.org" "Tickler")
            "* TODO %i%? \n %U\n%a\n")
           ))
   org-file-apps
   (quote
    ((auto-mode . emacs) ;; Tout ce qu'Emacs sait ouvrir, mais :
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . "firefox %s")
     ("\\.pdf\\'" . "evince %s")
     ("\\.odt\\'" . "libreoffice %s")))
   ;; allow refiling into up to 5 levels of the headline trees in all org files
   ;; Refile
   
   ;; Targets start with the file name - allows creating level 1 tasks
   ;;  (setq org-refile-use-outline-path (quote file))
   ;; Targets complete in steps so we start with filename
   ;; TAB shows the next level of targets etc
   ;; (setq org-outline-path-complete-in-steps t)
   org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5)))

   ;; Calendrier Français - configuration emacs a priori
   european-calendar-style 't
   calendar-week-start-day 1
   calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi"]
   calendar-day-header-array ["Di" "Lu" "Ma" "Me" "Je" "Ve" "Sa"]
   calendar-day-abbrev-array ["Di" "Lu" "Ma" "Me" "Je" "Ve" "Sa"]
   calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai" "Juin" "Juillet"
                              "Août" "Septembre" "Octobre" "Novembre" "Décembre"]

   org-tag-alist '(
                   ("PROJECT". ?p)
                   ;; Ce groupe défini les contextes au sens GTD.
                   (:startgroup . nil) ;; Quelle activité ?
                   ("@organisation" . ?o) ("@asr" . ?a) ("@dev" . ?d) ("@veille" . ?v)
                   ("@courriel" . ?c) ("@rédaction" . ?r) ("@téléphone" . ?t)
                   (:endgroup . nil)
                   (:startgroup . nil) ;; Quelle catégorie ?
                   ("RESIF" . ?R) ("ECOINFO" . ?E) ("OSUGDC" . ?O)
                   ("PERSO" . ?P) ("SIST" . ?S)
                   (:endgroup . nil)
                   )
   org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
   org-agenda-custom-commands '(("R" "Revue journalière par contexte"
                                 ((tags-todo "@asr"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Activités ASR")))
                                  (tags-todo "@organisation"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Activités d'organisation")))
                                  (tags-todo "@courriel"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Envoyer des courriels")))
                                  (tags-todo "@téléphone"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Téléphoner")))
                                  (tags-todo "@rédaction"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Rédiger")))
                                  (tags-todo "@dev"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Développer")))
                                  (tags-todo "@veille"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Faire de la veille")))
                                  (tags-todo "-@veille-@dev-@organisation-@asr-@courriel-@rédaction-@téléphone"
                                             ((org-agenda-skip-function
                                               (function my-org-agenda-skip-all-siblings-but-first))
                                              (org-agenda-overriding-header "Non classées"))))
                                 nil)
                                ("P" "Par projet"
                                 ((tags "+RESIF+PROJECT-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets RESIF en cours")))
                                  (tags "+OSUGDC+PROJECT-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets OSUGDC en cours")))
                                  (tags "+ECOINFO+PROJECT-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets EcoInfo en cours")))
                                  (tags "+SIST+PROJECT-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets SIST en cours")))
                                  (tags "+PERSO+PROJECT-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets perso en cours")))
                                  (tags "+PROJECT-ECOINFO-SIST-PERSO-RESIF-OSUGDC-TODO=\"DONE\"-TODO=\"CANCELLED\""
                                        ((org-agenda-overriding-header "Projets non classés")))
                                  (stuck ""
                                         ((org-agenda-overriding-header "Projets coincés"))))
                                 nil)

                                )
   org-latex-listings 'minted
   org-latex-pdf-process '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -shell-escape -interaction nonstopmode -output-directory %o %f")
   org-refile-targets '((org-agenda-files :tag . "PROJECT")
                        ("~/org/someday.org" :maxlevel . 2)
                        ("~/org/tickler.org" :maxlevel . 1))
   org-structure-template-alist '(("Q" "#+BEGIN_QUESTION
?
#+END_QUESTION")
                                  ("s" "#+BEGIN_SRC ?

#+END_SRC")
                                  ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
                                  ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
                                  ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
                                  ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
                                  ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
                                  ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
                                  ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
                                  ("L" "#+LaTeX: ")
                                  ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
                                  ("H" "#+HTML: ")
                                  ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
                                  ("A" "#+ASCII: ")
                                  ("i" "#+INDEX: ?")
                                  ("I" "#+INCLUDE: %file ?"))
   org-stuck-projects '("+PROJECT/-DONE-CANCELLED" ("WAITING" "TODO")  nil "")
   org-tags-exclude-from-inheritance '("PROJECT")
   
   org-agenda-dim-blocked-tasks 'invisible
  ;; Config de org-reveal 
   ;;   org-reveal-root "file:///home/schaeffj/.emacs.d/reveal.js"
   )

  (load-library "find-lisp")
  (load-library "ox-wk")

  )

;; set sizes here to stop spacemacs theme resizing these
(set-face-attribute 'org-level-1 nil :height 1.0)
(set-face-attribute 'org-level-2 nil :height 1.0)
(set-face-attribute 'org-level-3 nil :height 1.0)
(set-face-attribute 'org-scheduled-today nil :height 1.0)
(set-face-attribute 'org-agenda-date-today nil :height 1.1)
(set-face-attribute 'org-table nil :foreground "#008787")

;; Pour l'entrée rapide de l'horodatage via org-mode
(defvar parse-time-weekdays-longer
  '(("dim" . 0) ("lun" . 1) ("mar" . 2) ("mer" . 3) ("jeu" . 4) ("ven" . 5) ("sam" . 7)))

(eval-after-load 'parse-time
  '(progn
    (setq parse-time-weekdays (nconc parse-time-weekdays
                                     parse-time-weekdays-longer))))
;; Fin de config du calendrier français


;; Colonnes par défaut
'(org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
;; Efforts
'(org-global-properties
   (quote
    (("Effort_ALL" . "0 0:15 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00"))))

;; Chopper les prochaines actions seulement
(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
		  
(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   ; (shell . t)
   )) ; this line activates ditaa, and shell

(require 'ox-wk)
(add-to-list 'org-export-backends 'markdown)

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("jres" "\\documentclass{jres}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; Corriger les \emp qui apparaissent dans les tableaux de temps :
;; http://emacs.stackexchange.com/questions/9528/is-it-possible-to-remove-emsp-from-clock-report-but-preserve-indentation

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "^"))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "--")))
      (concat str "-> "))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

(setq org-time-clocksum-use-effort-durations t)
;; Format des durées en hh:mm et non en jours
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))

