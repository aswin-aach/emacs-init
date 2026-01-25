;; --- Dired: open files in the right window instead of replacing Dired ---

(defun my/dired-open-in-right-window ()
  "In Dired, open the file at point in the window to the right.
Keep Dired open in its own window."
  (interactive)
  (let ((file (dired-get-file-for-visit))
        (this-win (selected-window))
        right-win)
    ;; find the right-hand window
    (setq right-win (window-in-direction 'right this-win))
    (if (window-live-p right-win)
        (progn
          (select-window right-win)
          (find-file file))
      ;; fallback: split and open
      (select-window (split-window this-win nil 'right))
      (find-file file))))

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "o") #'my/dired-open-in-right-window))

(provide 'dired-open-right)
