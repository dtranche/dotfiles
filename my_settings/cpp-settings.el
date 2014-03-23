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

(provide 'cpp-settings)
