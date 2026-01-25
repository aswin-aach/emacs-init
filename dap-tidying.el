(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))
(recentf-mode 1)            
(setq recentf-max-saved-items 50)
(setq user-cache-directory "~/.emacs.d/cache")
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))

(provide 'dap-tidying)
