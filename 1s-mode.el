;;; 1s-mode.el --- Major mode for editing OneScript files -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Sokolov

;; Author: Ivan Sokolov <ivan-p-sokolov@ya.ru>
;; Keywords: languages
;; Homepage: https://work.in.progress
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))

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

(require '1s-smie)

(defgroup 1s '()
  "OneScript editing commands for Emacs."
  :group 'languages
  :prefix "1s-")

(defvar 1s--keywords
  '("And" "И"
    "Break" "Прервать"
    "Continue" "Продолжить"
    "Do" "Цикл"
    "Each" "Каждого"
    "ElsIf" "ИначеЕсли"
    "Else" "Иначе"
    "EndDo" "КонецЦикла"
    "EndFunction" "КонецФункции"
    "EndIf" "КонецЕсли"
    "EndProcedure" "КонецПроцедуры"
    "EndTry" "КонецПопытки"
    "Except" "Исключение"
    "Export" "Экспорт"
    "For" "Для"
    "Function" "Функция"
    "Goto" "Перейти"
    "If" "Если"
    "In" "Из"
    "New" "Новый"
    "Not" "Не"
    "Or" "Или"
    "Procedure" "Процедура"
    "Raise" "ВызватьИсключение"
    "Return" "Возврат"
    "Then" "Тогда"
    "Try" "Попытка"
    "To" "По"
    "Val" "Знач"
    "Var" "Перем"
    "While" "Пока")
  "OneScript keywords.")

(defvar 1s-font-lock-keywords
  `((,(rx bol (* (syntax whitespace)) (group "#" (+ (syntax word))))
     . (1 font-lock-preprocessor-face))
    (,(regexp-opt 1s--keywords 'symbols) . font-lock-keyword-face)
    (,(rx symbol-start (group (or "Процедура" "Procedure" "Функция" "Function"))
          (+ (syntax whitespace)) (group (+ (syntax word))))
     (1 font-lock-keyword-face)
     (2 font-lock-function-name-face))
    (,(regexp-opt '("Истина" "Ложь" "Неопределено") 'symbols)
     . font-lock-constant-face)
    (,(rx symbol-start "&" (+ (syntax word)) symbol-end) . font-lock-type-face)
    (,(rx "~" (+ (syntax word))) . font-lock-constant-face))
  ".")

;;;###autoload
(define-derived-mode 1s-mode prog-mode "OneScript"
  "Major mode for editing OneScript files."
  :group '1s

  ;; comment
  (setq-local comment-start "// ")
  (setq-local comment-end "")

  ;; syntax table
  ;; (modify-syntax-entry ?. "_")
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?/ ". 12")
  (modify-syntax-entry ?\n ">")

  ;; font-lock
  (setq font-lock-defaults '((1s-font-lock-keywords) nil nil nil))

  ;; smie
  (smie-setup 1s-smie-grammar #'1s-smie-rules-function))

;;;###autoload
(add-to-list 'auto-mode-alist (cons (rx "." (or "bsl" "os") eos) #'1s-mode))

(provide '1s-mode)
;;; 1s-mode.el ends here
