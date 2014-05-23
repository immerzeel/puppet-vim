class vim::config inherits vim {
	# Make a symlink to the vimfiles directory to fit in.
	file {"${path}/.vim":
		ensure => link,
		group  => $vim::params::user,
		owner  => $vim::params::user,
		target => "${path}/${repository_name}"
	}

	# Link Vim's config file.
	file {"${path}/.vimrc":
		ensure => link,
		group  => $vim::params::user,
		owner  => $vim::params::user,
		target => "${path}/${repository_name}/vimrc"
	}
}
