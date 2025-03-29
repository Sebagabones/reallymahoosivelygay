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
  `(tree-sitter-hl-face:constructor :foreground ,(doom-color 'blue ))
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
;; (setq confirm-kill-emacs nil)
;; (setq doom-font (font-spec :family "CodeNewRoman Nerd Font Mono" :size 16)
;;       doom-variable-pitch-font (font-spec :family "CodeNewRoman Nerd Font Mono" :size 16))
(setq doom-font (font-spec :family "JetBrainsMono NFM" :size 12.0)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NFM" :size 12.0))
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

;; (defun mark-unmark-toggle()             ;does what it says on the box ~~fuck this took me way too long lmao~~
;;   (interactive
;;    (if mark-active
;;        (deactivate-mark)
;;      (push-mark nil nil t))))

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

(map! "M-;" #'comment-dwim-2)
;; (map! "C-@" #'mark-unmark-toggle)
;; (map! "C-SPC" #'mark-unmark-toggle)

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


;; (global-set-key (kbd "C-x C-t") 'ivy-switch-buffer-other-window)
(global-set-key (kbd "C-<tab>") '+vertico/switch-workspace-buffer)
;; (defun my-ivy-keybinding ()
;;   "Rebind key only in Ivy buffers."
;;   (define-key vertico-minibuffer-map (kbd "C-<tab>") 'vertico-next)
;;   (define-key vertico-minibuffer-map (kbd "<C-S-iso-lefttab>") 'vertico-previous))

;; (add-hook 'vertico-mode-hook 'my-ivy-keybinding)

(setq persp-emacsclient-init-frame-behaviour-override "main")

(global-set-key (kbd "C-c SPC") 'avy-goto-char)
;; (global-set-key (kbd "C-c C-SPC") 'avy-goto-char)

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


(use-package! lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-imenu t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-always-show t)
  (setq lsp-ui-sideline-delay 0.05))


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
        (keymap-unset corfu-map "RET")
        (keymap-unset corfu-map "<return>")
        ;; Free the RET key for less intrusive behavior.
        ;; Option 1: Unbind RET completely
        (after! corfu
          (map! :map corfu-map
                "<tab>"     #'corfu-insert))
        (keymap-unset corfu-map "<return>")
        (keymap-unset corfu-map "RET")))
  ;; Option 2: Use RET only in shell modes
  ;; (keymap-set corfu-map "RET" `( menu-item "" nil :filter
  ;;                                ,(lambda (&optional _)
  ;;                                   (and (derived-mode-p 'eshell-mode 'comint-mode)
  ;; #'corfu-send))))))

  ;; else (optional)
  (use-package! corfu
    :custom
    (corfu-auto t)               ;; Enable auto completion
    (corfu-preselect 'directory)) ;; Select the first candidate, except for directories
  (after! corfu
    (map! :map corfu-map
          "TAB"     #'corfu-insert))
  (keymap-unset corfu-map "RET")
  (corfu-terminal-mode +1)
  (corfu-popupinfo-mode 't))

;; (setq corfu-popupinfo-mode 't)
;; (setq corfu-popupinfo-delay 0)

;; (custom-set-faces!
;;   '(default :background nil))



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
  ;; (global-set-key (kbd "C-c C-o") 'ee-find)
  (global-set-key (kbd "C-c C-l") 'ee-lazygit)
  (global-set-key (kbd "C-c C-s") 'ee-line)
  (global-set-key (kbd "C-c C-d") 'ee-delta)
  (global-set-key (kbd "C-c C-a") 'ee-rg)
  (global-set-key (kbd "C-c C-p") 'ee-spotify-player)
  )

(global-set-key (kbd "C-h C-w") `exit-minibuffer) ;;this was driving me bonkers lmao

(setq treesit-font-lock-level 4)        ;

(setq treesit-language-source-alist
      '((astro "https://github.com/virchau13/tree-sitter-astro")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

(setq global-tree-sitter-mode 't)

;; (use-package! astro-ts-mode
;;   :after treesit-auto
;;   :init
;;   (when (modulep! +lsp)
;;     (add-hook 'astro-ts-mode-hook #'lsp! 'append))
;;   :config
;;   (global-treesit-auto-mode)
;;   (let ((astro-recipe (make-treesit-auto-recipe
;;                        :lang 'astro
;;                        :ts-mode 'astro-ts-mode
;;                        :url "https://github.com/virchau13/tree-sitter-astro"
;;                        :revision "master"
;;                        :source-dir "src")))
;;     (add-to-list 'treesit-auto-recipe-list astro-recipe)))


(add-to-list 'auto-mode-alist '("\\.ci\\'" . pascal-mode))

(defun my/ci-comment-tweak ()
  (setq-local comment-start "// ")
  (setq-local comment-end   ""))

(eval-after-load "pascal-mode"
  (add-hook 'pascal-mode-hook #'my/ci-comment-tweak))

(defun org-show-todo-tree ()
  "Create new indirect buffer with sparse tree of undone TODO items"
  (interactive)
  (clone-indirect-buffer "*org TODO undone*" t)
  (org-show-todo-tree nil) ; mimics interactive usage
  (org-remove-occur-highlights)
  )
(require 'ox-md)

(setq! speedbar-update-flag 't)
(setq! erc-modules '('(erc-modules
                       '(autojoin bufbar button completion fill imenu irccontrols list match menu
                         move-to-prompt netsplit networks nickbar nicks notifications notify
                         readonly ring spelling stamp track))))


(defun my/treesit-parser-for-lang-mode (lang-mode-symbol)
  (when (and (treesit-available-p)
             (treesit-language-available-p lang-mode-symbol))
    (treesit-parser-create lang-mode-symbol)))

(use-package! indent-bars
  :hook ((tree-sitter-hl-mode) . indent-bars-mode) ; or whichever modes you prefer
  :config
  (setopt
   indent-bars-color '(highlight :face-bg t :blend 0.7)
   ;; indent-bars-pattern "."
   indent-bars-color-by-depth '(:regexp "outline-\\([0-9]+\\)" :blend 0.8)
   indent-bars-pattern " . . . . ." ; play with the number of dots for your usual font size
   indent-bars-width-frac 0.25
   indent-bars-pad-frac 0.1
   indent-bars-highlight-current-depth '(:blend 1.0 :width 0.4 :pad 0.1 :pattern ".")
   ;; indent-bars-pad-frac 0.3
   indent-bars-ts-highlight-current-depth '(unspecified) ; equivalent to nil
   indent-bars-ts-color-by-depth '(unspecified)
   indent-bars-ts-color '(inherit unspecified :blend 0.05))
  :custom
  (indent-bars-no-descend-lists t) ; no extra bars in continued func arg lists
  (indent-bars-treesit-support t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  ;; Add other languages as needed
  (indent-bars-treesit-scope '((python function_definition class_definition for_statement
	                        if_statement with_statement while_statement)))
  ;; Note: wrap may not be needed if no-descend-list is enough
  (indent-bars-treesit-wrap '((python argument_list parameters ; for python, as an example
			       list list_comprehension
			       dictionary dictionary_comprehension
			       parenthesized_expression subscript)))
  (indent-bars-treesit-wrap '((c
                               argument_list parameter_list init_declarator parenthesized_expression)))
  (indent-bars-treesit-wrap '((yaml
                               block_mapping_pair comment)))
  (indent-bars-treesit-wrap '((elisp
                               quote special_form function_definition)))
  (indent-bars-treesit-wrap '((toml
                               table array comment)))
  :hook
  ((python-ts-mode yaml-ts-mode c-ts-mode c++-ts-mode toml-ts-mode) . indent-bars-mode)
  (emacs-lisp-mode . (lambda () (my/treesit-parser-for-lang-mode 'elisp))))

;; indent-bars-ts-color '(inherit fringe :face-bg t :blend 0.2))(setq indent-bars-color-by-depth '(:regexp "outline-\\([0-9]+\\)" :blend 1)))


(setq whitespace-line-column nil
      whitespace-style
      '(face indentation tabs tab-mark spaces space-mark newline newline-mark
        trailing lines-tail)
      whitespace-display-mappings nil
      )

(setq lsp t)
(setq indent-bars-mode t)
(setq tree-sitter-mode t)
(setq org-todo-keyword-faces
      '(("OKAY" . (:foreground (doom-color 'magenta ) :weight bold))
      ("NO" . (:foreground (doom-color 'red ) :weight bold))))


;; (setq global-flycheck-mode t)
;; (after! global-flycheck-mode
;;   (setq lsp-ui t)
;;   (setq lsp-ui-mode :enabled))
(after! side-hustle
  (setq side-hustle-display-alist
        '((side . right)
          (slot . 0)
          (window-width . 40))))

(global-set-key (kbd "C-c o i") 'side-hustle-toggle)

(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("ruff" "server" "--preview"))
                    :major-modes '(python-mode)
                    :priority 1
                    :add-on? t
                    :multi-root t
                    :server-id 'ruff-server)
   )
  )

;; (setq! lsp-disabled-clients '(python-mode . (ruff-lsp)))
(use-package! apheleia
  :config
  (setf (alist-get 'python-mode apheleia-mode-alist)
        '(ruff-isort ruff))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist)
        '(ruff-isort ruff))
  :hook
  ((python-ts-mode yaml-ts-mode c-ts-mode c++-ts-mode toml-ts-mode) . indent-bars-mode) . (apheleia-mode))


(solaire-global-mode +1)


(defun my--init-nim-mode ()
  "Local init function for `nim-mode'."

  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))

  ;; If you want to experiment, you can enable the following modes by
  ;; uncommenting their line.
  ;; (nimsuggest-mode 1)
  ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
  (flycheck-mode 1)
  ;; (flymake-mode 1)

  ;; The following modes are disabled for Nim files just for the case
  ;; that they are enabled globally.
  ;; Anything that is based on smie can cause problems.
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)

(add-hook 'nim-mode-hook 'my--init-nim-mode)
(add-hook 'after-init-hook 'global-color-identifiers-mode)
(setq color-identifiers:recoloring-delay 0.5)
(setq color-identifiers:extra-face-attributes '(:weight bold))
;; (with-eval-after-load 'solaire-mode
;;   (add-to-list 'solaire-mode-themes-to-face-swap 'doom-tokyo-night))
;; When idle for 15sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))
