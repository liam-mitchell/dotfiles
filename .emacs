(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(c-basic-offset 4)
 '(compilation-scroll-output t t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "gray10" :foreground "gray80"))))
 '(sh-heredoc ((t (:foreground "yellow1" :weight normal)))))
(setq initial-frame-alist '((font . "Monospace-10")))
(setq default-frame-alist '((font . "Monospace-10")))

(setq ring-bell-function 'ignore)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

;; (load "/home/liam/Downloads/nxhtml-master/autostart.el")
;; (setq mumamo-background-colors nil)
;; (setq mumamo-per-buffer-local-vars
;;       (delq 'buffer-file-name mumamo-per-buffer-local-vars))

;; multi-mode configuration
;; for mixing html and php files
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

(autoload 'php-mode "php-mode-improved" "" t)

(mmm-add-mode-ext-class 'html-mode "\\.php'" 'html-php) ;; set php files to use html-mode
(mmm-add-group ;; add group within html files
 'fancy-html
 '(
   (html-php-tagged
    :submode php-mode ;; mode to choose
    :front "<?php";;"<[?]php[\n]" ;; opening tag of mode
    :back "?>");;"\n[\t ]*[?]>") ;; closing tag of mode
   (html-css-attribute
    :submode css-mode
    :face mmm-declaration-submode-face
    :front "style=\""
    :back "\"")))

(setq mmm-submode-decoration-level '0)

(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" nil)
;; (global-auto-complete-mode t)

;; (require 'mk-project)
;; (load-file "~/.emacs.d/projects/mech.el")

;; (global-set-key (kbd "C-c p c") 'project-compile)
;; (global-set-key (kbd "C-c p l") 'project-load)
;; (global-set-key (kbd "C-c p a") 'project-ack)
;; (global-set-key (kbd "C-c p g") 'project-grep)
;; (global-set-key (kbd "C-c p o") 'project-multi-occur)
;; (global-set-key (kbd "C-c p u") 'project-unload)
;; (global-set-key (kbd "C-c p f") 'project-find-file)
;; (global-set-key (kbd "C-c p i") 'project-index)
;; (global-set-key (kbd "C-c p s") 'project-status)
;; (global-set-key (kbd "C-c p h") 'project-home)
;; (global-set-key (kbd "C-c p d") 'project-dired)
;; (global-set-key (kbd "C-c p t") 'project-tags)

(add-to-list 'auto-mode-alist '("\\.php\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook
          (lambda ()
            (global-flycheck-mode)
            (set-face-foreground 'flycheck-error "color-124")
            (set-face-underline 'flycheck-error nil)
            (set-face-bold 'flycheck-error nil)))

(setq flycheck-gcc-language-standard "c++11")

(column-number-mode t)

(set-face-foreground 'font-lock-preprocessor-face "gray50")
(set-face-foreground 'font-lock-string-face "color-240")
(set-face-foreground 'font-lock-function-name-face "color-28")
(set-face-foreground 'font-lock-keyword-face "color-47")
(set-face-foreground 'font-lock-constant-face "color-39")
(set-face-foreground 'font-lock-type-face "color-30")
(set-face-foreground 'font-lock-variable-name-face "color-25")
(set-face-foreground 'font-lock-comment-face "color-103")
(set-face-foreground 'font-lock-comment-delimiter-face "color-103")
(set-face-foreground 'font-lock-doc-face "color-103")

;; (set-face-foreground 'mumamo-border-face-in "color-106")
;; (set-face-foreground 'mumamo-border-face-out "color-106")
;; (set-face-foreground 'diff-added "lawn green")
;; (set-face-background 'diff-added "gray10")
;; (set-face-foreground 'diff-removed "red")
;; (set-face-background 'diff-removed "gray10")
;; (set-face-foreground 'diff-indicator-added "forest green")
;; (set-face-background 'diff-indicator-added "gray10")
;; (set-face-foreground 'diff-indicator-removed "red")
;; (set-face-background 'diff-indicator-removed "gray10")

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c f") 'set-face-foreground)

(defun toggle-comment ()
  "comment or uncomment region or line"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-c /") 'toggle-comment)
(setq compilation-scroll-output t)

(global-linum-mode)
(set-variable 'linum-format "%-4d")

;; (defun flycheck--makefile-directory (dir)
;;   (let ((dir (expand-file-name dir)))
;;     (if (string= dir "/")
;;         'nil
;;       (if (member "Makefile" (directory-files dir))
;;           (file-name-as-directory dir)
;;         (flycheck--makefile-directory (concat dir "/.."))))))
  
;; (defun flycheck-makefile-directory ()
;;   (flycheck--makefile-directory (file-name-directory buffer-file-name)))

;; (defun trim-string (s)
;;   (replace-regexp-in-string "^[ \t\b\r]+" "" (replace-regexp-in-string "[ \t\n\b\r]+$" "" s)))

;; (defun flycheck-exclude (file)
;;   (if (and (file-regular-p (expand-file-name file))
;;            (or (string-match ".*\\.c$" file)
;;                (string-match ".*\\.cpp$" file)
;;                (string-match ".*\\.h$" file)
;;                (string-match ".*\\.hpp$" file))
;;            (not (string-match (concat ".*" (file-name-nondirectory buffer-file-name) "$") file)))
;;       file
;;     (if (and (file-directory-p (expand-file-name file))
;;              (not (or (string-match "\\.\\." file)
;;                       (string-match "\\." file))))
;;         (let ((files (directory-files (expand-file-name file))))
;;           (mapcar 'flycheck-exclude
;;                   (mapcar (lambda (x) (concat (file-name-as-directory file) x))
;;                           files)))
;;       nil)))

;; (defun flatten (l)
;;   (cond ((null l) nil)
;;         ((listp l) (append (flatten (car l)) (flatten (cdr l))))
;;         (t (list l))))

;; (require 'cl)

;; (defun flycheck-filter-excludes (e)
;;   (delq nil (flatten e)))

;; (defun flycheck-make-excludes ()
;;   (mapconcat (lambda (x) (concat "-o " x))
;;              (flycheck-filter-excludes (flycheck-exclude (flycheck-makefile-directory)))
;;              " "))

;; (defun flycheck-make-command ()
;;   (concat "make -n --what-if=" (file-name-nondirectory buffer-file-name) " "))

;; (defun flycheck-make-output ()
;;   (let ((default-directory (flycheck-makefile-directory)))
;;     (split-string (shell-command-to-string (flycheck-make-command))
;;                   "\n")))

;; (defun flycheck-contains-compiler-command (x)
;;   (cond ((null x)
;;          nil)
;;         ((string-match (concat ".*g\\+\\+.*" (file-name-nondirectory buffer-file-name) " ")
;;                        x)
;;          x)
;;         ((string-match (concat ".*gcc.*" (file-name-nondirectory buffer-file-name) " ")
;;                        x)
;;          x)
;;         ((string-match (concat ".*clang.*" (file-name-nondirectory buffer-file-name) " ")
;;                        x)
;;          x)))

;; (defun flycheck-compiler-command ()
;;   (if (null buffer-file-name)
;;       nil
;;     (split-string
;;      (car (remove-if-not #'flycheck-contains-compiler-command (flycheck-make-output)))
;;      " ")))

;; (defun flycheck-parse-includes (includes command)
;;   (let ((flag (pop command)))
;;     (cond ((null flag)
;;            includes)
;;           ((string= "-I" flag)
;;            (flycheck-parse-includes (cons (pop command) includes) command))
;;           ((string-match "-I.+" flag)
;;            (flycheck-parse-includes (cons (substring flag 2) includes) command))
;;           (t
;;            (flycheck-parse-includes includes command)))))
   
;; (defun flycheck-includes ()
;;   (flycheck-parse-includes '() (flycheck-compiler-command)))

;; (defun flycheck-is-gcc-command (command)
;;   (if (or (string-match ".*gcc.*" (car command))
;;           (string-match ".*g\\+\\+.*" (car command)))
;;       t
;;     nil))

;; (defun flycheck-is-clang-command (command)
;;   (if (string-match ".*clang.*" (car command))
;;       t
;;     nil))

;; (defun flycheck--detect-include-path (command)
;;   (cond ((flycheck-is-gcc-command command)
;;          (setq flycheck-gcc-include-path (flycheck-includes)))
;;         ((flycheck-is-clang-command command)
;;          (setq flycheck-clang-include-path (flycheck-includes)))
;;         (t nil)))

;; (defun flycheck-detect-include-path ()
;;   (interactive)
;;   (flycheck--detect-include-path (flycheck-compiler-command)))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'company-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'company-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (company-irony))

(defun my-company-mode-hook ()
  ;; (company-irony)
  (set-face-background 'company-tooltip "gray20")
  (set-face-background 'company-tooltip-selection "gray30")
  (set-face-foreground 'company-tooltip-annotation "black"))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'my-company-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)                             
