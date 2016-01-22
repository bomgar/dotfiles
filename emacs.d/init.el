
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Patrick Haun")
(setq user-mail-address "bomgar85@googlemail.com")

(menu-bar-mode -1)

(setq make-backup-files nil)
(set 'ad-redefinition-action 'accept)

(add-to-list 'load-path (expand-file-name "subconfigs" user-emacs-directory))
(require 'init-packages)
(require 'init-evil)
(require 'init-theme)


;; Set to auto read when a file is changed from the outside
(global-auto-revert-mode t)

;; splits movement
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)

;; save history
(setq savehist-additional-variables    ;; also save...
  '(search-ring regexp-search-ring)    ;; ... my search entries
  savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate

; Set 7 lines to the cursor - when moving vertically
(setq scroll-margin 7)

; display line numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;move between buffers
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)

;whitespace style
(setq whitespace-display-mappings
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))

; remember file position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;show mathing parens
(show-paren-mode t)

;tab settings
(setq-default tab-width 2 indent-tabs-mode nil)
