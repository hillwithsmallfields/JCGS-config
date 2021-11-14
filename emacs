(load-file
	(if (getenv "MY_ELISP")
		(substitute-in-file-name "$MY_ELISP/.emacs")
	 "~/open-projects/github.com/hillwithsmallfields/JCGS-emacs/.emacs"))
