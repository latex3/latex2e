;;; latexbug.el
;;;
;;; Version 0: `test of concept' 
;;;            Don't look to closely at my lisp coding style...
;;;
;;;            David Carlisle
;;;                            Version 0.1 1994/11/23
;;;                            Version 0.2 1994/12/12
;;;                            Version 0.3 1995/03/17
;;;                            Version 0.4 1995/09/21
;;;                            Version 0.5 1995/10/17
;;;                            Version 0.6 1997/07/16
;;;                            Version 0.7 1997/12/17
;;;                            Version 0.8 1999/01/07
;;;
;;;
;;; LOADING
;;;;;;;;;;;
;;;
;;; To use this code, place the file in a directory searched by lisp
;;; Add
;;;
;;; (autoload 'report-latex-bug "latexbug" 
;;;               "LaTeX bug report generator" t)
;;;
;;; to your .emacs file (without the ;;;).
;;;
;;; Then if the impossible happens and you discover a bug in LaTeX,
;;; or wish to suggest a change to LaTeX, type
;;; M-x report-latex-bug
;;;
;;; and follow the instructions.
;;;
;;; A file latexbug.cfg can be used to customise
;;; latexbug.tex as described in the comments in latexbug.tex.
;;; or you can customise in your .emacs, as shown below.
;;;
;;; CUSTOMISATION
;;;;;;;;;;;;;;;;;;
;;;
;;; The following variables may be set in your .emacs to customise this
;;; file.
;;;
;;; (setq ltxbug-name "David Carlisle") ; your name
;;; (setq ltxbug-address "dpc@,,,")     ; your email address
;;;       If these two are not set here, or in the latexbug.cfg
;;;       file. emacs will prompt for the values. The prompt
;;;       will suggest default values based on standard emacs variables
;;;       user-full-name and user-mail-address.
;;;
;;; (setq ltxbug-mail-headers "...") ; additional mail headers.
;;;        For example (setq ltxbug-mail-headers "FCC: ~/Mail/sent")
;;;        To log outgoing mail in a `sent' file.
;;; 
;;; (setq ltxbug-latex-command "...") ; latex command
;;;        Set this if LaTeX is not called latex, eg it may be latex2e.
;;;
;;;
;;; Perhaps I should have based this on gnat's send-pr.el but it seemed
;;; easier to write it from scratch to work in latexbug.tex at the
;;; required points.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'sendmail)

(defvar ltxbug-latex-command "latex"
 "Command name for Standard LaTeX (LaTeX2e)")

