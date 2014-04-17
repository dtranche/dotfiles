;; used to store more basic settings 
;; tabs 
;; keystrokes

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

;; Global get strokeso
(define-key global-map "\C-xw" 'what-line)
(global-set-key "\C-xg" 'goto-line)
(define-key global-map [delete] 'delete-char)
(define-key global-map [backspace] 'delete-backward-char)
(define-key global-map [end] 'end-of-line )
(define-key global-map [f1] 'help-command)
(define-key global-map [f2] 'undo)
(define-key global-map [f3] 'isearch-forward)
(define-key global-map [f4] 'other-window)
(define-key global-map [f5] 'other-frame)
;;(define-key global-map [f5] 'ediff-buffers)
(define-key global-map [f12] 'revert-buffer)
(global-set-key [f9] 'compile)

;; keystrokes from derived functions
(global-set-key "%" 'match-paren)
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)
;; fedora/gnome maps "M-`" to something else
(global-set-key (kbd "M-1") 'jump-to-mark)

(global-set-key (kbd "M-<up>") 'scroll-down-command)
(global-set-key (kbd "M-<down>") 'scroll-up-command)
(global-set-key (kbd "ESC <up>") 'scroll-down-command)
(global-set-key (kbd "ESC <down>") 'scroll-up-command)
;; add a couple to auto-modes-alist
(add-to-list 'auto-mode-alist '("[Mm]ake*" . makefile-mode))

;; set command key to be meta instead of option
;; ns seems broken 3/22/2014???
(if (system-is-mac)
    (message "I am a Mac")
    (setq ns-command-modifier 'meta))

(if (>= emacs-major-version 24) 
    (progn
;;      (load-theme 'whiteboard)
;;      (if (system-is-mac)
      (load-theme 'tango-dark)
      (message "Running emacs 24 or greater"))
  (message "Think about updating emacs")
)

(provide 'basic-settings)
