(setq user-full-name "Patrick Haun")
(setq user-mail-address "bomgar85@googlemail.com")

(menu-bar-mode -1)

(setq make-backup-files nil)
(set 'ad-redefinition-action 'accept)

(add-to-list 'load-path (expand-file-name "subconfigs" user-emacs-directory))
(require 'init-packages)
(require 'init-evil)
(require 'init-theme)

