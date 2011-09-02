;; disable the startup page
(setq inhibit-startup-message t)
;(setq initial-buffer-choice t)

;; set the *strach* buffer text
(setq initial-scratch-message ";; Emacs\t;; Evenings\n;; Makes\t;; Mornings,\n;; A\t\t;; And a\n;; Computer\t;; Couple of\n;; Slow\t\t;; Saturdays\n\n")

;; let the title show the buffer name
(setq frame-title-format "emacs@%b")

;; avoid the mouse overlap the cursor
(mouse-avoidance-mode 'animate)

;; bind c-w to kill-backward word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; set another key binding to extended method
(global-set-key "\C-x\C-m" 'execute-extended-command)

;; set register to .emacs
(set-register ?e '(file . "~/.emacs"))

;; set register to hot project
(set-register ?h '(file . "~/Projects/Weego/lib/"))

;; set register to wiki
(set-register ?i '(file . "~/Projects/mfight.github.com/index.muse"))

;;set register to the word-list
(set-register ?w '(file . "~/Projects/mfight.github.com/word_list.muse"))

(add-to-list 'load-path "~/emacs-23.3/lispext/")
(require 'qml-mode)

(setq auto-mode-alist (cons '("\\.qml$" . js-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
;; enable ac in muse mode
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'muse-mode))

;; cedet
;;(add-to-list 'load-path "~/emacs-23.3/lisp_ext/cedet/common/")
;;(require 'cedet)
;;(require 'semantic-ia)

;; Enable EDE features
;;(global-ede-mode 1)

;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)

;; Enable SRecode minor-mode.
;;(global-srecode-minor-mode 1)

;;Yasnippet bundle
;;(add-to-list 'load-path "~/.emacs.d/plugins")
;;(require 'yasnippet-bundle)

;; switch h and cpp
;;(require 'eassist nil 'noerror)
;;(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

;; CEDET speed bar
;;(global-set-key [(f5)] 'speedbar)

;;compile
;;(define-key c-mode-base-map [(f7)] 'compile)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/package/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/package/yasnippet-0.6.1c/snippets")


;;swich h/cpp
(defun switch-source-file ()
  (interactive)
  (setq file-name (buffer-file-name))
  (if (string-match "\\.cpp" file-name)
      (find-file (replace-regexp-in-string "\\.cpp" ".h" file-name)))
  (if (string-match "\\.h" file-name)
      (find-file (replace-regexp-in-string "\\.h" ".cpp" file-name))))
(global-set-key [M-f12] 'switch-source-file)

;;(add-to-list 'yas/skip-and-clear-key "C-a")

;; ibus
(add-to-list 'load-path "~/.emacs.d/plugins/ibus-el-0.2.1")
(require 'ibus)
 ;; Turn on ibus-mode automatically after loading .emacs
 (add-hook 'after-init-hook 'ibus-mode-on)
 ;; Use C-SPC for Set Mark command
 (ibus-define-common-key ?\C-\s nil)
 ;; Use C-/ for Undo command
 (ibus-define-common-key ?\C-/ nil)
 ;; Change cursor color depending on IBus status
 ;;(setq ibus-cursor-color '("red" "blue" "limegreen"))

;; use C-; to toggle IBus
(global-set-key [(control ?;)] 'ibus-toggle)
;; Enable C-; key only for preediting
(ibus-define-common-key [(control ?;)] nil)
(ibus-define-preedit-key [(control ?;)] t)

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; set the org-agenda-files
(setq org-agenda-files
      (list "~/Projects/Weego/schedule.org"))

;; ecb
;;(add-to-list 'load-path "~/.emacs.d/plugins/ecb-snap/")
;;(require 'ecb)

;;muse
(add-to-list 'load-path "~/.emacs.d/package/muse-3.20/lisp/")
(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)
(require 'muse-project)

(setq my-style-sheet
      (concat "<link rel=\"stylesheet\" type=\"text/css\""
	      " charset=\"utf-8\" media=\"all\""
	      " href=\"style.css\" />"
	      " <script type=\"text/javascript\">"
	      " var _gaq = _gaq || [];"
	      "_gaq.push(['_setAccount', 'UA-25182468-1']);"
	      "_gaq.push(['_trackPageview']);"
	      " (function() {"
	      " var ga = document.createElement('script'); "
	      "ga.type = 'text/javascript'; ga.async = true;"
	      "ga.src = ('https:' == document.location.protocol ?"
	      " 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';"
	      "var s = document.getElementsByTagName('script')[0];"
	      "s.parentNode.insertBefore(ga, s);"
	      "})();"	      
	      "</script>"))

(setq muse-html-footer "~/Projects/mfight.github.com/muse-html-footer.html")

(muse-derive-style "my-html" "xhtml"
		   :footer 'muse-html-footer
		   :style-sheet my-style-sheet)
(setq muse-project-alist
      '(("Website" ("~/Projects/mfight.github.com/" :default "index")
	 (:base "my-html" :path  "~/Projects/mfight.github.com/public_html"))))

(defun ywb/muse-publish-strip-tags (string)
(while (string-match "<.*?>" string)
(setq string (replace-match "" nil t string)))
string)
(defadvice muse-publish-contents-tag (around ywb activate)
(let* ((beg (ad-get-arg 0))
(end (ad-get-arg 1))
(attrs (ad-get-arg 2))
(max-depth (let ((depth (cdr (assoc "depth" attrs))))
(or (and depth (string-to-int depth)) 3)))
(index 1)
base contents l)
(save-excursion
(catch 'done
(while (re-search-forward "^\\(\\*+\\)\\s-+\\(.+\\)" nil t)
(setq l (length (match-string 1)))
(if (null base)
(setq base l)
(if (< l base)
(throw 'done t)))
(when (<= l max-depth)
(setq contents (cons (cons l (match-string-no-properties 2))
contents))
(goto-char (match-beginning 2))
(muse-html-insert-anchor (concat "sec" (int-to-string index)))
(delete-backward-char 1)
(setq index (1+ index))))))
(setq index 1 contents (reverse contents))
(let ((depth 1) (sub-open 0) (p (point)))
(insert "<div class=\"mulu\">
<h6 class=\"mulu\">Contents</h6>\n")
(insert "<dl class=\"contents\">\n")
(while contents
(insert "<dt class=\"contents\">\n")
(insert "<a href=\"#sec" (int-to-string index) "\">"
(ywb/muse-publish-strip-tags (cdar contents))
"</a>\n")
(setq index (1+ index))
(insert "</dt>\n")
(setq depth (caar contents)
contents (cdr contents))
(if contents
(cond
((< (caar contents) depth)
(let ((idx (caar contents)))
(while (< idx depth)
(insert "</dl>\n</dd>\n")
(setq sub-open (1- sub-open)
idx (1+ idx)))))
((> (caar contents) depth) ; can't jump more than one ahead
(insert "<dd>\n<dl class=\"contents\">\n")
(setq sub-open (1+ sub-open))))))
(while (> sub-open 0)
(insert "</dl>\n</dd>\n")
(setq sub-open (1- sub-open)))
(insert "</dl>\n")
(insert "</div>\n")
(put-text-property p (point) 'read-only t))))

;; ido
;;(add-to-list 'load-path "~/.emacs.d/plugins/")
;;(require 'ido)
;;(ido-mode t)

;; C-c C-w 复制整行, 而"C-u 5 C-c w"复制 5 行

(global-set-key (kbd "C-,") 'copy-lines)

(defun copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))
    )
  )

