(require 'flycheck-clj-kondo)
;; Some quality-of-life defaults
(setq nrepl-log-messages t
      cider-repl-display-help-banner nil)

(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'clj-refactor-mode)
(add-hook 'clojure-mode-hook #'flycheck-mode)

(provide 'clojure-setup)
