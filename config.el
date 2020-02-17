;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Evil settings
(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jj")

(after! evil-surround
  (let ((pairs '((?g "'" . "'")
                 (?h "(" . ")")
                 (?j "[" . "]")
                 (?k "{" . "}")
                 (?l "<" . ">")
                 (?ø "$" . "$")
                 (?æ "\"" . "\""))))
    (prependq! evil-surround-pairs-alist pairs)
    (prependq! evil-embrace-evil-surround-keys (mapcar #'car pairs))))


(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)
(define-key smartparens-mode-map (kbd "C-f") 'sp-end-of-sexp)

;; Global Settings such as Word Wrap and Revert Mode
(global-auto-revert-mode t)
(global-visual-line-mode t)
(global-hl-todo-mode 1)


;; org-mode settings
(setq org-agenda-prefix-format '(
                                 ;; (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
                                 (agenda  . "  • ")
                                 (timeline  . "  % s")
                                 (todo  . " %i %-12:c")
                                 (tags  . " %i %-12:c")
                                 (search . " %i %-12:c")))
;; lsp settings
(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :hook ((python-mode . lsp)
         (elixir-mode . lsp))
  :init
  (add-to-list 'exec-path "/Users/patrick.hildreth/elixir-ls/release"))

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-enable t
        lsp-ui-doc-use-webkit t
        lsp-ui-doc-enable t
        lsp-ui-doc-delay 0.5
        lsp-ui-doc-max-height 50
        lsp-ui-doc-position 'bottom
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-enable t
        lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-ui-doc-frame-hook
          (lambda (frame _w)
            (set-face-attribute 'default frame :font "Hack" :height 150))))


(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

;; Python Specific Settings
;; Setting Treemacs ignore to respect .gitignore
(with-eval-after-load 'treemacs
  (defun treemacs-ignore-gitignore (file _)
    (string= file ".gitignore"))
  (push #'treemacs-ignore-gitignore treemacs-ignored-file-predicates))

(defun toggle-eshell ()
    (interactive)
    (cond ((get-buffer " *eshell*")
           (interactive)
           (switch-to-buffer " *eshell*")
           (rename-buffer "*eshell*")
           )
          ((get-buffer "*eshell*")
           (interactive)
           (switch-to-buffer "*eshell*")
           (rename-buffer " *eshell*")
           (switch-to-buffer (other-buffer (current-buffer) 1))
           )
          (t (eshell))
          )
    )
;; doom specific settings
(setq doom-font (font-spec :family "fira code" :size 18)
      +doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
      doom-themes-treemacs-theme "doom-colors"
      doom-modeline-height 10
      doom-modeline-bar-width 3
      doom-theme 'doom-opera
      ;;doom-theme 'doom-one-light
      doom-modeline-major-mode-icon t
      ;;python-shell-interpreter "/usr/local/bin/python3"
      doom-modeline-buffer-file-name-style 'file-name
      treemacs-width 25
      ranger-override-dired-mode t
      )


;; Start Emacs in distraction free mode (fullscreen)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(doom-themes-treemacs-config)
