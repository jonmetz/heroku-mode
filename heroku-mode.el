;;; heroku-mode.el --- creates key bindings for various commands for the Heroku command-line tool

;; Version 0.0.1

;; I'm completely open to changing any of these keybindings based on convenience 
;; due to certain commands being more frequently used than others.

(defvar heroku-mode-keymap (make-keymap) "heroku-mode keymap.")
(define-key heroku-mode-keymap (kbd "C-c o") 'heroku-mode-open)
(define-key heroku-mode-keymap (kbd "C-c p") 'heroku-mode-push)
(define-key heroku-mode-keymap (kbd "C-c s") 'heroku-mode-set-app)

;; Machine Generated
(define-key heroku-mode-keymap (kbd "C-c A") 'heroku-mode-addons)
(define-key heroku-mode-keymap (kbd "C-c P") 'heroku-mode-apps)
(define-key heroku-mode-keymap (kbd "C-c u") 'heroku-mode-auth)
(define-key heroku-mode-keymap (kbd "C-c C") 'heroku-mode-config)
(define-key heroku-mode-keymap (kbd "C-c d") 'heroku-mode-domains)
(define-key heroku-mode-keymap (kbd "C-c L") 'heroku-mode-logs)
(define-key heroku-mode-keymap (kbd "C-c S") 'heroku-mode-ps)
(define-key heroku-mode-keymap (kbd "C-c r") 'heroku-mode-releases)
(define-key heroku-mode-keymap (kbd "C-c R") 'heroku-mode-run)
(define-key heroku-mode-keymap (kbd "C-c h") 'heroku-mode-sharing)
(define-key heroku-mode-keymap (kbd "C-c O") 'heroku-mode-account)
(define-key heroku-mode-keymap (kbd "C-c e") 'heroku-mode-certs)
(define-key heroku-mode-keymap (kbd "C-c D") 'heroku-mode-drains)
(define-key heroku-mode-keymap (kbd "C-c f") 'heroku-mode-fork)
(define-key heroku-mode-keymap (kbd "C-c g") 'heroku-mode-git)
(define-key heroku-mode-keymap (kbd "C-c H") 'heroku-mode-help)
(define-key heroku-mode-keymap (kbd "C-c k") 'heroku-mode-keys)
(define-key heroku-mode-keymap (kbd "C-c b") 'heroku-mode-labs)
(define-key heroku-mode-keymap (kbd "C-c m") 'heroku-mode-maintenance)
(define-key heroku-mode-keymap (kbd "C-c G") 'heroku-mode-pg)
(define-key heroku-mode-keymap (kbd "C-c B") 'heroku-mode-pgbackups)
(define-key heroku-mode-keymap (kbd "C-c U") 'heroku-mode-plugins)
(define-key heroku-mode-keymap (kbd "C-c E") 'heroku-mode-regions)
(define-key heroku-mode-keymap (kbd "C-c t") 'heroku-mode-stack)
(define-key heroku-mode-keymap (kbd "C-c T") 'heroku-mode-status)
(define-key heroku-mode-keymap (kbd "C-c y") 'heroku-mode-update)
(define-key heroku-mode-keymap (kbd "C-c v") 'heroku-mode-version)

(define-minor-mode heroku-mode
  "A mode to improve workflow with the heroku command line tool"
  :version "0.0.1"
;; Keybindings for the above Heroku commands in elisp
;; Did not start with most intuitive prefix (C-h) since this is reserved for help in emacs.
  :keymap heroku-mode-keymap)
;; Set app to "" if not specified (Heroku will use an app declared in current directory
(setq heroku-mode-app "")

(defun heroku-mode-execute (cmd)
	 (if (not (string-equal heroku-mode-app ""))
	     (shell-command (format "heroku %s --app %s" cmd heroku-mode-app))
	   (shell-command (format "heroku %s" cmd))))

(defun heroku-mode-set-app(app-name)
  "Set the name of the app with which all other functions will be called"
  (interactive "sEnter app's name: ")
  (setq heroku-mode-app (format "%s" app-name)))

;; Heroku tool commands

(defun heroku-mode-open()
  "Opens default app homepage on default web browser"
  (interactive)
  (heroku-mode-execute "open"))

(defun heroku-mode-push()
  "Deploys app to Heroku"
  (interactive)
  (shell-command "git push heroku master"))

(defun heroku-mode-fork(&optional arg)
  "clone an existing app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "fork %s" arg))
    (heroku-mode-execute "fork")))

(defun heroku-mode-help(&optional arg)
  "list commands and display help"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "help %s" arg))
    (heroku-mode-execute "help")))

;; Added in manually due to bug in heroku_gen
(defun heroku-mode-version()
  "Check version of heroku commandline tool"
  (interactive)
  (heroku-mode-execute "version"))

;; Machine-generated functions, followed by their keybindings, created by heroku_mode_gen.py

(defun heroku-mode-logs()
  "display logs for an app"
  (interactive)
  (heroku-mode-execute "logs"))

(defun heroku-mode-regions()
  "list available regions"
  (interactive)
  (heroku-mode-execute "regions"))

(defun heroku-mode-status()
  "check status of heroku platform"
  (interactive)
  (heroku-mode-execute "status"))

(defun heroku-mode-addons(&optional arg)
  "manage addon resources"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "addons:%s" arg))
    (heroku-mode-execute "addons")))

(defun heroku-mode-apps(&optional arg)
  "manage apps (create, destroy)"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "apps:%s" arg))
    (heroku-mode-execute "apps")))

(defun heroku-mode-auth(&optional arg)
  "authentication (login, logout)"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "auth:%s" arg))
    (heroku-mode-execute "auth")))

(defun heroku-mode-config(&optional arg)
  "manage app config vars"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "config:%s" arg))
    (heroku-mode-execute "config")))

(defun heroku-mode-domains(&optional arg)
  "manage custom domains"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "domains:%s" arg))
    (heroku-mode-execute "domains")))

(defun heroku-mode-ps(&optional arg)
  "manage dynos (dynos, workers)"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "ps:%s" arg))
    (heroku-mode-execute "ps")))

(defun heroku-mode-releases(&optional arg)
  "manage app releases"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "releases:%s" arg))
    (heroku-mode-execute "releases")))

(defun heroku-mode-run(&optional arg)
  "run one-off commands (console, rake)"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "run:%s" arg))
    (heroku-mode-execute "run")))

(defun heroku-mode-sharing(&optional arg)
  "manage collaborators on an app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "sharing:%s" arg))
    (heroku-mode-execute "sharing")))

(defun heroku-mode-account(&optional arg)
  "manage heroku account options"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "account:%s" arg))
    (heroku-mode-execute "account")))

