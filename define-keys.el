(message "This defines customized keys")

(global-set-key (kbd "C-c C-s") 'copy-to-register)
(global-set-key (kbd "C-c h") 'insert-register)
(global-set-key (kbd "C-c C-g") 'gtd)
(global-set-key (kbd "C-c C-j") 'journal)
(global-set-key (kbd "C-c C-r") 'prayer)
(global-set-key (kbd "C-c C-d i") 'prelude-insert-date)
(global-set-key (kbd "C-c C-d b") 'byte-compile)
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)


(provide 'define-keys)
