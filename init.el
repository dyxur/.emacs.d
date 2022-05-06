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
   '("c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "b4ba3e1bba2e303265eb3e9753215408e75e031f7c894786ad04cabef46ff94c" "824d07981667fd7d63488756b6d6a4036bae972d26337babf7b56df6e42f2bcd" default))
 '(package-selected-packages
   '(multiple-cursors which-key ac-php php-mode corfu paredit use-package luarocks lsp-mode dracula-theme 2048-game lua-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; =================================
;; || EMACS CONFIGURATION          ||
;; =================================
;; setup package and use-package
(package-initialize)

;; override the default http with https
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")))

;; Add the MELPA archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Aquire and process needed Packages
(setq package-list '(lua-mode dracula-theme use-package))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  :init
  (corfu-global-mode))

(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :hook
  (html-mode . lsp)
  :init
  (setq lsp-keymap-prefix "C-c l"))

(use-package php-mode
  :ensure t
  :mode ("\\.php\\'" . php-mode)
  :hook (php-mode . lsp-deferred))

;; Shows a list of commands
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :ensure t
  :init
  (global-set-key (kbd "C-S-c c") 'mc/edit-lines)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click))

;; Adds a browsable kill-ring instead of C-y, M-y, M-y, ...
(use-package browse-kill-ring
  :ensure t
  :init
  (global-set-key (kbd "M-y") 'browse-kill-ring)
  (setq-default browse-kill-ring-highlight-current-entry t)
  (setq-default browse-kill-ring-show-preview t))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Remove toolbar
(tool-bar-mode -1)

;; Setup indetation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq-default indent-line-function 'insert-tab)

;; Whitesapce
(global-whitespace-mode 1)
(global-display-line-numbers-mode 1)
(setq-default whitespace-line-column 250)

;; Turn on saving of session
(desktop-save-mode 1)

;; Turn on line highlight
(global-hl-line-mode 1)

;; Duplicate line down
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )

;; Delete selection
(delete-selection-mode 1)

;; Keyboard shortcuts
(global-set-key (kbd "C-c <C-down>") 'duplicate-line)
(global-set-key (kbd "C-c f") 'forward-whitespace)

;; Save backupds to a central folder
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;; Try to increase long line performance
(setq bidi-inhibit-bpa t)
(setq-default bidi-paragraph-direction 'left-to-right)

;; =================================
;; || LUA CONFIGURATION          ||
;; ================================='
(setq-default lua-indent-level 4)


;; =================================
;; || ORG-MODE CONFIGURATION       ||
;; =================================

;; Enable Org mode
(require 'org)
;; Use org mode by default with files ending in ".org"
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
