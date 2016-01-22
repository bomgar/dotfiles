(require-package 'evil)

(setq evil-want-C-i-jump nil) ; org mode tab fix
(require 'evil)
(evil-mode 1)

(require-package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

(require-package 'evil-numbers)
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

(require-package 'evil-matchit)
(require 'evil-matchit)
(global-evil-matchit-mode 1)

(provide 'init-evil)

