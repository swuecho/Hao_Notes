(length buffer-name)
(buffer-file-name)
(length buffer-file-name)
(buffer-name)
(length buffer-name) 为何没有任何结果？
(delete-char 9)
(defun insert-p-tag ()
  "Insert <p></p> at cursor point."
  (interactive)
  (insert "<p></p>")
 <p></p> (backward-char 4))

(defun insert-first-tag ()
  "Insert == == at cursor point."
  (interactive)
  (insert "====")
====  (backward-char 2))
(point)
(defun insert-comment ()
  "insert the note at the beginning of line."
  (interactive)
 (beginning-of-line)
 (insert ";;"))
(goto-char (region-beginning))


