;;; 1s-smie.el --- SMIE for 1s-mode -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Sokolov

;; Author: Ivan Sokolov <ivan-p-sokolov@ya.ru>
;; Keywords:

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

;;

;;; Code:

(require 'smie)

(defvar 1s-smie-grammar
  (smie-prec2->grammar
   (smie-bnf->prec2
    '((exp)
      (cmd ("Если" exp "Тогда" else)
           ("Пока" exp "Цикл" cmd "КонецЦикла")
           ("Для" exp "По" exp "Цикл" cmd "КонецЦикла")
           (cmd ";" cmd))
      (else (cmd "КонецЕсли")
            (cmd "Иначе" cmd "КонецЕсли")
            (cmd "ИначеЕсли" exp "Тогда" else)))
    '((assoc ";")))))

(defvar 1s-smie-basic-indent 4)

(defun 1s-smie-rules-function (kind token)
  (pcase (cons kind token)
    (_ nil)))

(provide '1s-smie)
;;; 1s-smie.el ends here
