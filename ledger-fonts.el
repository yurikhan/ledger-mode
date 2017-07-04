;;; ledger-fonts.el --- Helper code for use with the "ledger" command-line tool

;; Copyright (C) 2003-2016 John Wiegley (johnw AT gnu DOT org)

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
;; All of the faces for ledger mode are defined here.

;;; Code:

(require 'ledger-regex)

(defgroup ledger-faces nil "Ledger mode highlighting" :group 'ledger)

(defface ledger-font-auto-xact-face
  `((t :foreground "orange" :weight normal))
  "Default face for automatic transactions"
  :group 'ledger-faces)

(defface ledger-font-periodic-xact-face
  `((t :foreground "green" :weight normal))
  "Default face for automatic transactions"
  :group 'ledger-faces)

(defface ledger-font-xact-cleared-face
  `((t :foreground "#AAAAAA" :weight normal))
  "Default face for cleared transaction"
  :group 'ledger-faces)

(defface ledger-font-xact-pending-face
  `((t :foreground "#444444" :weight normal))
  "Default face for pending transaction"
  :group 'ledger-faces)

(defface ledger-font-payee-uncleared-face
  `((t :foreground "#dc322f" :weight bold ))
  "Default face for Ledger"
  :group 'ledger-faces)

(defface ledger-font-payee-cleared-face
  `((t :inherit ledger-font-other-face))
  "Default face for cleared (*) payees"
  :group 'ledger-faces)

(defface ledger-font-payee-pending-face
  `((t :foreground "#F24B61" :weight normal))
  "Default face for pending (!) payees"
  :group 'ledger-faces)

(defface ledger-font-xact-highlight-face
  `((t :inherit ledger-occur-xact-face))
  "Default face for transaction under point"
  :group 'ledger-faces)

(defface ledger-font-pending-face
  `((t :foreground "#cb4b16" :weight normal ))
  "Default face for pending (!) transactions"
  :group 'ledger-faces)

(defface ledger-font-other-face
  `((t :foreground "#657b83" :weight normal))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-directive-face
  `((t :inherit font-lock-preprocessor-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-account-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-price-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-apply-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-alias-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-assert-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-bucket-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-C-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for C directive"
  :group 'ledger-faces)

(defface ledger-font-capture-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-check-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-commodity-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-D-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for D directive"
  :group 'ledger-faces)

(defface ledger-font-define-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-end-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-expr-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-fixed-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-include-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-N-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for N directive"
  :group 'ledger-faces)

(defface ledger-font-payee-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-tag-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-timeclock-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for timeclock I,i,O,o,b,h directives"
  :group 'ledger-faces)

(defface ledger-font-year-directive-face
  `((t :inherit ledger-font-directive-face))
  "Default face for other transactions"
  :group 'ledger-faces)

(defface ledger-font-posting-account-face
  `((t :foreground "#268bd2" ))
  "Face for Ledger accounts"
  :group 'ledger-faces)

(defface ledger-font-posting-account-cleared-face
  `((t :inherit ledger-font-other-face))
  "Face for Ledger accounts"
  :group 'ledger-faces)

(defface ledger-font-posting-amount-cleared-face
  `((t :inherit ledger-font-posting-account-cleared-face))
  "Face for Ledger accounts"
  :group 'ledger-faces)

(defface ledger-font-posting-account-pending-face
  `((t :inherit ledger-font-pending-face))
  "Face for Ledger accounts"
  :group 'ledger-faces)

(defface ledger-font-posting-amount-pending-face
  `((t :inherit ledger-font-posting-account-pending-face))
  "Face for Ledger accounts"
  :group 'ledger-faces)

(defface ledger-font-posting-amount-face
  `((t :foreground "#cb4b16" ))
  "Face for Ledger amounts"
  :group 'ledger-faces)

(defface ledger-font-posting-date-face
  `((t :foreground "#cb4b16" ))
  "Face for Ledger dates"
  :group 'ledger-faces)

(defface ledger-occur-narrowed-face
  `((t :inherit font-lock-comment-face :invisible t))
  "Default face for Ledger occur mode hidden transactions"
  :group 'ledger-faces)

(defface ledger-occur-xact-face
  `((t :inherit highlight))
  "Default face for Ledger occur mode shown transactions"
  :group 'ledger-faces)

(defface ledger-font-comment-face
  `((t :inherit font-lock-comment-face))
  "Face for Ledger comments"
  :group 'ledger-faces)

(defface ledger-font-reconciler-uncleared-face
  `((t :inherit ledger-font-payee-uncleared-face))
  "Default face for uncleared transactions in the reconcile window"
  :group 'ledger-faces)

(defface ledger-font-reconciler-cleared-face
  `((t :inherit ledger-font-other-face))
  "Default face for cleared (*) transactions in the reconcile window"
  :group 'ledger-faces)

(defface ledger-font-reconciler-pending-face
  `((t :inherit ledger-font-pending-face))
  "Default face for pending (!) transactions in the reconcile window"
  :group 'ledger-faces)

(defface ledger-font-report-clickable-face
  `((t :foreground "#cb4b16" :weight normal ))
  "Default face for pending (!) transactions in the reconcile window"
  :group 'ledger-faces)

(defface ledger-font-code-face
  `((t :inherit default))
  "Face for Ledger codes"
  :group 'ledger-faces)

(defvar ledger-font-lock-keywords
  `(("^[;#%|*].*\n" . 'ledger-font-comment-face)
    ("^account[[:blank:]].*\n" . 'ledger-font-account-directive-face)
    ("^alias[[:blank:]].*\n" . 'ledger-font-alias-directive-face)
    ("^apply[[:blank:]].*\n" . 'ledger-font-apply-directive-face)
    ("^assert[[:blank:]].*\n" . 'ledger-font-assert-directive-face)
    ("^\\(?:bucket\\|A\\)[[:blank:]].*\n" . 'ledger-font-bucket-directive-face)
    ("^C[[:blank:]].*\n" . 'ledger-font-C-directive-face)
    ("^capture[[:blank:]].*\n" . 'ledger-font-capture-directive-face)
    ("^check[[:blank:]].*\n" . 'ledger-font-check-directive-face)
    ;; FIXME: wrong regex — comment does not require a blank but
    ;; must not be followed by other letters, e.g. “commentary”
    ("^\\(?:comment\\|test[[:blank:]]\\).*\n" . 'ledger-font-comment-face)
    ("^commodity[[:blank:]].*\n" . 'ledger-font-commodity-directive-face)
    ("^D[[:blank:]].*\n" . 'ledger-font-D-directive-face)
    ("^\\(?:define\\|def\\)[[:blank:]].*\n" . 'ledger-font-define-directive-face)
    ;; FIXME: this matches “end” and “endfixed” but also “endoscopy”
    ("^end.*\n" . 'ledger-font-end-directive-face)
    ("^expr[[:blank:]].*\n" . 'ledger-font-expr-directive-face)
    ("^fixed[[:blank:]].*\n" . 'ledger-font-fixed-directive-face)
    ("^include[[:blank:]].*\n" . 'ledger-font-include-directive-face)
    ("^N[[:blank:]].*\n" . 'ledger-font-N-directive-face)
    ("^payee[[:blank:]].*\n" . 'ledger-font-payee-directive-face)
    ("^P[[:blank:]].*\n" . 'ledger-font-price-directive-face)
    ("^tag[[:blank:]].*\n" . 'ledger-font-tag-directive-face)
    ("^[IiOobh][[:blank:]].*\n" . 'ledger-font-timeclock-directive-face)
    ("^\\(?:year\\|Y\\)[[:blank:]].*\n" . 'ledger-font-year-directive-face))
  "Expressions to highlight in Ledger mode.")



(provide 'ledger-fonts)

;;; ledger-fonts.el ends here
