;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Evil settings
(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jj")


(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

;; Global Settings such as Word Wrap and Revert Mode
(global-auto-revert-mode t)
(global-visual-line-mode t)

;; lsp settings
(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :hook ((python-mode . lsp)
         (elixir-mode . lsp))
  :init
  (add-to-list 'exec-path "/Users/patrick.hildreth/elixir-ls/release")
  (setq lsp-ui-doc-enable nil))

;; DOOM specific settings
(setq doom-font (font-spec :family "Fira Code" :size 18)
      +doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
      doom-themes-treemacs-theme "doom-colors"
      doom-modeline-height 10
      doom-modeline-bar-width 3
      doom-modeline-major-mode-icon t
      python-shell-interpreter "/usr/local/bin/python3"
      doom-modeline-buffer-file-name-style 'file-name
      treemacs-width 25)



;; Start Emacs in distraction free mode (fullscreen)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(doom-themes-treemacs-config)
