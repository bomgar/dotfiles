;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require-package 'helm)
(require-package 'projectile)
(require-package 'helm-projectile)

(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(setq projectile-completion-system 'helm)
(setq projectile-require-project-root nil)

(global-set-key (kbd "M-x") 'helm-M-x)

(helm-mode 1)

(projectile-global-mode)
(helm-projectile-on)

(provide 'init-helm)
