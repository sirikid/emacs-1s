;;; bsl-ls.el --- Support for BSL language server -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Sokolov

;; Author: Ivan Sokolov <ivan-p-sokolov@ya.ru>
;; Keywords: languages, processes
;; Homepage: https://work.in.progress
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Support for BSL language server

;;; Code:

(require '1s-mode)

(defgroup bsl-ls '()
  "Settings for BSL language server."
  :group '1s
  :prefix "bsl-ls-")

(defcustom bsl-ls-java "java"
  "Java executable for BSL language server."
  :group 'bsl-ls
  :type 'file)

(defcustom bsl-ls-server-jar "bsl-language-server.jar"
  "Path to language server executable."
  :group 'bsl-ls
  :type 'file)

(defcustom bsl-ls-config-path nil
  "Path to language server configuration."
  :group 'bsl-ls
  :type '(choice (const :tag "None" nil) file))

;;;###autoload
(defun bsl-ls-contact (_interactive)
  "Use this function with `eglot-server-programs'."
  (nconc (list bsl-ls-java "-jar" bsl-ls-server-jar)
         (when-let ((config-path bsl-ls-config-path))
           (list "-c" config-path))))

(provide 'bsl-ls)
;;; bsl-ls.el ends here
