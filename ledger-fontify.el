;;; ledger-fontify.el --- Provide custom fontification for ledger-mode


;; Copyright (C) 2014 Craig P. Earls (enderw88 at gmail dot com)

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
;; MA 02110-1301 USA.

;;; Commentary:
;;  Font-lock-mode doesn't handle multiline syntax very well.  This
;;  code provides font lock that is sensitive to overall transaction
;;  states


;;; Code:

(require 'ledger-navigate)
(require 'ledger-regex)
(require 'ledger-state)

(defcustom ledger-fontify-xact-state-overrides nil
  "If t the highlight entire xact with state."
  :type 'boolean
  :group 'ledger)

(defun ledger-fontify-buffer-part (&optional beg end len)
  "Fontify buffer from BEG to END, length LEN."
  (save-excursion
    (unless beg (setq beg (point-min)))
    (unless end (setq end (point-max)))
    (goto-char beg)
    (beginning-of-line)
    (while (< (point) end)
      (cond ((or (looking-at ledger-xact-start-regex)
                 (looking-at "^[=~][[:blank:]]")
                 (looking-at ledger-posting-regex)
                 (looking-at ledger-recurring-line-regexp))
             (ledger-fontify-xact-at (point)))
            ((looking-at ledger-directive-start-regex)
             (let ((extents (ledger-navigate-find-element-extents (point))))
               (save-excursion
                 (font-lock-fontify-keywords-region (car extents) (cadr extents))))))
      (ledger-navigate-next-xact-or-directive))))

(defun ledger-fontify-xact-at (position)
  "Fontify the xact at POSITION."
  (interactive "d")
  (save-excursion
    (goto-char position)
    (let ((extents (ledger-navigate-find-element-extents position))
          (state (ledger-transaction-state)))
      (cond
       ((looking-at "^=[[:blank:]]")
        (ledger-fontify-set-face extents 'ledger-font-auto-xact-face))
       ((looking-at "^~[[:blank:]]")
        (ledger-fontify-set-face extents 'ledger-font-periodic-xact-face))
       ((and ledger-fontify-xact-state-overrides state)
        (cond ((eq state 'cleared)
               (ledger-fontify-set-face extents 'ledger-font-xact-cleared-face))
              ((eq state 'pending)
               (ledger-fontify-set-face extents 'ledger-font-xact-pending-face)))))
      (font-lock-fontify-keywords-region (car extents) (cadr extents)))))

(defun ledger-fontify-set-face (extents face)
  "Set the text in EXTENTS to FACE."
  (put-text-property (car extents) (cadr extents) 'face face))


(provide 'ledger-fontify)

;;; ledger-fontify.el ends here
