

; ~/.emacs.d/my-package-repos.el

(require 'cl)
(require 'package)

;;; Code:

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)



(defvar required-packages
  '(
    ;; android-mode
    ;; arduino-mode
    ac-math
    auctex
    auctex-latexmk
    auto-complete ;; using this instead of company-mode. for the moment anyway.
    auto-complete-auctex
    ac-ispell
    ac-python
    awk-it
    color-theme
    color-theme-sanityinc-tomorrow
    ;; company
    dash
    dash-at-point
    f
    ;; faces
    flycheck
    flycheck-tip
    guide-key
    ;; haxe-mode
    helm
    helm-bibtex
    helm-bibtexkey
    ;; helm-c-yasnippet
    ;; helm-company
    helm-flycheck
    helm-flymake
    ido
    ido-ubiquitous
    ido-hacks
    json-mode
    magit
    markdown-mode+
    ;; org-ac
    ;; org-gcal
    php-mode
    ;; php-auto-yasnip
    php-extras
    php-completion
    projectile
    popup
    pos-tip
    powerline
    reftex
    ;; processing-mode
    ;; processing-snippets
    session
    shell-command
    shell-history
    smex
    smooth-scrolling
    sr-speedbar
    ;; spotify
    sublimity
    visual-regexp
    web-mode
    window+
    workgroups
    yasnippet
    ;; yasnippet-bundle
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
