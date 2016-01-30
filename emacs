;; BASIC STUFF WICKED IMPORTANT
;; Dont bring the startup message
;; edit by changing to lisp-mode
(message ".emacs started load.")
(setq inhibit-startup-message nil)

(defvar user (getenv "USER"))
(setq backup-inhibited t)
(setq auto-safe-default nil)
;;(setq vc-handled-backends nil)
;;(define-key global-map (kbd "\r") [return])

(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

(setq explicit-shell-file-name "/bin/bash")

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("emacs\\'" . lisp-mode))

; packages

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

; boot-strap use-package before specifying plugins
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(require 'custom-functions)

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  (setq helm-display-function #'pop-to-buffer))

(use-package helm-cscope)

(use-package helm-projectile
  :ensure t)

;; (use-package magit
;;   :ensure t
;;   :init
;;   (setq magit-last-seen-setup-instructions "1.4.0"))

(require 'basic-settings)
(require 'helm-settings)
(require 'cpp-settings)

;;(require 'helm)
;; (require 'basic-settings)
;; (require 'xcscope)
;; (require 'grep-buffers)
;; (require 'custom-java-style)
;; (if (is-aws)
;;     (progn
;;       (define-key cscope-list-entry-keymap "\r" 'cscope-select-entry-other-window)))
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (autoload 'ibuffer "ibuffer" "List buffers." t)
;; (global-set-key (kbd "C-f") 'forward-symbol)

;; ;; (setq-default ac-sources
;; ;;               '(ac-source-gtags
;; ;;                 ac-source-abbrev
;; ;;                 ac-source-dictionary
;; ;;                 ac-source-words-in-same-mode-buffers)
;; ;; )

;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-taming-mr-arneson)

;; ;; this probably should be mac only
;; ;; I really only want to click between buffers
(xterm-mouse-mode t)
(which-function-mode 1)
;; (eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))

(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-m") 'windmove-down)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-k") 'windmove-right)

;;
;; To use this package, add these lines to your init.el or .emacs file:
;;
    ;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; Set key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))



(setq compile-history
       '("make -j 32 server_check_native"
         "make -j 32 server_fast_native"
         "make -j 32 server_rpm_native"
         "make -j 32 server_clean_native"
         "make -j 32 clean"))

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
