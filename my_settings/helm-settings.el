;; used to store helm configurations
;; tabs
;; keystrokes
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
;; ;; enable fuzzy matching
(setq helm-M-x-fuzzy-match t)

(global-set-key (kbd "C-x C-f") 'helm-projectile-find-file)

;; (global-set-key [f3] 'helm-gtags-dwim)
(global-set-key [f5] 'helm-cscope-find-global-definition)
(global-set-key [f6] 'helm-cscope-find-this-symbol)
(global-set-key [(shift f6)] 'helm-cscope-find-this-text-string)

(global-set-key [f7] 'helm-resume)
(global-set-key [f8] 'helm-occur)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-mini)


(provide 'helm-settings)
