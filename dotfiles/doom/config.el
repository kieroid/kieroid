;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; gpg related stuffs
(setq user-full-name "Kieran Lavato"
      user-mail-address "kieranlavato@gmail.com")

;; theme related stuffs
(setq doom-theme 'doom-homage-black)
(setq fancy-splash-image "/home/kiki/.config/emacs/emacs.png")
(setq confirm-kill-emacs nil)

;; vterm/shell related stuffs
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "fish")
(setq-default explicit-shell-file-name "fish")

;; something regarding line numbers. i forgot what this was.
(setq display-line-numbers-type t)

;; default directories
(setq default-directory "/home/kiki" )
(setq org-directory "/home/kiki/Repositories/1st-party/notes")

;; LaTeX preview
(after! org (add-hook 'after-save-hook #'org-latex-preview))

;; elcord
(require 'elcord)
(elcord-mode)
(setq elcord-editor-icon "emacs_icon") ;; makes it emac

;; auto-start neotree
(add-hook 'window-setup-hook #'neotree 'append)

;; easy copy and paste
(global-set-key (kbd "C-S-c") 'kill-ring-save) ;; copy
(global-set-key (kbd "C-S-v") 'yank) ;; paste
(global-set-key (kbd "C-S-x") 'kill-region) ;; cut

;; undo and redo
(global-set-key (kbd "C-S-z") 'undo) ;; undo
(global-set-key (kbd "C-S-y") 'undo-redo) ;; redo

(defun my/org-export-to-html-on-save ()
  "Export the current Org file to HTML and save it in the 'html_output' subdirectory."
  (when (eq major-mode 'org-mode)
    (let* ((output-dir "html_output")
           (output-path (expand-file-name
                         (concat output-dir "/"
                                 (file-name-base (buffer-file-name)) ".html"))))
      ;; Create the output directory if it doesn't exist
      (unless (file-exists-p output-dir)
        (make-directory output-dir))
      ;; Export to HTML
      (org-html-export-to-html)
      ;; Move the generated file to the output directory
      (rename-file (concat (file-name-base (buffer-file-name)) ".html")
                   output-path
                   t))))

;; Add the function to `after-save-hook` in Org mode
(add-hook 'after-save-hook 'my/org-export-to-html-on-save)

