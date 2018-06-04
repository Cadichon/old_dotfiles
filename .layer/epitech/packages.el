;;; packages.el --- epitech layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Cadichon <cadichon@Cadibian>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `epitech-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `epitech/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `epitech/pre-init-PACKAGE' and/or
;;   `epitech/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

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
			("PHP"                  . std-php-alist)
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

(defconst epitech-packages
  '()
  "The list of Lisp packages required by the epitech layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here
