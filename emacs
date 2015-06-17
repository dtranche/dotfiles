;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

(defvar user (getenv "USER"))
;;(setq vc-handled-backends nil)
;;(define-key global-map (kbd "\r") [return])

(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

(setq explicit-shell-file-name "/bin/bash")
;; this would normally come from el-get packaging
;; setup for Redline

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))

(require 'custom-functions)
(require 'basic-settings)
(require 'cpp-settings)
(require 'xcscope)
(require 'grep-buffers)
(require 'custom-java-style)
(if (is-aws)
    (progn
      (define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window)))

;; (require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (require 'auto-complete-config)
;; (ac-config-default)

;; this probably should be mac only
;; I really only want to click between buffers
(xterm-mouse-mode t)
(which-function-mode 1)
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))

(setq compile-history 
      '("make -j 32 server_check_native"
        "make -j 32 server_fast_native"
        "make -j 32 server_rpm_native"
        "make -j 32 server_clean_native"
        "make -j 32 clean"))

(put 'upcase-region 'disabled nil)
