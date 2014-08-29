;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

(defvar user (getenv "USER"))
(setq plugin-path "~/.emacs.d/el-get/")
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

;; this would normally come from el-get packaging
;; setup for Redline
(if (< emacs-major-version 24)
    (progn
      (require 'xcscope)
      (progn
	(if (string-match "denist" user)
	    (progn
	      (message "My Redline specific configs")
	      (define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window)
	      ;;(color-theme-initialize)
	      ;;(color-theme-taming-mr-arneson)
	      )))))
    
;; useful since we edit these when there are failures
(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))

(require 'custom-functions)
(require 'cpp-settings)

(if (>= emacs-major-version 24) 
      (require 'el-get-settings))

(require 'basic-settings)
(require 'xcscope)

(if (is-aws)
    (progn
      (define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window)))
;;      (require 'xcscope)

;;      (message "My Redline AWS specific configs")

(require 'grep-buffers)
(require 'custom-java-style)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

(setq compile-history 
      '("make -j 10 server_check_native"
        "make -j 10 server_fast_native"
        "make -j 10 server_rpm_native"
        "make -j 10 server_clean_native"))
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
