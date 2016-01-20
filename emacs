(load-file
	(if (getenv "$EHOME")
		(substitute-in-file-name "$EHOME/JCGS-emacs/.emacs")
	 "~/JCGS-emacs/.emacs"))
