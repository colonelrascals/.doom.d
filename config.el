;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Evil settings
(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jj")

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
(setq doom-font (font-spec :family "Fira Code" :size 15)
      +doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
      doom-themes-treemacs-theme "doom-colors"
      treemacs-width 30)



;; Start Emacs in distraction free mode (fullscreen)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(doom-themes-treemacs-config)
