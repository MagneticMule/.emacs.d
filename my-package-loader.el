;;; Commentary:
;; Much of this file has been taken from
;; https://github.com/toumorokoshi/emacs-from-scratch/blob/master/.emacs.d/my-packages.el
;; for more info have a look at the associated tutorial at
;; http://toumorokoshi.github.io/emacs-from-scratch-part-1-extending-emacs-basics.html

; ~/emacs.d/my-package-loader.el
;;; Code:
(load "~/.emacs.d/my-package-repos.el")

(load "auctex.el" nil t t)

;;well this is simply not working old chap.
;;(load "preview-latex.el" nil t t)

;; Inline auto completion and suggestions
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)

(setq ac-math-unicode-in-math-p t)


   ;; Completion words longer than 4 characters
   (custom-set-variables
     '(ac-ispell-requires 4)
     '(ac-ispell-fuzzy-limit 4))

   (eval-after-load "auto-complete"
     '(progn
         (ac-ispell-setup)))

   (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
   (add-hook 'mail-mode-hook 'ac-ispell-ac-setupa)


(require 'magit)


(require 'ido)
(setq ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-everywhere t)
(ido-mode t)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; make buffer names unique even if the files have the same names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; allow switching between buffers by typing substring of buffer name
;; (there are other alternatives, but iswitchb comes with std emacs)
;; sadly now depreciated as of 24.4
;; (iswitchb-mode 1)

(add-hook 'after-init-hook #'global-flycheck-mode)

(put 'ido-complete 'disabled nil)
(put 'ido-exit-minibuffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'autopair-newline 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)

(require 'yasnippet)
 (yas-global-mode 1)


(require 'powerline)
(powerline-center-theme)

(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)
(autoload 'helm-bibtex "helm-bibtex" "" t)
(setq helm-bibtex-bibliography "/home/tommy/Dropbox/PhD/Thesis/library.bib")


;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)



(require 'helm-flycheck)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))


;; (setq reftex-plug-into-AUCTeX t)

;; slightly pimped version of speeedbar. appears on the left side
(require 'sr-speedbar)

(setq speedbar-frame-parameters
      '((minibuffer)
	(width . 40)
	(border-width . 0)
	(menu-bar-lines . 0)
	(tool-bar-lines . 0)
	(unsplittable . t)
	(left-fringe . 0)))
(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 70)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode


;; control those nasty intrusive help windows and the like
(require 'popwin)
(popwin-mode 1)

;; enable projectile everywhere
(projectile-global-mode)
