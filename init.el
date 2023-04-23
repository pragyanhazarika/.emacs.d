(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Change frame size
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))

;; Prevent auto-save #abc# mess
(setq auto-save-default nil)

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)

(load-theme 'wombat)

;; Make CTRL-C and CTRL-V work as copy and paste
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))

;; Replace CTRL key with CMD key
(setq mac-command-modifier 'control)

;; which-key is great for getting an overview of what keybindings are
;; available based on the prefix keys you entered.
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Emojis in buffers
(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)

(require 'setup-cedet)
(require 'setup-editing)

;; function-args
(add-to-list 'load-path "~/.emacs.d/function-args")
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

;; imenu anywhere ide-like menu
(unless (package-installed-p 'imenu-anywhere)
  (package-refresh-contents)
  (package-install 'imenu-anywhere))
(global-set-key (kbd "C-.") #'imenu-anywhere)

;; Semantic mode
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(sr-speedbar zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
