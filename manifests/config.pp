class vim::config inherits vim {
	# Make a symlink to the vimfiles directory to fit in.
	file {"${path}/.vim":
		ensure => link,
		group  => $group,
		owner  => $user,
		target => "${path}/${repository_name}"
	}

	# Link Vim's config file.
	file {"${path}/.vimrc":
		ensure => link,
		group  => $group,
		owner  => $user,
		target => "${path}/${repository_name}/vimrc"
	}
}
