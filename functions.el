;; Package -- Summary

;; Commentary

;; Code

(message "These are my function definitions")

(defun gtd ()
  "open the getting things done file"
  (interactive)
  (find-file "~/.org/gtd.org")
  )

(defun journal()
  "Open the journal file  for that day"
  (interactive)
  (setq d (shell-command-to-string "date +%m%d%Y"))
  (setq d (substring d 0 8))
  (setq d (concat d ".txt"))
  (setq d (concat "~/journal/" d))
  (find-file d)
  )

(defun prayer ()
  "Same as journal, but only for prayers"
  (interactive)
  (setq x (shell-command-to-string "date +%m%d%Y"))
  (setq x (substring x 0 8))
  (setq x (concat x ".txt"))
  (setq x (concat "~/prayers/" x))
  (find-file x))

(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "p")
  (if n
      (other-window (- n))
    (other-window -1)))


(defun insert-current-time ()
  "Insert the current time"
  (interactive "*")
  (insert (current-time-string)))


(defun insert-time ()
  "Insert the current time according to insert-time-format."
  (interactive "*")
  (insert (format-time-string insert-time-format (current-time))))

(defun insert-date ()
  "insert the current date according to insert-date-format"
  (interactive "*")
  (insert (format-time-string insert-date-format (current-time))))



(provide 'functions)
