class vim::install inherits vim {
	package {['vim', 'git', 'curl', 'zip']:
		ensure => present
	}

	# Clone the remote vimfiles repo to the user home directory.
	vcsrepo {"${path}/${repository_name}":
		ensure   => present,
		group    => $group,
		owner    => $user,
		provider => git,
		source   => $source
	}
}
