;;; package --- summary

;~/.emacs.d/init.el

;;(add-to-list 'load-path "~/.emacs.d/")


;;; Code
;; load package archive repos
(load "~/.emacs.d/my-package-loader.el")

;;(load "~/.emacs.d/my-mu4e-config.el")

;; ensure the internals file is loaded last
(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/my-emacs-internals.el")
			      ))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("c237299ad2385b4e59767eeb55a0a7e888ebbabec9975be9ae63eec2ff74668d" "356f57a98f35c8ead5a349408cab69f8d4d92baea131e9531611d0d82190fedf" "3b0f554ddd413e74b82854d78c7c22df6cb4298413f69b514b2884fa84d42f30" "3c69e9ee58ae15caeffff5464f0616933f6403af77ef9d5e01f0837b54bb80e0" "d5028886acdf1895ac1d91a98042a2c6385ea979e715aef07ffa08aa4f843fd0" "51867fa64534ff7ca87fdc1537fbfffc168fa4673e3980850436dc87e31ef426" "bb55fede752d2b7280219c1a8d2399aa1b35166ae4f1119583bbf4af0d9a26d4" "e33ddbd957dfe0a2e64732e4491adaf2a7508aa6ea2da193ac5a3feca3c7aeec" "1120c0ca59bdcf5ad5a7941672056b479234d2f6e1f9be11c86204df21d0cdb0" "249bb2cd384cc8c19ec255a4882ed4e96a201480df7f8d2e0ac171b01dc994df" "a6065e3d43700b986760a4ad108ed9156a57efd78e252d9c69ae71ba026d43e6" "1ad6925a2f6ea011f800d97091007383c10ee518c2390e176a965e1c35bfb7a8" "5d4ac3ecdba50acac7738e9718447c1f7aaa530e9100f84d966ee63d7d3cf760" "092c4b8fedd5b82fe906571b5e7a7e32730e22b04e1848a2b6fed1599fcbd410" "f33227ce9d0c6b7b3dab7f1ef963502ccc1e6c19bf94afb1f1cf3716402453ec" "de309af2ced9914b67077eecd0b89412dd9a60c5eb823e5c5ed66170bd4495a7" "ab8033276aa563bc7373f78aeefef69e1e25083266b44116341f0a8096657463" "12e2df0bb86ba5fed5e7dde86aac1a53e58d375500836c86d67b7728744413a6" "f08c2405a7e71e568b784ae0145a86e48e1b4ea8ba33d231a4ad21b52495de5e" "15bd21e2ca1741a213b6c2488437b44250e8049e6fbcd1ffbacda8cbde295dcb" "602d25a1dda761706a79a1705fe5af70ab69e91c75bda5d0449ac4e11d886374" "40b7687853f3d6921eba3afed50c532bbf4a66959554d32adf1899a675926b2d" "1a85c54c4e6b310d530a1b6e71fe658cc3b7aac62a12146062418b5dc7da126c" "a672468ee91c61540312300a9664dde1989ad03e28ca6ce20172591922ac4805" "eaf4cb94ad96e1659f9254db8efb799deb1885e97884f8f971ff1e6a4114500a" "9e7cc7f1db252d6fe0c7cc25d72d768712a97cda1f77bf63f0c1fd7be5dee7f4" "c35c0effa648fd320300f3d45696c640a92bdc7cf0429d002a96bda2b42ce966" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#515151")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
