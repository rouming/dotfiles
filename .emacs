;; remove toolbar
(tool-bar-mode -1)

;; right scrollbar
(set-scroll-bar-mode 'right)

(defun gstreamer-c-mode ()
  "C mode with adjusted defaults for use with GStreamer."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

;; configure modes
(setq auto-mode-alist
(append '(("\\.C$"               . c++-mode)
          ("\\.cc$"              . c++-mode)
          ("\\.c$"               . c-mode)
          ("\\.cpp$"             . c++-mode)
          ("\\.CPP$"             . c++-mode)
          ("\\.h$"               . c++-mode)
          ("\\.hh$"              . c++-mode)
          ("\\.hpp$"             . c++-mode)
          ("\\.mm$"              . objc-mode)
          ("\\.m$"               . objc-mode)
        ) auto-mode-alist))

;; Linux kernel mode
(add-to-list 'auto-mode-alist '(".*/linux/linux/.*\\.[ch]$" . linux-c-mode))

;; gstreamer mode
(add-to-list 'auto-mode-alist '("gst.*/.*\\.[ch]$" . gstreamer-c-mode))

;; Example: some tuning for some mode
;;(add-hook 'c++-mode-hook
;;          (function (lambda()
;;                      (setq tab-width 4))))

;; Parentheses mode
(show-paren-mode 1)

;; disable ^X ^C (exit from emacs)
(global-unset-key "\C-x\C-c")

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-basic-offset 4)
 '(tab-width 4)
 '(case-fold-search t)
 '(column-number-mode t)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(current-language-environment "UTF-8")
 '(default-input-method "cyrillic-jcuken")
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode t)
 '(ispell-program-name "aspell")
 '(midnight-mode t nil (midnight))
 '(mouse-wheel-mode t nil (mwheel))
;; '(visible-bell t))
 '(ring-bell-function 'ignore))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq c-default-style "linux")

;; cscope
(require 'xcscope)

;; Whitespace style, 80 chars per line
(require 'whitespace)
(setq whitespace-style '(face trailing empty lines-tail space-before-tab))
(setq whitespace-line-column 80)
(set-face-attribute 'whitespace-line nil
                    :background "purple"
                    :foreground "white"
                    :weight 'bold)
(global-whitespace-mode t)


(global-unset-key [insert])

;;
;;
;; Windows-1251 support
;;

;; Использовать окружение UTF-8
(set-language-environment 'UTF-8)

;; UTF-8 для вывода на экран
(set-terminal-coding-system 'utf-8)

;; UTF-8 для ввода с клавиатуры
(set-keyboard-coding-system 'utf-8)

;; Установки автоопределения кодировок
;; prefer-coding-system помещает кодировку в НАЧАЛО списка предпочитаемых кодировок 
;; Поэтому в данном случае первой будет определяться utf-8-unix
(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8-unix)

;; Клавиатурная раскладка "как в Windows" (не работает в emacs 21!)
(setq default-input-method 'russian-computer)
