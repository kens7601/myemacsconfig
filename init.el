;;; Commentary
;;; This is my init.el file

;;;Code

(message "This is my init file")

(require 'cl)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

(setq-default major-mode 'text-mode)
(setq-default fill-column 72)

(setq text-mode-hook 'auto-fill-mode)

(setq calendar-latitude 42.262593)
(setq calendar-longitude -71.802293)
(setq calendar-location-name "Worcester, MA")

;;;(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-use-git-grep 1)

;;;(helm-projectile-on)
(setq projectile-indexing-method 'alien)

(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

(setq load-prefer-newer t)
(package-initialize)
;;; (require 'auto-compile)
;;; (auto-compile-on-load-mode)
;;; (auto-compile-on-save-mode)

(appt-activate)

(provide 'init)
