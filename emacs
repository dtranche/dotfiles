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

(if (is-aws)
    (progn
      (require 'xcscope)
      (message "My Redline AWS specific configs")
      (define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window))
  (if (>= emacs-major-version 24) 
      (require 'el-get-settings)))

(require 'basic-settings)

(require 'grep-buffers)
(require 'custom-java-style)
