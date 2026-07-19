(use-package kotlin-mode
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

(setq magit-display-buffer-function
      #'magit-display-buffer-same-window-except-diff-v1)

(use-package treemacs
  :ensure t
  :bind ("C-x t t" . treemacs)
  :config
  (treemacs-follow-mode t))

(use-package dumb-jump
  :ensure t
  :hook (prog-mode . dumb-jump-mode)
  :init
  (setq dumb-jump-prefer-searcher 'rg)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package consult
  :ensure t)

(global-set-key (kbd "C-S-f") 'consult-ripgrep)

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless basic)))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(global-set-key (kbd "C-c f") #'consult-find)

(provide 'ide-like-setup)
