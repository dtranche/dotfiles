;; used to store helm configurations
;; tabs
;; keystrokes
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)

(setq helm-M-x-fuzzy-match t) ;; enable fuzzy matching

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key [f5] 'helm-cscope-find-global-definition)
(global-set-key [f6] 'helm-cscope-find-this-symbol)
(global-set-key [(shift f6)] 'helm-cscope-find-this-text-string)
(global-set-key [f7] 'helm-resume)
(global-set-key [f8] 'helm-occur)
(provide 'helm-settings)
