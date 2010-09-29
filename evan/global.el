; spaces not tabs
(setq indent-tabs-mode nil)

; just (smart-tab-mode) doesn't work for some reason. Add this to other hooks as needed until we learn how this works.
(add-hook 'clojure-mode-hook 'smart-tab-mode)
