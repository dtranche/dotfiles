;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

;; General setup
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(line-number-mode t)
(column-number-mode t)

;; Adding 11/08/2012
;;(global-linum-mode 1)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; TURN ON VISIBLE PAREN MATCHING
(show-paren-mode 1)

;; TURN OFF THE ICONS
(tool-bar-mode 1)

(setq plugin-path "~/.emacs.d/el-get/")
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))


(define-key global-map "\C-xw" 'what-line)
(global-set-key "\C-xg" 'goto-line)
(define-key global-map [delete] 'delete-char)
(define-key global-map [backspace] 'delete-backward-char)
(define-key global-map [end] 'end-of-line )
(define-key global-map [f1] 'help-command)
(define-key global-map [f2] 'undo)
(define-key global-map [f3] 'isearch-forward)
(define-key global-map [f4] 'other-window)
(define-key global-map [f5] 'ediff-buffers)
(define-key global-map [f12] 'revert-buffer)

(global-set-key [f9] 'compile)

(require 'el-get-settings)
