;;; Commentary:
;; Some of this file has been adapted from
;; https://github.com/toumorokoshi/emacs-from-scratch/blob/master/.emacs.d/my-packages.el
;; for more info have a look at the associated tutorial at
;; http://toumorokoshi.github.io/emacs-from-scratch-part-1-extending-emacs-basics.html

; ~/emacs.d/my-package-loader.el
;;; Code:
(load "~/.emacs.d/my-package-repos.el")

(load "auctex.el" nil t t)

    (when (memq window-system '(mac ns))
            (exec-path-from-shell-initialize))

;; ;;well this is simply not working old chap.
;; ;;(load "preview-latex.el" nil t t)

;; moving back to company mode from auto-complete-mode
;; (add-hook 'after-init-hook 'global-company-mode)
;; (require 'company)                                   ; load company mode
;; (require 'company-web-html)                          ; load company mode html backend
;; ;; and/or
;; (require 'company-web-jade)                          ; load company mode jade backend
;; (require 'company-web-slim)                          ; load company mode slim backend


;;(setq company-tooltip-limit 20)                      ; bigger popup window
;;(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
;;(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;;(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;;(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key

;; you may key bind, for example for web-mode:
;; (define-key web-mode-map (kbd "C-'") 'company-web-html)

;; add company-tern to company-mode accepted back ends
;;(add-to-list 'company-backends 'company-tern)

;; Inline auto completion and suggestions
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; (require 'ac-math)
;; (add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

;; defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
;; (setq ac-sources
;; (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
;; ac-sources))
;; )
;; (add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
;; (global-auto-complete-mode t)

;; (setq ac-math-unicode-in-math-p t)


;; Completion words longer than 4 characters
;; (custom-set-variables
;; '(ac-ispell-requires 4)
;; '(ac-ispell-fuzzy-limit 4))
;; (eval-after-load "auto-complete"
;; '(progn
;; (ac-ispell-setup)))

;; (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'mail-mode-hook 'ac-ispell-ac-setupa)



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

;; ;; allow switching between buffers by typing substring of buffer name
;; ;; (there are other alternatives, but iswitchb comes with std emacs)
;; ;; sadly now depreciated as of 24.4
;; ;; (iswitchb-mode 1)

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
(workgroups-mode t)

(require 'yasnippet)
;; (yas-global-mode 1)


;;; sRGB doesn't blend with Powerline's pixmap colors, but is only
;;; used in OS X. Disable sRGB before setting up Powerline.
(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

;; then just init powerline with the
(require 'powerline)
(powerline-center-evil-theme)

(require 'helm)
(require 'helm-config)

;; (require 'helm-files)
;;(require 'helm-grep)
;; (autoload 'helm-bibtex "helm-bibtex" "" t)
;; (setq helm-bibtex-bibliography "/home/tommy/Dropbox/PhD/Thesis/library.bib")


;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

;;( define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
;; (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
;; (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
(setq helm-google-suggest-use-curl-p t))

 (setq helm-quick-update                     t ; do not display invisible candidates
       helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
       helm-ff-file-name-history-use-recentf t)

;; (helm-mode 1)



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
(setq speedbar-use-images t)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 70)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ;; Enable guide-key-mode


;; control those nasty intrusive help windows and the like
(require 'popwin)
(popwin-mode 1)

;; enable projectile everywhere
(projectile-global-mode)



;; js2 mode
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; set up ternjs
;; note: we need to set the path for each machine

;; (add-to-list 'load-path "/home/tommy/repositories/tern/emacs/")
;; (add-to-list 'load-path "/users/tommy/repositories/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
'(progn
	(require 'tern-auto-complete)
	(tern-ac-setup)))


;; ;; paraedit brace balancing for JS
;; (define-key js-mode-map "{" 'paredit-open-curly)
;; (define-key js-mode-map "}" 'paredit-close-curly-and-newline)

;; enable flycheck on JS files
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
	        (append flycheck-disabled-checkers
			    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
	        (append flycheck-disabled-checkers
			    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

;; smart-parens bracket matching
(smartparens-global-mode 1)

;; evil mode
(require 'evil)  (add-hook 'ecb-history-buffer-after-create-hook 'evil-emacs-state)
  (add-hook 'ecb-directories-buffer-after-create-hook 'evil-emacs-state)
  (add-hook 'ecb-methods-buffer-after-create-hook 'evil-emacs-state)
  (add-hook 'ecb-sources-buffer-after-create-hook 'evil-emacs-state)
(evil-mode 1)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(define-key evil-motion-state-map (kbd "RET") nil)

;; emmet mode
(require 'emmet-mode)
(emmet-mode 1)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; some attaempts to help ecb and evil play nice
(add-hook 'ecb-history-buffer-after-create-hook 'evil-emacs-state)
(add-hook 'ecb-directories-buffer-after-create-hook 'evil-emacs-state)
(add-hook 'ecb-methods-buffer-after-create-hook 'evil-emacs-state)
(add-hook 'ecb-sources-buffer-after-create-hook 'evil-emacs-state)

(require 'ag)
  (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t)

(provide 'my-package-loader)


;;; my-package-loader ends here
