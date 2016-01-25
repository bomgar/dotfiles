
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Patrick Haun")
(setq user-mail-address "bomgar85@googlemail.com")

(menu-bar-mode -1)

(setq make-backup-files nil)

;; lockfiles are evil.
(setq create-lockfiles nil)

(set 'ad-redefinition-action 'accept)

(add-to-list 'load-path (expand-file-name "subconfigs" user-emacs-directory))
(require 'init-packages)
(require 'init-evil)
(require 'init-theme)
(require 'init-powerline)
(require 'init-json)
(require 'init-helm)
(require 'init-auto-complete)
(require 'init-magit)


;; Show me the new saved file if the contents change on disk when editing.
(global-auto-revert-mode 1)

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

;smoot scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

; display line numbers
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)
(global-linum-mode 1)
(setq linum-format "%4d\u2502")

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
(setq-default indent-tabs-mode nil)

;move in wraps
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; require a trailing newline
(setq require-final-newline t)

;; don't put intitial text in scratch buffer
(setq initial-scratch-message nil)


;; Disable toolbars and splash screens.
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; UTF-8 everything!
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; nevermind that's annoying
(setq ring-bell-function 'ignore)

;disable scrollbar
(scroll-bar-mode -1)