(defun heroku-mode-certs(&optional arg)
  "manage ssl endpoints for an app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "certs:%s" arg))
    (heroku-mode-execute "certs")))

(defun heroku-mode-drains(&optional arg)
  "display syslog drains for an app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "drains:%s" arg))
    (heroku-mode-execute "drains")))

(defun heroku-mode-git(&optional arg)
  "manage git for apps"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "git:%s" arg))
    (heroku-mode-execute "git")))

(defun heroku-mode-keys(&optional arg)
  "manage authentication keys"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "keys:%s" arg))
    (heroku-mode-execute "keys")))

(defun heroku-mode-labs(&optional arg)
  "manage optional features"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "labs:%s" arg))
    (heroku-mode-execute "labs")))

(defun heroku-mode-maintenance(&optional arg)
  "manage maintenance mode for an app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "maintenance:%s" arg))
    (heroku-mode-execute "maintenance")))

(defun heroku-mode-pg(&optional arg)
  "manage heroku-postgresql databases"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "pg:%s" arg))
    (heroku-mode-execute "pg")))

(defun heroku-mode-pgbackups(&optional arg)
  "manage backups of heroku postgresql databases"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "pgbackups:%s" arg))
    (heroku-mode-execute "pgbackups")))

(defun heroku-mode-plugins(&optional arg)
  "manage plugins to the heroku gem"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "plugins:%s" arg))
    (heroku-mode-execute "plugins")))

(defun heroku-mode-stack(&optional arg)
  "manage the stack for an app"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "stack:%s" arg))
    (heroku-mode-execute "stack")))

(defun heroku-mode-update(&optional arg)
  "update the heroku client"
  (interactive "sEnter option(s) and any necessary arguments: ")
  (if (not (equal arg ""))
      (heroku-mode-execute(format "update:%s" arg))
    (heroku-mode-execute "update")))

(provide 'heroku-mode)
