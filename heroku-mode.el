;;; heroku-mode.el --- creates key bindings for various commands for the Heroku command-line tool

;; Version 0.0.1

(define-minor-mode heroku-mode
  "A mode to improve workflow with the heroku command line tool"
  :version "0.0.1")

;; Set app to "" if not specified
(setq heroku-mode-app "")

;; Heroku tool commands

(defun heroku-mode-open()
  "Opens default app homepage on default web browser"
  (interactive)
  (heroku-mode-execute "open"))

(defun heroku-mode-push()
  "Deploys app to Heroku"
  (interactive)
  (shell-command "git push heroku master"))

(defun heroku-mode-execute (cmd)
	 (if (not (string-equal heroku-mode-app ""))
	     (shell-command (format "heroku %s --app %s" cmd heroku-mode-app))
	   (shell-command (format "heroku %s" cmd))))

(defun heroku-mode-set-app(app-name)
  "Set the name of the app with which all other functions will be called"
  (interactive "sEnter app's name: ")
  (setq heroku-mode-app (format "%s" app-name)))

;; Keybindings for the above Heroku commands in elisp
;; Did not start with most intuitive prefix C-h since this is reserved for help in emacs
(global-set-key (kbd "C-c o") 'heroku-mode-open)
(global-set-key (kbd "C-c p") 'heroku-mode-push)



