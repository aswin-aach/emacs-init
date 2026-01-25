(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(package-initialize)
(require 'use-package)
(require 'request)
(add-hook 'prog-mode-hook #'company-mode)

(require 'clojure-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(leuven))
 '(global-display-line-numbers-mode t)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(marginalia orderless vertico consult dumb-jump perspective grip-mode claude-code ai-code-interface flycheck-clj-kondo clj-refactor rainbow-delimiters rust-mode sly request-deferred qrencode gnu-elpa-keyring-update cider lsp-metals scala-mode helm-lsp which-key lsp-ui company yasnippet flycheck projectile lsp-java nova-theme nov elpher))
 '(package-vc-selected-packages
   '((claude-code :vc-backend Git :url "https://github.com/tninja/claude-code.el")
	 (ai-code-interface :vc-backend Git :url "https://github.com/tninja/ai-code-interface.el"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'basic-convenience)

(require 'dap-tidying)

(require 'ide-like-setup)

(require 'dired-open-right)

(require 'perspectives)
