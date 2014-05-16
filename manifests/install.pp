class vim::install inherits vim {
	package {['vim', 'git', 'curl']:
		ensure => present
	}

	# Clone the remote vimfiles repo to the user home directory.
	vcsrepo {"${path}/${repository_name}":
		ensure   => present,
		provider => git,
		source   => $source
	}
}
