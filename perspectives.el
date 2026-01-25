;; (use-package perspective
;;   :ensure t
;;   :init
;;   (setq persp-mode-prefix-key (kbd "C-c p")
;;         persp-state-default-file "~/.emacs.d/persp-state") ;; file to save/load perspectives
;;   (persp-mode 1)
;;   :config
;;   ;; Save perspectives automatically on exit
;;   (add-hook 'kill-emacs-hook #'persp-state-save)
;;   ;; Load perspectives on startup if the file exists
;;   (when (file-exists-p persp-state-default-file)
;;     (ignore-errors (persp-state-load persp-state-default-file)))
;;   ;; Make buffer switching perspective-aware
;;   (global-set-key (kbd "C-x b") #'persp-switch-to-buffer*)
;;   (global-set-key (kbd "C-x k") #'persp-kill-buffer*))

;; C-c p s → save current perspective

;; C-c p l → load a perspective

;; C-c p k → remove a buffer from the perspective

;; C-c p n → create a new perspective

;; C-x b → switch buffer within the current perspective

;; C-x k → kill buffer within the current perspective


;; -------------------------------
;; Perspective Setup
;; -------------------------------
(use-package perspective
  :ensure t
  :init
  ;; Key prefix for perspective commands
  (setq persp-mode-prefix-key (kbd "C-c p")
        persp-state-default-file "~/.emacs.d/persp-state") ;; file to save/load perspectives
  :config
  ;; Enable perspective mode
  (persp-mode 1)

  ;; Save perspectives automatically on exit
  (add-hook 'kill-emacs-hook #'persp-state-save)

  ;; Load perspectives on startup if the file exists
  (when (file-exists-p persp-state-default-file)
    (ignore-errors (persp-state-load persp-state-default-file)))

  ;; Make buffer switching perspective-aware
  (define-key global-map (kbd "C-x b") #'persp-switch-to-buffer)
  (define-key global-map (kbd "C-x k") #'persp-kill-buffer))

;; -------------------------------
;; Simple Perspective Creator
;; -------------------------------
(defun my-persp-choose-simple ()
  "Switch to the 'simple' perspective if it exists; otherwise create it."
  (interactive)
  (let ((name "simple"))
    ;; Create new perspective if it doesn't exist
    ;; Switch to it
    (persp-switch name)
    (switch-to-buffer "*scratch*")
    ;; Kill chooser buffer
    (kill-buffer "*Choose Perspective*")))

;; -------------------------------
;; Perspective Chooser Buffer
;; -------------------------------
(defun my-persp-chooser ()
  "Show a list of perspectives and let the user choose one."
  (interactive)
  (let* ((persps (cons "Simple" ; always first
                       (cl-remove-if (lambda (x)
                                       (string-equal (downcase x) "simple"))
                                     (persp-names))))
         (choices (cl-loop for p in persps
                           for i from 1
                           collect (format "%d. %s" i p)))
         (prompt (concat "Choose a perspective:\n"
                         (mapconcat 'identity choices "\n")
                         "\nEnter number: "))
         (selection (read-number prompt))
         (chosen-persp (nth (1- selection) persps)))
    (if chosen-persp
        (progn
          (persp-switch chosen-persp)
          (message "Switched to perspective: %s" chosen-persp))
      (message "Invalid choice!"))))	

;; -------------------------------
;; Show chooser on startup
;; -------------------------------
(add-hook 'emacs-startup-hook #'my-persp-chooser)

(provide 'perspectives)
