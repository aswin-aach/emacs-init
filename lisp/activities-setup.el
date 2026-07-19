;; -------------------------------
;; Activities setup (workspace/session management)
;; -------------------------------
;; Replaces perspective.el. Buffer serialization is bookmark.el-based;
;; treemacs and magit both implement bookmark-make-record-function, so
;; those buffers restore natively without custom glue code.

;; C-c p n → new activity
;; C-c p r → resume an activity (C-g at the prompt = skip, plain scratch frame)
;; C-c p s → suspend (save + close) current activity
;; C-c p l → list activities
;; Hold C-c p to see this menu via which-key if you forget.

(use-package burly
  :ensure t)

(use-package activities
  :ensure t
  :init
  (activities-mode)
  (activities-tabs-mode)
  :bind
  (("C-c p n" . activities-new)
   ("C-c p r" . activities-resume)
   ("C-c p s" . activities-suspend)
   ("C-c p l" . activities-list)))

;; which-key: hold C-c p to see the n/r/s/l menu instead of relying on memory.
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-add-key-based-replacements "C-c p" "activities"))

;; Prompt to resume an activity on startup. On-demand restore (only the
;; chosen activity loads) instead of eagerly replaying every saved
;; perspective, which is what caused the old startup delay.
(add-hook 'emacs-startup-hook
          (lambda () (call-interactively #'activities-resume)))

(provide 'activities-setup)
