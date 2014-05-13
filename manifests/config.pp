class vim::config inherits vim {
	# Make a symlink to the vimfiles directory to fit in.
	file {"${path}/.vim"
		ensure => link,
		target => "${path}/${repository_name}"
	}

	# Link Vim's config file.
	file {"${path}/.vimrc"
		ensure => link,
		target => "${path}/${repository_name}/vimrc"
	}
}
