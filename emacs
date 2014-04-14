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

(if (>= emacs-major-version 24) 
    (require 'el-get-settings))
(require 'custom-functions)
(require 'basic-settings)
(require 'cpp-settings)
;;(global-set-key "\r" 'cscope-select-entry-other-window)


;; not sure what do with this
;;(define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window)

;;  if I am in terminal mode
;;(if (= window-system nil)
;; stuff I got from the web

(require 'grep-buffers)
(require 'custom-java-style)

;;(require 'cpp-font-lock)
(require 'grep-buffers)
(require 'custom-java-style)

