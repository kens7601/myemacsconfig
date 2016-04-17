;;; Code
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

(defun bbdb-prune-not-to-me ()
  "defun called when bbdb is trying to automatically create a record.  Filters out
anything not actually adressed to me then passes control to 'bbdb-ignore-some-messages-hook'.
Also filters out anything that is precedense 'junk' or 'bulk'  This code is from
Ronan Waide < waider @ waider . ie >."
  (let ((case-fold-search t)
        (done nil)
        (b (current-buffer))
        (marker (bbdb-header-start))
        field regexp fieldval)
    (set-buffer (marker-buffer marker))
    (save-excursion
      ;; Hey ho. The buffer we're in is the mail file, narrowed to the
      ;; current message.
      (let (to cc precedence)
        (goto-char marker)
        (setq to (bbdb-extract-field-value "To"))
        (goto-char marker)
        (setq cc (bbdb-extract-field-value "Cc"))
        (goto-char marker)
        (setq precedence (bbdb-extract-field-value "Precedence"))
        ;; Here's where you put your email information.
        ;; Basically, you just add all the regexps you want for
        ;; both the 'to' field and the 'cc' field.
        (if (and (not (string-match "kensubuntu@" (or to "")))
                 (not (string-match "kensubuntu@" (or cc ""))))
            (progn
              (message "BBDB unfiling; message to: %s cc: %s"
                       (or to "noone") (or cc "noone"))
              ;; Return nil so that the record isn't added.
              nil)

          (if (string-match "junk" (or precedence ""))
              (progn
                (message "precedence set to junk, bbdb ignoring.")
                nil)

            ;; Otherwise add, subject to filtering
            (bbdb-ignore-some-messages-hook)))))))
