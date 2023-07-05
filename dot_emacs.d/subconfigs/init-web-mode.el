(use-package web-mode
  :ensure t
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))
          (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
:config (progn
          (setq web-mode-markup-indent-offset 2)
          (setq web-mode-css-indent-offset 2)
          (setq web-mode-code-indent-offset 2)
          (setq web-mode-enable-auto-quoting nil)
          (custom-set-faces
           '(web-mode-jsx-depth-1-face ((t ())))
           '(web-mode-jsx-depth-2-face ((t ())))
           '(web-mode-jsx-depth-3-face ((t ())))
           '(web-mode-jsx-depth-4-face ((t ())))
           '(web-mode-jsx-depth-5-face ((t ())))))
(provide 'init-web-mode)
