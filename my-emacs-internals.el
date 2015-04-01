;~/.emacs.d/my-emacs-internals.el
;;; Code:
;;; (setq-default left-margin-width 2 right-margin-width 2) ; Define new widths.
;;; (set-window-buffer nil (current-buffer)) ; Use them now.

;; proper word wrap
(global-visual-line-mode t)

;; save sessions
(desktop-save-mode 1)

;; remove scrollbars
;;; (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; remove tool bar
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; get rid of that annying bell sound
(setq ring-bell-function 'ignore)

;; no splash screen
(setq inhibit-startup-message t)

;; use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; don't make those silly tilde based backups
(setq make-backup-files nil)

; Lines shouldn't be longer than 79 chars
(setq fill-column 79)

;; enable word wrap
(setq-default visual-line-mode 1)

;; make pretty
(global-font-lock-mode 1)

;; shows current selected region
(setq-default transient-mark-mode t)

;; indent via spaces not tabs
(setq-default indent-tabs-mode nil)

;; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; show paired parenthasis
(show-paren-mode 1)

;; TAB => 4*'\b'
(setq tab-width 4)

;; line numbers
(global-linum-mode 1)
(setq column-number-mode t)
(setq linum-format "%4d ")

;; increase the left-hand padding of the main window
(setq-default left-fringe-width  10)
(setq-default right-fringe-width  1)
(set-face-attribute 'fringe nil)

;; get rid of yes-or-no questions - y or n is enough
(fset 'yes-or-no-p 'y-or-n-p)

;;;(setq
;;; backup-by-copying t
;;; backup-directory-alist(server-start)
;;; (add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
;;;


 ;; clean up whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; my-emacs-internals.el ends here
