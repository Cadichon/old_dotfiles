;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     selectric
     asm
     ;; git
     ;; markdown
     ;; org
     (shell :variables
            shell-default-height 20
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     python
     ;; version-control
     (c-c++ :variables c-c++-enable-clang-support t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Soures Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:enabled-for-modes prog-mode text-mode)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  (setq linum-format "%4d \u2502")
  (setq-default evil-escape-key-sequence "jk")
  (add-hook 'c-mode-hook
            (lambda ()
              (setq-default indent-tabs-mode t
                            tab-width 8
                            c-basic-offset 8)
              (setq indent-tabs-mode t
                    tab-width 8
                    c-basic-offset 8)
              )
            )
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq-default indent-tabs-mode t
                            tab-width 8
                            c-basic-offset 8)
              (setq indent-tabs-mode t
                    tab-width 8
                    c-basic-offset 8)
              )
            )
	(add-hook 'python-mode-hook
            (lambda ()
              (setq-default indent-tabs-mode nil
                            python-indent-offset 4)
              (setq indent-tabs-mode nil
                    python-indent-offset 4)
              )
            )
    (global-set-key	"" 'std-file-feheader)

  (setq header-epitech		"EPITECH PROJECT, "
        header-description	"File description:")

  (setq std-c-alist               '( (cs . "/*") (cc . "** ") (ce . "*/") )
        std-css-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
        std-cpp-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
        std-pov-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
        std-java-alist            '( (cs . "//") (cc . "// ") (ce . "//") )
        std-latex-alist           '( (cs . "%%") (cc . "%% ") (ce . "%%") )
        std-lisp-alist            '( (cs . ";;") (cc . ";; ") (ce . ";;") )
        std-xdefault-alist        '( (cs . "!!") (cc . "!! ") (ce . "!!") )
        std-pascal-alist          '( (cs . "{ ") (cc . "   ") (ce . "}" ) )
        std-makefile-alist        '( (cs . "##") (cc . "## ") (ce . "##") )
        std-text-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
        std-fundamental-alist     '( (cs . "  ") (cc . "   ") (ce . "  ") )
        std-html-alist            '( (cs . "<!--") (cc . "  -- ") (ce . "-->"))
        std-php-alist		'( (cs . "#!/usr/local/bin/php\n<?php") (cc . "// ")(ce . "//"))
        std-nroff-alist           '( (cs . "\\\"") (cc . "\\\" ") (ce . "\\\""))
        std-sscript-alist         '( (cs . "#!/bin/sh")  (cc . "## ") (ce . "##"))
        std-perl-alist            '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
        std-cperl-alist           '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
        )

  (setq std-modes-alist '(("C"                    . std-c-alist)
                          ("C/l"                  . std-c-alist)
                          ("CSS"                  . std-c-alist)
                          ("PoV"                  . std-pov-alist)
                          ("C++"                  . std-cpp-alist)
                          ("C++/l"                . std-cpp-alist)
                          ("Lisp"                 . std-lisp-alist)
                          ("Lisp Interaction"     . std-lisp-alist)
                          ("Emacs-Lisp"           . std-lisp-alist)
                          ("Fundamental"          . std-fundamental-alist)
                          ("Shell-script"         . std-sscript-alist)
                          ("Makefile"             . std-makefile-alist)
                          ("BSDmakefile"          . std-makefile-alist)
                          ("GNUmakefile"          . std-makefile-alist)
                          ("Perl"                 . std-cperl-alist)
                          ("CPerl"                . std-cperl-alist)
                          ("xdefault"             . std-xdefault-alist)
                          ("java"                 . std-java-alist)
                          ("latex"                . std-latex-alist)
                          ("Pascal"               . stdp-ascal-alist)
                          ("Text"                 . std-text-alist)
                          ("HTML"                 . std-html-alist)
                          ("PHP"                 . std-php-alist)
                          ("Nroff"                . std-nroff-alist)
                          ("TeX"                  . std-latex-alist)
                          ("LaTeX"                . std-latex-alist))
        )

  (defun std-get (a)
    (interactive)
    (cdr (assoc a (eval (cdr (assoc mode-name std-modes-alist)))))
    )

  (defun std-file-header ()
    "Puts a standard header at the beginning of the file.\n(According to mode)"
    (interactive)
    (goto-char (point-min))
    (let ((projname "toto")(projdescription "tiuti"))
      (setq projname (read-from-minibuffer
                      (format "Type project name (RETURN to quit) : ")))
      (setq projdescription (read-from-minibuffer
                             (format "Type short file description (RETURN to quit) : ")))

      (insert-string (std-get 'cs))
      (newline)
      (insert-string (concat (std-get 'cc)
                             header-epitech
                             (format-time-string "%Y")))
      (newline)
      (insert-string (concat (std-get 'cc)
                             projname))
      (newline)
      (insert-string (concat (std-get 'cc)
                             header-description))
      (newline)
      (insert-string (concat (std-get 'cc)
                             projdescription))
      (newline)
      (insert-string (std-get 'ce))
      (newline)
      (newline)))

  (defun insert-std-vertical-comments ()
    "Inserts vertical comments (according to mode)."
    (interactive)
    (beginning-of-line)
    (insert-string (std-get 'cs))
    (newline)
    (let ((ok t)(comment ""))
      (while ok
        (setq comment (read-from-minibuffer
                       (format "Type comment (RETURN to quit) : ")))
        (if (= 0 (length comment))
            (setq ok nil)
          (progn
            (insert-string (concat (std-get 'cc) comment))
            (newline)))))
    (insert-string (std-get 'ce))
    (newline))

  (defun std-toggle-comment ()
    "Toggles line comment on or off (according to mode)."
    (interactive)
    (save-excursion
      (let (beg end)
        (beginning-of-line)
        (setq beg (point))
        (end-of-line)
        (setq end (point))
        (save-restriction
          (if (not (equal beg end))
              (progn
                (narrow-to-region beg end)
                (goto-char beg)
                (if (search-forward (std-get 'cs) end t)
                    (progn
                      (beginning-of-line)
                      (replace-string (std-get 'cs) "")
                      (replace-string (std-get 'ce) ""))
                  (progn
                    (beginning-of-line)
                    (insert-string (std-get 'cs))
                    (end-of-line)
                    (insert-string (std-get 'ce))))))))) 
    ;;  (indent-according-to-mode)
    (indent-for-tab-command)
    (next-line 1))

;;; Added by Eole Wednesday May 29 2002,  1:33:55
;;; Extended bindings for this package and for commenting code

  (global-set-key "h" 'update-std-header)
  (global-set-key "" 'std-file-header)

;;;; Generating local keymaps for exotics modes.

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
  (add-hook 'cperl-mode-hook
            '(lambda ()
               (define-key cperl-mode-map ""
                 'comment-region)
               (define-key cperl-mode-map "h"
                 'std-file-header)))

;; for perl-mode
  (add-hook 'perl-mode-hook
            '(lambda ()
               (define-key perl-mode-map ""
                 'comment-region)))

;; for all kind of lisp code
  (add-hook 'emacs-lisp-mode-hook
            '(lambda ()
               (define-key emacs-lisp-mode-map  ""
                 'comment-region)))

  (add-hook 'lisp-mode-hook
            '(lambda ()
               (define-key lisp-mode-map  ""
                 'comment-region)))

;; for La(TeX)-mode
  (add-hook 'tex-mode-hook
            '(lambda ()
               (define-key tex-mode-map ""
                 'comment-region)))
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xterm-color x86-lookup shell-pop nasm-mode multi-term eshell-z eshell-prompt-extras esh-help selectric-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet fuzzy company-statistics company-c-headers company auto-yasnippet yasnippet ac-ispell auto-complete disaster cmake-mode clang-format ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
