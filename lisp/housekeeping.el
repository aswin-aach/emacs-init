(recentf-mode 1)
(setq recentf-max-saved-items 50)
(setq user-cache-directory "~/.emacs.d/cache")
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory)
      savehist-file (expand-file-name "history" user-cache-directory))

;; savehist must load before projectile so projectile's own
;; add-to-list on savehist-additional-variables isn't a free-variable ref.
(require 'savehist)
(savehist-mode 1)

(provide 'housekeeping)
