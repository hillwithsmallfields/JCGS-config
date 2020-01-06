(load-file
	(if (getenv "MY_ELISP")
		(substitute-in-file-name "$MY_ELISP/.emacs")
	 "~/github/hillwithsmallfields/JCGS-emacs/.emacs"))
