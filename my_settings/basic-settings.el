;; used to store more basic settings
;; tabs
;; keystrokes

;; General setup
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(line-number-mode t)
(column-number-mode t)

;;(global-linum-mode 1)
(setq linum-format "%4d  ")

;; Adding 11/08/2012
;;(ido-mode 1)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)

;; Highlight the edited line
(global-hl-line-mode 1)

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
;;(define-key global-map [f1] 'help-command)
(define-key global-map [f2] 'undo)
;;(define-key global-map [f3] 'isearch-forward)
;;(define-key global-map [f4] 'other-window)
;;(define-key global-map [f5] 'other-frame)(
 (define-key global-map [f4] 'ediff-buffers)
;; (global-set-key [f5] 'cscope-find-global-definition)
;; (global-set-key [f6] 'cscope-find-this-symbol)
;; (global-set-key [(shift f6)] 'cscope-find-this-text-string)
;; (global-set-key [f7] 'cscope-next-symbol)

(define-key global-map [f12] 'revert-buffer)

(global-set-key [f9] 'compile)
(global-set-key [f10] 'next-error)
;; keystrokes from derived functions
(global-set-key "%" 'match-paren)
(global-set-key (kbd "C-_") 'push-mark-no-activate)
(global-set-key (kbd "M-/") 'jump-to-mark)
;; fedora/gnome maps "M-`" to something else
(global-set-key (kbd "M-1") 'jump-to-mark)

;;(global-set-key (kbd "M-<up>") 'scroll-down-command)
;;(global-set-key (kbd "M-<down>") 'scroll-up-command)
;;(global-set-key (kbd "ESC <up>") 'scroll-down-command)
;;(global-set-key (kbd "ESC <down>") 'scroll-up-command)
;; add a couple to auto-modes-alist
(add-to-list 'auto-mode-alist '("[Mm]ake*" . makefile-mode))
(global-set-key (kbd "C-c a") 'beginning-of-defun)
(global-set-key (kbd "C-c e") 'end-of-defun)

;; set command key to be meta instead of option
;; ns seems broken 3/22/2014???
(if (system-is-mac)
    (message "I am a Mac")
    (setq ns-command-modifier 'meta))


(fset 'yes-or-no-p 'y-or-n-p)

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the regions."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)
;;(defalias 'rb 'revert-without-query)
(defalias 'es 'eshell)
(defalias 'rn 'rename-buffer)

(require 'highlight-symbol)

(global-set-key (kbd "C-`") 'highlight-symbol-at-point)
(global-set-key [f1] 'highlight-symbol-next)
(global-set-key [(shift f1)] 'highlight-symbol-prev)

(defun prev-window()
  "Moves to the previous window"
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'prev-window)

(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
  The CHAR is replaced and the point is put before CHAR."
  (insert char)
  (forward-char -1))

(defun my-term(buffer-name)
  (interactive "sbuffer name : ")
  (ansi-term "/bin/bash")
  (rename-buffer buffer-name t))

;;(setq split-width-threshold 2000)
;;(setq split-height-threshold 1200)
(provide 'basic-settings)
