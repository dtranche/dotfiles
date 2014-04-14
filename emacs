;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

(setq plugin-path "~/.emacs.d/el-get/")
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

;; useful since we edit these when there are failures
(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))

(require 'el-get-settings)
(require 'custom-functions)
(require 'basic-settings)
(require 'cpp-settings)

;; stuff I got from the web
(require 'xcscope)
(require 'cpp-font-lock)
(require 'grep-buffers)
(require 'custom-java-style)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
