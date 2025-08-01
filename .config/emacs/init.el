;; init.el
;; @author nate zhoou
;; @since 2025

(set-background-color "#111111")
(set-foreground-color "#dddddd")
(set-face-attribute 'default nil :font "SourceCodePro-14")

;; emacs daemon doesn't have access to GUI resources
(add-hook 'after-make-frame-functions
    (lambda (frame)
      (with-selected-frame frame
        (set-background-color "#111111")
        (set-foreground-color "#dddddd")
        (set-face-attribute 'default nil :font "SourceCodePro-14"))))

(custom-set-variables
 '(package-selected-packages '(company evil)))
(custom-set-faces
 '(mode-line ((t (:background "#427b58" :foreground "#eeeeee")))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(blink-cursor-mode 0)

(which-key-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq org-startup-with-inline-images t)

(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
    :init
    (evil-mode 1)
    :custom
    (evil-want-integration t)
    (evil-visual-state-cursor 'box)
    :config
    (evil-define-key 'normal 'global (kbd "g") 'evil-goto-line)
)

(use-package company
    :hook (after-init . global-company-mode)
    :bind (:map company-active-map
                ("C-n" . company-select-next)
                ("C-p" . company-select-previous)
          )
    :config (
                (add-to-list 'company-backends 'company-dabbre)
            )
)
