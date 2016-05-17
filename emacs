;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

(defvar user (getenv "USER"))
(setq backup-inhibited t)
(setq auto-safe-default nil)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;;(setq vc-handled-backends nil)
;;(define-key global-map (kbd "\r") [return])
(xterm-mouse-mode t)
(which-function-mode 1)

 (add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

(setq explicit-shell-file-name "/bin/bash")

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))

; packages

(require 'package)
(setq package-archives '(("melpa" . "http://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)
;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'custom-functions)
(require 'basic-settings)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun get-point ( symbol &optional arg )
  "get the point"
  (funcall symbol arg )
  (point)
)

(defun copy-thing ( begin-of-thing end-of-thing &optional arg )
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
)

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
)

(global-set-key [remap forward-word] 'forward-symbol)
(global-set-key (kbd "C-b") 'copy-word)

(defun revert-buffer-no-confrimation ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t)
)

(setq compile-history
       '("make -j 32 server_check_native"
         "make -j 32 server_fast_native"
         "make -j 32 server_rpm_native"
         "make -j 32 server_clean_native"
         "make -j 32 clean"))

(require 'helm)
(require 'helm-config)
(require 'helm-cscope)
(require 'helm-projectile)

(require 'helm-settings)
(require 'cpp-settings)



;; (put 'upcase-region 'disabled nil)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes (quote ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil))))
;;  '(cscope-line-face ((t (:foreground "cyan")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
