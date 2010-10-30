; spaces not tabs
(setq indent-tabs-mode nil)

; just (smart-tab-mode) doesn't work for some reason. Add this to other hooks as needed until we learn how this works.
(add-hook 'clojure-mode-hook 'smart-tab-mode)

(setq default-tab-width 2)

(require 'haxe-mode)
(defconst my-haxe-style
  '("java" (c-offsets-alist . ((case-label . +)
                               (arglist-intro . +)
                               (arglist-cont-nonempty . 0)
                               (arglist-close . 0)
                               (cpp-macro . 0))))
  "My haXe Programming Style")
(add-hook 'haxe-mode-hook
  (function (lambda () (c-add-style "haxe" my-haxe-style t))))
(add-hook 'haxe-mode-hook
          (function
           (lambda ()
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq fill-column 80)
             (setq c-electric-flag t)
             (local-set-key [(return)] 'newline-and-indent))))

(add-hook 'haxe-mode-hook 'smart-tab-mode)
; (add-hook 'haxe-mode-hook 'paredit-mode)
