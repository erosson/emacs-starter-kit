; spaces not tabs
(setq indent-tabs-mode nil)

; just (smart-tab-mode) doesn't work for some reason. Add this to other hooks as needed until we learn how this works.
(add-hook 'clojure-mode-hook 'smart-tab-mode)

(setq default-tab-width 2)

(add-to-list 'load-path "~/.emacs.d/evan/coffee-mode")
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;(require 'haxe-mode)
;(defconst my-haxe-style
;  '("java" (c-offsets-alist . ((case-label . +)
;                               (arglist-intro . +)
;                               (arglist-cont-nonempty . 0)
;                               (arglist-close . 0)
;                               (cpp-macro . 0))))
;  "My haXe Programming Style")
;(add-hook 'haxe-mode-hook
;  (function (lambda () (c-add-style "haxe" my-haxe-style t))))
;(add-hook 'haxe-mode-hook
;          (function
;           (lambda ()
;             (setq tab-width 4)
;             (setq indent-tabs-mode t)
;             (setq fill-column 80)
;             (setq c-electric-flag t)
;             (local-set-key [(return)] 'newline-and-indent))))
;
;(add-hook 'haxe-mode-hook 'smart-tab-mode)
; (add-hook 'haxe-mode-hook 'paredit-mode)

(require 'flymake)

; http://www.emacswiki.org/emacs/FlymakeJavaScript
(defun flymake-jslint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
         (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "rhino" (list (expand-file-name "~/.emacs.d/evan/jslint.js") local-file))))

(setq flymake-allowed-file-name-masks
      (cons '(".+\\.js$"
	      flymake-jslint-init
	      flymake-simple-cleanup
	      flymake-get-real-file-name)
	    flymake-allowed-file-name-masks))

(setq flymake-err-line-patterns 
      (cons '("^Lint at line \\([[:digit:]]+\\) character \\([[:digit:]]+\\): \\(.+\\)$"  
	      nil 1 2 3)
	    flymake-err-line-patterns))
(add-hook 'espresso-mode-hook (lambda () (flymake-mode t)))
; match jslint defaults
(add-hook 'espresso-mode-hook (lambda ()
                                (setq default-tab-width 4)
                                (setq espresso-indent-level 4)))

(global-set-key (kbd "C-c n") 'flymake-display-err-menu-for-current-line) 
