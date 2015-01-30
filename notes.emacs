;; Things I should remember and always forget

C-h ? is for help
C-h v -- help variable
C-h k -- help on key
C-h f -- help on function

C-x C-+/- to change the text size
;; use occur mode
M-s o -- search a given buffer for all occurance
C-x ` -- to navigate to next 
C-x ~ -- to navigate to previous (not set up)

;; in *scratch* test lisps commands 
;; usefull for testing commands
;; C-j executes the line

;; define aliases
;; usefull examples
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)    

(global-set-key (kbd "M-<up>") 'scroll-down-command)
(global-set-key (kbd "M-<down>") 'scroll-up-command)
;;looks like these are the correct commands
(global-set-key (kbd "ESC <up>") 'scroll-down-command)
(global-set-key (kbd "ESC <down>") 'scroll-up-command)


;; create an eshell named main
(defun test-es ()
  "Open eshell and name it main"
  (interactive)
  (split-window-sensibly (selected-window))
  (eshell)
  (rename-buffer "main"))
  
  
;; a different test
(defun test-es ()
  "Open eshell and name it main"
  (interactive)
    (if (not (get-buffer "main"))
        (progn
          (split-window-sensibly (selected-window))
          (eshell)
          (rename-buffer "main"))
      (switch-to-buffer-other-window "main"))
    )

;; use dired in eshell
dired <directory>
find-dired . "-name \*.h"
;; create .Eshell file 
;; setup cscope 
find -L . -name \*.cc -o -name \*.cpp -o -name \*.c -o -name \*.h  > cscope.files
cscope -b -q -k

for num in {1..5}; do grep -E "level\[0$num" ~/trade_volume_book_client.txt | sort -u; done
