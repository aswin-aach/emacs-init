(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode)
(setq inhibit-startup-screen t)

;; Floor size for freshly-created frames. Doesn't override geometry that
;; activities-resume/burly explicitly restores on the initial frame — see
;; lisp/activities-setup.el if a resumed activity still opens tiny.
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 45))
;; Automatically add ending brackets and braces
(electric-pair-mode 1)

;; Make sure tab-width is 4 and not 8
(setq-default tab-width 4)

;; Undo/redo window layout changes: C-c <left>, C-c <right> for undo and redo
(winner-mode 1)

;; Highlight matching brackets and braces
(show-paren-mode 1)

(provide 'basic-convenience)
