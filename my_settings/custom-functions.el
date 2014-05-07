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

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
    (set-mark-command 1))

(defun system-is-mac()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
    (string-equal system-type "gnu/linux"))

(defun is-aws ()
  (interactive)
  (if (string-match "aws-us-east-1.redlinetrading.com" system-name)
      t
    nil))

(provide 'custom-functions)
