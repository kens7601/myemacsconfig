;;; Code

;;; (add-to-list 'mm-attachment-override-types "image/.*")
(require 'bbdb-loaddefs "/usr/local/share/emacs/site-lisp/bbdb-loaddefs.el")

(require 'bbdb)
;;; (require 'bbdb-gnus)
(require 'bbdb-message)

(load "bbdb-com" t)

(gnus-delay-initialize)

(bbdb-initialize 'gnus 'message 'sc)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(bbdb-insinuate-message)
(bbdb-insinuate-sc)
(setq sc-preferred-attribution-list
  '("sc-lastchoice" "x-attribution" "sc-consult"
    "initials" "firstname" "lastname"))
(setq bbdb/mail-auto-create-p t)
(setq bbdb/news-auto-create-p t)
(setq bbdb-always-add-addresses t)

(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-update-records-p 'create)

(setq bbdb-use-pop-up t)
(setq bbdb-send-mail-style 'gnus)
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)
(setq
     bbdb-offer-save 1
     bbdb-use-pop-up t
     bbdb-electric-p t
     bbdb-popup-target-lines  1
)
(setq sc-mail-glom-frame
      '((begin                        (setq sc-mail-headers-start (point)))
        ("^x-attribution:[ \t]+.*$"   (sc-mail-fetch-field t) nil t)
        ("^\\S +:.*$"                 (sc-mail-fetch-field) nil t)
        ("^$"                         (progn (bbdb/sc-default)
                                             (list 'abort '(step . 0))))
        ("^[ \t]+"                    (sc-mail-append-field))
        (sc-mail-warn-if-non-rfc822-p (sc-mail-error-in-mail-field))
        (end                          (setq sc-mail-headers-end (point)))))

(setq mm-discouraged-alternatives '("text/html" "text/richtext"))
(setq mm-automatic-display
      '("text/plain" "text/enriched" "text/richtext"
        "image/.*" "message/delivery-status" "multipart/.*" "message/rfc822"
        "text/x-patch" "application/pgp-signature" "application/emacs-lisp"))

(setq org-agenda-include-diary t)

(setq calendar-mark-diary-entries-flag t)
(setq diary-number-of-entries 7)

(setq display-time-day-and-date t)
(setq flyspell-abbrev-p t)
(setq flyspell-use-global-abbrev-table-p t)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

(defun kws:ibuffer-mode-func ()
  "Function for 'ibuffer-mode-hook' ."
  (ibuffer-switch-to-saved-filter-groups "default"))

(setq-default
 ibuffer-saved-filter-groups
 '("default"
   ("emacs" (or (filename . "emacs\\.d")
                (mode . emacs-lisp-mode)))
   ("work" (filename . "aethon"))
   ("jabber" (name . "^\\*jabber-"))
   ("org" (filename . ".\\.org$"))
   ("magit" (name . "^\\*magit-.*\\*$"))
   ("scratch" name . "^\\*.*\\*$")))

(add-hook 'ibuffer-mode-hook 'kws:ibuffer-mode-func)

(global-ede-mode t)

(provide 'init)
;;;
