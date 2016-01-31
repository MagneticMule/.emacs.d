

; ~/.emacs.d/my-package-repos.el

(require 'cl)
(require 'package)

;;; Code:

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)
(message "Packages Initialized")


(defvar required-packages
  '(
    ag
    ;; arduino-mode
    ;; company
    ;; faces
    ecb
    haxe-mode
    ;; helm-c-yasnippet
    ;; helm-company
    org-ac
    ;; org-gcal
    ;; php-auto-yasnip
    ;; processing-mode
    ;; processing-snippets
    ;; spotify
    ac-emmet
    ac-ispell
    ac-js2
    ;; ac-math
    ac-python
    auctex
    auctex-latexmk
    ;; auto-complete ;; using this instead of company-mode. for the moment anyway.
    ;; auto-complete-auctex
    awk-it
    color-theme
    color-theme-sanityinc-tomorrow
    company
    company-web
    dash
    dash-at-point
    emmet-mode
    evil
    evil-leader
    f
    flycheck
    flycheck-tip
    ;; flymake-jshint
    ;; flymake-jslint
    guide-key
    helm
    helm-bibtex
    helm-bibtexkey
    helm-flycheck
    helm-flymake
    ido
    ido-hacks
    ido-ubiquitous
    js2-mode
    js2-refactor
    json-mode
    ;; magit
    markdown-mode+
    material-theme
    multiple-cursors
    php-completion
    php-extras
    php-mode
    popup
    pos-tip
    powerline
    projectile
    reftex
    session
    shell-command
    shell-history
    smex
    smooth-scrolling
    sr-speedbar
    ;; sublimity
    term+
    tern
    tern-auto-complete
    visual-regexp
    ;;web-beautify
    web-mode
    window+
    workgroups
    yasnippet
    yasnippet-bundle
  ) "a list of packages to ensure are installed at launch.")

;; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;; my-package-repos ends here
