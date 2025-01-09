;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-tokyo-night)


(custom-theme-set-faces! 'doom-tokyo-night
  `(tree-sitter-hl-face:constructor :foreground ,(doom-color 'blue))
  `(tree-sitter-hl-face:number :foreground ,(doom-color 'orange))
  `(tree-sitter-hl-face:attribute :foreground ,(doom-color 'magenta) :weight bold)
  `(tree-sitter-hl-face:variable :foreground ,(doom-color 'base7) :weight bold)
  `(tree-sitter-hl-face:variable.builtin :foreground ,(doom-color 'red))
  `(tree-sitter-hl-face:constant.builtin :foreground ,(doom-color 'magenta) :weight bold)
  `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue) :weight bold)
  `(tree-sitter-hl-face:function.macro :foreground ,(doom-color 'teal))
  `(tree-sitter-hl-face:label :foreground ,(doom-color 'magenta))
  `(tree-sitter-hl-face:operator :foreground ,(doom-color 'blue))
  `(tree-sitter-hl-face:variable.parameter :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:type :foreground ,(doom-color 'yellow))
  `(tree-sitter-hl-face:type.builtin :foreground ,(doom-color 'blue))
  `(tree-sitter-hl-face:tag :foreground ,(doom-color 'base7))
  `(tree-sitter-hl-face:string :foreground ,(doom-color 'green))
  `(tree-sitter-hl-face:comment :foreground ,(doom-color 'base6))
  `(tree-sitter-hl-face:function :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:method :foreground ,(doom-color 'blue))
  `(tree-sitter-hl-face:function.builtin :foreground ,(doom-color 'cyan))
  `(tree-sitter-hl-face:property :foreground ,(doom-color 'blue))
  `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'magenta)))


;; (setq doom-theme 'catppuccin)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq tree-sitter-hl-mode t)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;; (unless (display-graphic-p)
;;   (corfu-terminal-mode +1))
;; ;; (add-hook 'corfu-mode-hook #'corfu-doc-mode)

;; Corfu


(corfu-echo-mode +1)
(corfu-history-mode +1)

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

;; (add-hook 'corfu-mode-hook #'corfu-doc-mode)
;; Optionally:
(setq nerd-icons-corfu-mapping
      '((array :style "cod" :icon "symbol_array" :face font-lock-type-face)
        (boolean :style "cod" :icon "symbol_boolean" :face font-lock-builtin-face)
        ;; ...
        (t :style "cod" :icon "code" :face font-lock-warning-face)))
        ;; Remember to add an entry for `t', the library uses that as default.

;; The Custom interface is also supported for tuning the variable above.
(setq kill-whole-line t)

(setq auto-save-default t
      make-backup-files t)
(setq confirm-kill-emacs nil)
(setq doom-font (font-spec :family "CodeNewRoman Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "CodeNewRoman Nerd Font Mono" :size 14))
(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))


(use-package! visual-regexp-steroids
  :defer 3
  :config
  ;; (require 'pcre2el)
  ;; (setq vr/engine 'pcre2el)
  (map! "C-c s r" #'vr/replace)
  (map! "C-c s q" #'vr/query-replace))

(after! undo-fu
  (map! :map undo-fu-mode-map "M-/" #'undo-fu-only-redo))

(after! treemacs
  (treemacs-follow-mode 1))
(unless window-system
  (xterm-mouse-mode)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))
;; (global-clipetty-mode)
(map! "C-s" #'+default/search-buffer
      "C-t" #'eshell-toggle
      )

;; (map! "C-<tab>" #'format/region
(map! "<backtab>" #'indent-rigidly-left-to-tab-stop
      )

(use-package! eshell-follow
  :after-call eshell-follow-global-mode)

;; (defadvice kill-region (before slick-cut activate compile)
;;   "When called interactively with no active region, kill a single line instead."
;;   (interactive
;;    (if mark-active
;;        (list (region-beginning) (region-end))
;;      (list (line-beginning-position) (line-beginning-position 2)))))


(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

;; (defadvice comment-or-uncomment-region (before slick-comment activate compile)
;;   "When called interactively with no active region, commment/uncomment a single line instead."
;;   (interactive
;;    (if mark-active
;;        (
;;         (list (region-beginning) (region-end)))
;;      (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-ring-save (after keep-transient-mark-active ()) ;
  "Override the deactivation of the mark."
  (setq deactivate-mark nil))
(ad-activate 'kill-ring-save)

(defun mark-unmark-toggle()             ;does what it says on the box ~~fuck this took me way too long lmao~~
  (interactive
   (if mark-active
       (deactivate-mark)
     (push-mark nil nil t))))

(defadvice backward-kill-word (around delete-pair activate)
  (if (eq (char-syntax (char-before)) ?\()
      (progn
    (backward-char 1)
    (save-excursion
      (forward-sexp 1)
      (delete-char -1))
    (forward-char 1)
    (append-next-kill)
    (kill-backward-chars 1))
    ad-do-it))

(defun acg/with-mark-active (&rest args)
  "Keep mark active after command. To be used as advice AFTER any
function that sets `deactivate-mark' to t."
  (setq deactivate-mark nil))

(advice-add 'comment-or-uncomment-region :after #'acg/with-mark-active)

(setq cd2/region-command 'cd2/comment-or-uncomment-lines)

(map! "M-#" #'comment-dwim-2)
(map! "C-@" #'mark-unmark-toggle)
(map! "C-SPC" #'mark-unmark-toggle)

(defun kill-line-or-region ()
  "kill region if active only or kill line normally"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))

(global-set-key (kbd "C-k") 'kill-line-or-region)

;; (map! "C-w" #'backward-kill-word)
(defun backward-kill-region-or-word ()
  "kill region if active only or kill line normally"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'backward-kill-word)))
(global-set-key (kbd "C-w") 'backward-kill-region-or-word)


(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(map! "C-c C-t" #'treemacs-select-window)
  ;; config.el
  ;; (require 'tera-mode)
;; (treemacs-no-png-images t)
(use-package! treemacs
  :defer t
  :config
  (setq doom-themes-treemacs-theme "doom-colors")
  )

(setq treemacs-no-png-images t)


(global-set-key (kbd "C-x C-t") 'ivy-switch-buffer-other-window)
(global-set-key (kbd "C-<tab>") '+ivy/switch-workspace-buffer)
(setq persp-emacsclient-init-frame-behaviour-override "main")

(global-set-key (kbd "C-c SPC") 'avy-goto-char)
(global-set-key (kbd "C-c C-SPC") 'avy-goto-char)

(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )


;; (use-package lsp-mode
;;   :hook ((c-mode          ; clangd
;;           c++-mode        ; clangd
;;           c-or-c++-mode   ; clangd
;;           java-mode       ; eclipse-jdtls
;;           js-mode         ; ts-ls (tsserver wrapper)
;;           js-jsx-mode     ; ts-ls (tsserver wrapper)
;;           typescript-mode ; ts-ls (tsserver wrapper)
;;           python-mode     ; pyright
;;           web-mode        ; ts-ls/HTML/CSS
;;           haskell-mode    ; haskell-language-server
;;           ) . lsp-deferred)
;;   :commands lsp
;;   :config
;;   (setq lsp-auto-guess-root t)
;;   (setq lsp-log-io nil)
;;   (setq lsp-restart 'auto-restart)
;;   (setq lsp-enable-symbol-highlighting nil)
;;   (setq lsp-enable-on-type-formatting nil)
;;   (setq lsp-signature-auto-activate nil)
;;   (setq lsp-signature-render-documentation nil)
;;   (setq lsp-eldoc-hook nil)
;;   (setq lsp-modeline-code-actions-enable nil)
;;   (setq lsp-modeline-diagnostics-enable nil)
;;   (setq lsp-headerline-breadcrumb-enable nil)
;;   (setq lsp-semantic-tokens-enable nil)
;;   (setq lsp-enable-folding nil)
;;   (setq lsp-enable-imenu nil)
;;   (setq lsp-enable-snippet nil)
;;   (setq read-process-output-max (* 1024 1024)) ;; 1MB
;;   (setq lsp-idle-delay 0.5))



;; (use-package lsp-ui
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-doc-enable nil)
;;   (setq lsp-ui-doc-header t)
;;   (setq lsp-ui-doc-include-signature t)
;;   (setq lsp-ui-doc-border (face-foreground 'default))
;;   (setq lsp-ui-sideline-show-code-actions t)
;;   (setq lsp-ui-sideline-delay 0.05))
(if (display-graphic-p)
    (progn
      ;; if graphic
      (use-package! corfu
        :custom
        (corfu-auto t)               ;; Enable auto completion
        (corfu-preselect 'directory) ;; Select the first candidate, except for directories

        :init
        (global-corfu-mode)

        :config
        ;; Free the RET key for less intrusive behavior.
        ;; Option 1: Unbind RET completely
        ;; (keymap-unset corfu-map "RET")
        ;; Option 2: Use RET only in shell modes
        (keymap-set corfu-map "RET" `( menu-item "" nil :filter
                                       ,(lambda (&optional _)
                                          (and (derived-mode-p 'eshell-mode 'comint-mode)
                                               #'corfu-send))))))

  ;; else (optional)
  (use-package! corfu
    :custom
    (corfu-auto t)               ;; Enable auto completion
    (corfu-preselect 'directory)) ;; Select the first candidate, except for directories
  (after! corfu
    (map! :map corfu-map
          "TAB"     #'corfu-insert))
  (keymap-unset corfu-map "RET")
    (corfu-terminal-mode +1))



(custom-set-faces!
  '(default :background nil))



(after! lsp-volar
  ;; remove :system after lsp-volar loaded
  (lsp-dependency 'typescript
                  '(:npm :package "typescript"
                    :path "tsserver")))
;; Garbage collection (or lack thereof soon)
(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; config.el
(require 'tera-mode)

(use-package! eee
  :config

  ;; Should have wezterm or alacritty installed, more terminal application is supporting...
;; Issues and pull requests are welcome
  (setq ee-terminal-command "alacritty")
  (global-set-key (kbd "C-c C-o") 'ee-find)
  (global-set-key (kbd "C-c C-l") 'ee-lazygit)
  (global-set-key (kbd "C-c C-s") 'ee-line)
  (global-set-key (kbd "C-c C-d") 'ee-delta)
  (global-set-key (kbd "C-c C-a") 'ee-rg)
  (global-set-key (kbd "C-c C-p") 'ee-spotify-player)
  )

(setq treesit-font-lock-level 4)





;; When idle for 15sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))