(defvar ltxbug-directory nil
"Directory in which to run LaTeX, should end with slash.
Default, nil, means inherit directory from current buffer.")

(defvar user-full-name nil); just needed on ancient emacs
(defvar ltxbug-name nil
"Your name.
If this is nil, will be prompted if not set in latexbug.cfg.")

(defvar user-mail-address nil); just needed on ancient emacs
(defvar ltxbug-address nil
"Your email-address.
If this is nil, will be prompted if not set in latexbug.cfg.")

(defvar ltxbug-mail-headers ""
"Extra mail headers that will be added to the mail message.
This is in addition to `To' and `Subject'.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar ltxbug-categories 
'(("latex") ("tools") ("graphics")
       ("mfnfss") ("psnfss")  ("amslatex") ("babel") ("expl3") ("cyrillic"))
"Valid GNATS categories")


(defun report-latex-bug ()
"LaTeX bug report generator"
  (interactive)
;;
;; Locally turn off transient mark mode.
  (let ((transient-mark-mode nil)
	(current-default-directory default-directory))
;;
;; First produce one large window for the main message
;; and a smaller help window below.
  (delete-other-windows)
;;  (setq ltxbug-msg (switch-to-buffer "*latex-bugs*")); not emacs18
  (switch-to-buffer 
       (setq ltxbug-msg (get-buffer-create "*latex-bugs*")))
  (erase-buffer)
  (setq default-directory 
       (or ltxbug-directory current-default-directory))
  (setq major-mode 'ltxbug)
  (setq mode-name "LaTeX Bug Report")
  (use-local-map ltxbug-map)      
  (message "Running latex on latexbug.tex ....")
  (split-window-vertically 
;; -13 ;; old emacs's can't do this
   (- (window-height) 13))
  (switch-to-buffer-other-window 
    (setq ltxbug-help (get-buffer-create "latexbugs help")))
;;
;; Initially fill the message buffer with the output from running
;; latexbug.tex.
  (erase-buffer)
;;
;; Use shell-command not start-process here so shell variables are
;; initialised before calling LaTeX.
;; Hope that is enough \\ to keep all the different shells happy...
;; {} replaced by \\{\\}  in version 0.4 (fix for latex/1675)
;; Use \@@input (v0.5)
   (shell-command (concat
               ltxbug-latex-command
       " \\\\nonstopmode\\\\makeatletter\
       \\\\def\\\\batch\\{\\}\\\\@@input latexbug ") t)   
  (switch-to-buffer-other-window ltxbug-msg)
  (goto-char (point-min))
;;
;; Change header to mention this latexbug.el file.
  (if (re-search-forward "!"  (point-max) t)
    (ltxbug-error)
;; else
    (ltxbug-do-report))))



(defun ltxbug-do-report ()
  (erase-buffer)
;;
;; Grab the template produced by latexbug.tex
  (insert-file "latexbug.msg")
;;
;; Change header to mention this latexbug.el file.
  (goto-char (point-min))
  (re-search-forward "\\(by latexbug.\\)\\(tex\\)" (point-max) t)
  (replace-match "\\1el")
;;
;; Grab email address into mail field.
  (re-search-forward "Re.*email to \\(.*\\)[^Z]*=$"  (point-max) t)
;;
;; Put the synopsis template into the Subject field.
;; Add the delimiter used by the mail-send function.
  (goto-char (point-min))
  (let ((temp 
    (concat "To: "
      (buffer-substring (match-beginning 1) (match-end 1)) "
Subject: < SYNOPSIS >
"
       ltxbug-mail-headers
       (if (not (equal "" ltxbug-mail-headers)) "
")
       "--text follows this line--
"       )))
;;
;; Remove the rest of the banner from latexbug.tex
  (goto-char (point-min))
  (delete-region (match-beginning 0)  (match-end 0))
;;
;; insert the mail headers
  (insert temp))
;;
;;
;; Get the required category using minibuffer completion.
  (set-buffer ltxbug-help)
  (erase-buffer)
  (insert "
Several categories of files are supported,
corresponding to directories in the standard LaTeX distribution:

  latex:    The `base' format, and standard classes only (base).
  tools:    Packages supported by the LaTeX3 project team (tools).
  graphics: The color and graphics packages (graphics).
  mfnfss:   Packages for using some MetaFont fonts (mfnfss).
  psnfss:   Packages for using PostScript fonts LaTeX (psnfss).
  amslatex: AMS supported Classes and Packages (amsfonts and amslatex).
  babel:    Packages supporting many different languages (babel).
  expl3:    Experimental packages for TeX programmers (expl3).
  cyrillic: Packages for using Cyrillic fonts (cyrillic).
")
  (let* ((completion-ignore-case t)
        (cat (completing-read "Which Category ? " 
           ltxbug-categories  nil t )))
    (set-buffer "*latex-bugs*")
    (ltxbug-replace "< CATEGORY >" (if (equal cat "") "latex" cat)))
;;
;; Get the synopsis, make sure it is non empty, and not too long.
  (set-buffer ltxbug-help)
  (erase-buffer)
  (insert "
 Please enter a One line Synopsis of the report.
 This should be < 50 characters.

 This text will be used as the mail header on all
 subsequent correspondence. Please use informative strings.
 For example:  \\mathit generates error in foobar environmenent
 rather than just `LaTeX Bug' or similar strings.
")
  (set-buffer ltxbug-msg)
  (let ((syn (read-from-minibuffer "Synopsis ? " )))
    (while (or (equal syn "") (> (length syn) 50))
      (setq syn 
        (read-from-minibuffer "Synopsis (0 < length < 50) ? " syn)))
    (set-buffer "*latex-bugs*")
    (ltxbug-replace "< SYNOPSIS >" syn))
;;
;; If latexbug.cfg has not already defined the name
;; grab it from minibuffer
  (goto-char (point-min))
  (if (re-search-forward "< ENTER YOUR NAME >" (point-max) t)
    (if ltxbug-name
      (ltxbug-replace "< ENTER YOUR NAME >" ltxbug-name)
;; else
      (set-buffer ltxbug-help)
      (erase-buffer)
      (insert "
 Please enter Your Name
")
      (set-buffer ltxbug-msg)
      (let ((temp (read-from-minibuffer "Your Name ? " user-full-name)))
        (set-buffer "*latex-bugs*")
        (ltxbug-replace "< ENTER YOUR NAME >" temp))))
;;
;; If latexbug.cfg has not already defined the email address
;; grab it from minibuffer
  (goto-char (point-min))
  (if (re-search-forward "< ENTER YOUR EMAIL ADDRESS >" (point-max) t)
    (if ltxbug-address
      (ltxbug-replace "< ENTER YOUR EMAIL ADDRESS >" ltxbug-address)
;; else
      (set-buffer ltxbug-help)
      (erase-buffer)
      (insert "
 Please enter Your email address.
")
      (set-buffer ltxbug-msg)
      (let ((temp (read-from-minibuffer "Your email address ? "
					user-mail-address)))
        (set-buffer "*latex-bugs*")
        (ltxbug-replace "< ENTER YOUR EMAIL ADDRESS >" temp))))
;;
;; Grab file name.
;; If this is empty, suggest changing the >Class
  (set-buffer ltxbug-help)
  (erase-buffer)
  (insert "
A bug report should be accompanied by a test file
and a the log that the test generates.

If a test file is not appropriate for this report
Just hit <return>

Otherwise please specify the file to include.
")
  (set-buffer ltxbug-msg)
  (let ((temp (read-file-name "Test file ? " nil "" t)))
    (if (equal temp "")
      (progn
        (ltxbug-update-field
         "Class"
          '(("sw-bug")("doc-bug")("change-request"))
           "
You have not offered a test file.

Perhaps that this is not a bug report.
The default class for messages is sw-bug.

Possible classes of messages are:
  sw-bug:          Message reporting a Bug in the software.
  doc-bug:         Message reporting an error in the documentation.
  change-request:  Message requesting a change to some LaTeX feature.")
       (re-search-forward ">How-to-repeat")
       (delete-region (match-beginning 0) (point-max)))
;; else
      (set-buffer ltxbug-msg)
      (ltxbug-replace " < TEST FILE HERE " "")
      (insert-file temp)
      (let ((lines 0))
        (while (re-search-forward "\n" (mark) t)
          (setq lines (+ lines 1)))
        (if (> lines 60)
          (progn
            (set-buffer ltxbug-help)
            (erase-buffer)
            (insert 
(format "%s%d%s" "
!!!!
Your test file is " lines " lines long!!!

Test files should be as short as possible, while still showing
the behaviour. Please try to keep the file below 60 lines.
"))
           (set-buffer ltxbug-msg))))
      (let* ((log1 
              (concat 
                (substring temp 0 (string-match "\\.[^\\.]*$" temp))
                ".log"))
            (log (read-file-name "Log file ? " "" log1 t  log1)))
         (if (equal log "")
           (message "WHY NO LOG ???")
           (ltxbug-replace " < LOG FROM TEST FILE HERE >" "")
           (insert-file log)))))
;;
;; Prompt for the message text.
  (set-buffer ltxbug-help)
  (erase-buffer)
  (insert "
Complete your bug report by giving the full descripition
below the  `Description of bug:' header.

There are other database fields you may wish to add,
type C-c C-f to change or add an additional field.

Once the report is complete, type C-c C-c to send the message.

A saved copy of the report will be in the file
latexbug.msg.
")
  (switch-to-buffer ltxbug-msg)
  (ltxbug-replace " < ENTER BUG REPORT HERE >" "")
  (auto-fill-mode 1)
  (setq fill-column 72))


(defun ltxbug-error ()
 (set-buffer ltxbug-help)
 (erase-buffer)
 (insert "
LaTeX did not succesfully produce a bug report template."))

(defun ltxbug-save-and-send ()
 (interactive)
 (write-file "latexbug.msg")
 (mail-send-and-exit nil))


(defun ltxbug-replace (a b)
 "Replace the regexp a by the string b everywhere in the current buffer"
  (goto-char (point-min))
  (while (re-search-forward a (point-max) t)
    (replace-match b t t)))

(defvar ltxbug-map (make-sparse-keymap)
  "Local keymap used in LaTeX bug buffer.")

(define-key ltxbug-map "\C-c\C-c"    'ltxbug-save-and-send)
(define-key ltxbug-map "\C-c\C-f"    'ltxbug-oneline-field)


(defun ltxbug-update-field (field  values help)
"Update FIELD using completion list VALUES and help text HELP.
 First entry in VALUES is the default."
  (interactive)
  (set-buffer ltxbug-help)
  (erase-buffer)
  (insert help)
  (goto-char (point-min))
  (set-buffer ltxbug-msg)
  (goto-char (point-min))
  (let ((temp ""))
    (if (re-search-forward 
          (concat"\n>" field ":\\( *\\)\\(.*\\)$") (point-max) t)
;; if field already there
      (progn
        (setq temp (buffer-substring (match-beginning 2) (match-end 2)))
        (delete-region  (match-beginning 1) (match-end 2)))
;; else
    (re-search-forward ">Category:.*$")
    (insert (concat "\n>" field ":")))
 (insert " ")
 (let ((temp2 
    (completing-read (concat field " ? ") values nil t temp)))
 (insert (if (equal temp2 "")
            (car(car values)) temp2)))))


(defun ltxbug-responsible ()
  (interactive)
  (ltxbug-update-field
    "Responsible"
;; Alphabetical order, which makes Alan the default...
    '(("alan")("chris")("david")("frank")("johannes")
      ("michael")("rainer"))
"
 You may set the >Responsible field to a particular person.
 **Do not do this unless you have very good reason.**
 We may not appreciate having jobs allocated to us in this way:-)
 The possible values are:
   alan     (Alan Jeffrey)
   chris    (Chris Rowley)
   david    (David Carlisle)
   frank    (Frank Mittelbach)
   johannes (Johannes Braams)
   michael  (Michael Downes)
   rainer   (Rainer Schoepf)
"))

(defun ltxbug-confidential ()
  (interactive)
  (ltxbug-update-field
    "Confidential" 
    '(("no")("yes"))
"
 You may set the >Confidential field to yes.

 The report database is publicly searchable.
 See bugs.txt for details.
 Reports marked Confidential will not be made public.
 Possible values:
   no   The default. Report may be made public.
   yes  Report should only be seen by LaTeX maintainers.
"))


(defun ltxbug-priority ()
  (interactive)
  (ltxbug-update-field
    "Priority"
    '(("low")("medium")("high"))
"
 Change the priority of the report from `high'
 Possible values:
   low
   medium
   high
"))

(defun ltxbug-severity ()
  (interactive)
  (ltxbug-update-field
    "Severity"
    '(("non-critical")("serious")("critical"))
"
 Classify the severity of the problem.'
 Possible values:
   non-critical
   serious
   critical
"))

(defun ltxbug-class ()
  (interactive)
  (ltxbug-update-field
    "Class"
    '(("sw-bug")("doc-bug")("change-request"))
"
 Classify the type of report.
 Possible values:
 sw-bug:         Message reporting a bug in the software.
 doc-bug:        Message reporting an error in the documentation.
 change-request: Message requesting a change to some LaTeX feature.
"))

(defun ltxbug-window-setup ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically -13)
  (switch-to-buffer-other-window ltxbug-help))

(defun ltxbug-oneline-field ()
  (interactive)
  (ltxbug-window-setup)
  (erase-buffer)
  (insert "
 You may wish to add or alter the following fields:
 Class          Class of this report.
 Confidential   Confidential (or not).
 Responsible    Assign to a member of the LaTeX maintenance team
 Severity       Severity of the bug.
 Priority       Priority of the report.
")
 (set-buffer ltxbug-msg)
  (let* ((completion-ignore-case t)
        (field (completing-read "Which field ? " 
         '(("Class")("Confidential")("Priority")("Severity")
            ("Responsible"))
         nil t)))
  (cond
   ((equal field "Class") (ltxbug-class))
   ((equal field "Confidential") (ltxbug-confidential))
   ((equal field "Responsible") (ltxbug-responsible))
   ((equal field "Severity") (ltxbug-severity))
   ((equal field "Priority") (ltxbug-priority)))))
