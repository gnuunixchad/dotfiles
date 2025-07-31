;; init.el
;; @author nate zhoou
;; @since 2025

;; emacs daemon doesn't have access to GUI resources
(add-hook 'after-make-frame-functions
    (lambda (frame)
      (with-selected-frame frame
        (set-background-color "#111111")
        (set-foreground-color "#dddddd")
        (set-face-attribute 'default nil :font "SourceCodePro-14"))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)

(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(setq evil-want-integration t)
(setq evil-visual-state-cursor 'box)
(define-key evil-normal-state-map "g" 'evil-goto-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#427b58" :foreground "#eeeeee")))))
