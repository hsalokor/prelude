(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-clang-arguments
      '("-I" "/opt/cornerstone-2.0.7-beta2/include/"))

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c C-.") 'ff-find-other-file)))

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-standard-library "libc++")))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++1y")))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path (list "/opt/cornerstone-2.0.7-beta2/include/"))))

(eval-after-load 'company
                 '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; ;; trigger completion at interesting places, such as after scope operator
;; ;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(setq-default indent-tabs-mode nil)
(setq c-default-style
      '((java-mode . "java") (awk-mode . "awk") (other . "bsd"))
      c-basic-offset 4)

(defun my-c-mode-setup ()
  (subword-mode 1)
  (c-set-offset 'innamespace 0))
(add-hook 'c-mode-common-hook 'my-c-mode-setup)
