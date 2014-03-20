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


;; Global Key Bindings
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

;; Setup save options (auto and backup)
(setq auto-save-timeout 2000)
(setq make-backup-files t)

;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'java-mode-hook 'custom-set-java-style)

;; Setup time mode
(autoload 'display-time "time" "Display Time" t)
(condition-case err
    (display-time)
      (error (message "Unable to load Time package.")))
      (setq display-time-24hr-format nil)
      (setq display-time-day-and-date t)

;; programming stuff -- c++ first
; style I want to use in c++ mode
(defun my-cpp-mode ()
  "Denis' C++ Mode"
    (c++-mode)
      (c-set-style "Ellemtel")
        (setq indent-tabs-mode nil)        ; use spaces rather than tabs
	  (setq c-basic-offset 2)            ; indent by 2 spaces
	    (setq c-basic-indent 2)
	      (c-set-offset 'case-label '+)
	        (c-set-offset 'comment-intro 'c-lineup-comment)
		  (c-set-offset 'inclass 'my-c-lineup-inclass)
		    (setq mode-name "Denis' C++")
		    )

;; Setup Default Syntax Mode
(defun my-c-lineup-inclass (langelem)
  (let ((inclass (assoc 'inclass c-syntactic-context)))
      (save-excursion
            (goto-char (c-langelem-pos inclass))
	          (if (or (looking-at "struct")
		                (looking-at "typedef struct"))
				          '+
					            '++))))

(font-lock-add-keywords 'c++-mode
  '(("override" . font-lock-keyword-face)))


;; Associate extensions with modes
;; Use same mode for c and c++
(add-to-list 'auto-mode-alist '("\\.h$" . my-cpp-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . my-cpp-mode))
(add-to-list 'auto-mode-alist '("\\.cc$" . my-cpp-mode))
(add-to-list 'auto-mode-alist '("\\.c$" . my-cpp-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("[Mm]ake*" . makefile-mode))

;;;;_____________________________________________________________
;; ADD FUNCTIONS SECTION
;;
;;
;;;;_____________________________________________________________

;; add match-paren
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
      (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
                  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		              (t (self-insert-command (or arg 1)))))

;(condition-case err
;    (progn (function-menu)
;               (add-hook 'c-mode-common-hook 'fume-add-menubar-entry));
;	         (error (message "Unable to load Function Menu package")))

(defun dos2unix (buffer)
  "Automate M-% C-q C-M RET C-q C-j RET"
    (interactive "*b")
      (save-excursion
          (goto-char (point-min))
	      (while (search-forward (string ?\C-m) nil t)
	            (replace-match (string ?\C-j) nil t))))

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
    (push-mark (point) t nil)
      (message "Pushed mark to ring"))

(global-set-key (kbd "C-`") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
    (set-mark-command 1))

(global-set-key (kbd "M-`") 'jump-to-mark)

(defun system-is-mac()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
    (string-equal system-type "gnu/linux"))

; set command key to be meta instead of option
(if (system-is-mac)
    (message "I am a Mac")
    (setq ns-command-modifier 'meta))

;; put packages last
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/xcscope")
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(add-to-list 'load-path "~/.emacs.d/el-get/popup")
(add-to-list 'load-path "~/.emacs.d/el-get/git-emacs")
(add-to-list 'load-path (expand-file-name "~/environment/emacs"))

(require 'cpp-font-lock)
(require 'auto-complete)
(require 'xcscope)
(require 'grep-buffers)
(require 'custom-java-style)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
