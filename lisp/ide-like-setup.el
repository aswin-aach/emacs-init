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

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

;; Bridges treemacs' workspace/project list with projectile's root-detection,
;; so file/text search scopes to whatever project is open in the treemacs
;; sidebar rather than projectile's own independent notion of "project."
(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile)
  :bind ("C-x t p" . treemacs-projectile-toggle))

(use-package dumb-jump
  :ensure t
  :hook (prog-mode . dumb-jump-mode)
  :init
  (setq dumb-jump-prefer-searcher 'rg)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package consult
  :ensure t
  :config
  ;; Root project-scoped search on projectile (synced from treemacs via
  ;; treemacs-projectile) instead of consult's default project.el detection.
  (setq consult-project-function
        (lambda (_) (projectile-project-root))))

;; IntelliJ-style project search: C-c s f = find file, C-c s s = search text.
(global-set-key (kbd "C-c s f") #'projectile-find-file)
(global-set-key (kbd "C-c s s") #'consult-ripgrep)
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

;; IntelliJ-style back/forward, riding on xref's own history stack
;; (M-, / C-M-, already do this for definition-jumps). find-file is the
;; common path for projectile-find-file, consult-ripgrep's result action,
;; and my/dired-open-in-right-window, so advising it alone covers all four.
(defun my/xref-push-before-find-file (&rest _)
  (xref-push-marker-stack))
(advice-add 'find-file :before #'my/xref-push-before-find-file)

(provide 'ide-like-setup)
