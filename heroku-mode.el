;;; heroku-mode.el --- creates key bindings for various commands for the Heroku command-line tool

;; Version 0.0.1

(define-minor-mode heroku-mode
  "A mode to improve workflow with the heroku command line tool"
  :version "0.0.1"
;; Keybindings for the above Heroku commands in elisp
;; Did not start with most intuitive prefix (C-h) since this is reserved for help in emacs.
  :keymap (let ((map (make-sparse-keymap)))	    
            (define-key map (kbd "C-c o") 'heroku-mode-open)
	    (global-set-key (kbd "C-c p") 'heroku-mode-push)
	    (global-set-key (kbd "C-c s") 'heroku-mode-set-app)
	    ;; Keybindings from here on are machine generated
	    (define-key map (kbd "C-c A") 'heroku-mode-addons)
	    (define-key map (kbd "C-c P") 'heroku-mode-apps)
	    (define-key map (kbd "C-c u") 'heroku-mode-auth)
	    (define-key map (kbd "C-c C") 'heroku-mode-config)
	    (define-key map (kbd "C-c d") 'heroku-mode-domains)
	    (define-key map (kbd "C-c L") 'heroku-mode-logs)
	    (define-key map (kbd "C-c S") 'heroku-mode-ps)
	    (define-key map (kbd "C-c r") 'heroku-mode-releases)
	    (define-key map (kbd "C-c R") 'heroku-mode-run)
	    (define-key map (kbd "C-c h") 'heroku-mode-sharing)
	    (define-key map (kbd "C-c O") 'heroku-mode-account)
	    (define-key map (kbd "C-c e") 'heroku-mode-certs)
	    (define-key map (kbd "C-c D") 'heroku-mode-drains)
	    (define-key map (kbd "C-c f") 'heroku-mode-fork)
	    (define-key map (kbd "C-c g") 'heroku-mode-git)
	    (define-key map (kbd "C-c H") 'heroku-mode-help)
	    (define-key map (kbd "C-c k") 'heroku-mode-keys)
	    (define-key map (kbd "C-c b") 'heroku-mode-labs)
	    (define-key map (kbd "C-c m") 'heroku-mode-maintenance)
	    (define-key map (kbd "C-c G") 'heroku-mode-pg)
	    (define-key map (kbd "C-c B") 'heroku-mode-pgbackups)
	    (define-key map (kbd "C-c U") 'heroku-mode-plugins)
	    (define-key map (kbd "C-c E") 'heroku-mode-regions)
	    (define-key map (kbd "C-c t") 'heroku-mode-stack)
	    (define-key map (kbd "C-c T") 'heroku-mode-status)
	    (define-key map (kbd "C-c y") 'heroku-mode-update)
	    (define-key map (kbd "C-c v") 'heroku-mode-version)
            map))

;; Set app to "" if not specified (Heroku will use an app declared in current directory
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

;; Machine-generated functions, followed by their keybindings, created by heroku_mode_gen.py

(defun heroku-mode-logs()
  "display logs for an app"
  (interactive)
  (heroku-mode-execute "logs"))

(defun heroku-mode-fork()
  "clone an existing app"
  (interactive)
  (heroku-mode-execute "fork"))

(defun heroku-mode-help()
  "list commands and display help"
  (interactive)
  (heroku-mode-execute "help"))

(defun heroku-mode-regions()
  "list available regions"
  (interactive)
  (heroku-mode-execute "regions"))

(defun heroku-mode-status()
  "check status of heroku platform"
  (interactive)
  (heroku-mode-execute "status"))

;; Added in manually
(defun heroku-mode-version()
  "Check version of heroku commandline tool"
  (interactive)
  (heroku-mode-execute "version"))

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

;; I'm completely open to changing any of these keybindings based on convenience 
;; due to certain commands being more frequently used than others.

(provide 'heroku-mode)
