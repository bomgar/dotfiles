(require-package 'evil)

(setq evil-want-C-i-jump nil) ; org mode tab fix
(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(require 'evil)
(evil-mode 1)

(require-package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

(require-package 'evil-numbers)
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-s") 'evil-numbers/dec-at-pt)

(require-package 'evil-matchit)
(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require-package 'evil-visualstar)
(require 'evil-visualstar)
(global-evil-visualstar-mode t)

(require-package 'evil-magit)
(require 'evil-magit)


(provide 'init-evil)

