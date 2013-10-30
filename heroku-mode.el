;;; heroku-mode.el --- creates key bindings for various commands for the Heroku command-line tool

;; Version 0.0.1

(define-minor-mode heroku-mode
  "A mode to improve workflow with the heroku command line tool"
  :version "0.0.1")

;; Heroku tool commands

(defun heroku-mode-open()
  "Opens default app homepage on default web browser"
  (interactive)
  (shell-command "heroku open")
)

(defun heroku-mode-push()
  "Deploys app to Heroku"
  (interactive)
  (shell-command "git push heroku master")
)

;; Keybindings for the above Heroku commands in elisp
;; Did not start with most intuitive prefix C-h since this is reserved for help in emacs
(global-set-key (kbd "C-c o") 'heroku-mode-open)
(global-set-key (kbd "C-c p") 'heroku-mode-push)



