;;; 1s-mode.el --- Major mode for editing OneScript files -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Sokolov

;; Author: Ivan Sokolov <ivan-p-sokolov@ya.ru>
;; Keywords: languages
;; Homepage: https://work.in.progress
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

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

;; Major mode for editing OneScript files.

;;; Code:

(defgroup 1s '()
  "OneScript editing commands for Emacs."
  :group 'languages
  :prefix "1s-mode-")

;;;###autoload
(define-derived-mode 1s-mode prog-mode "OneScript"
  "Major mode for editing OneScript files."
  :group '1s)

;;;###autoload
(add-to-list 'auto-mode-alist (cons (rx ".os" eos) #'1s-mode))

(provide '1s-mode)
;;; 1s-mode.el ends here
