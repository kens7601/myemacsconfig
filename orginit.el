;;; package -- Summary

;;; Commentary

;;; Code
(message "this sets up org preferences")

(setq org-directory "~/.org")

(setq org-agenda-files (list "~/.org/gtd.org"))

(setq org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

(setq org-agenda-todo-list-sublevels nil)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)
(setq org-log-done t)
