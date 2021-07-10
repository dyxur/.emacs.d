;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("824d07981667fd7d63488756b6d6a4036bae972d26337babf7b56df6e42f2bcd" default))
 '(package-selected-packages '(luarocks lsp-mode dracula-theme 2048-game lua-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-list '(lua-mode dracula-theme))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq-default indent-line-function 'insert-tab)
(global-whitespace-mode 1)
(global-display-line-numbers-mode 1)

(setq-default lua-indent-level 4)
(desktop-save-mode 1)
(setq-default whitespace-line-column 250)
