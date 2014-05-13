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

	if $bundle_source !='' {
		# Install the Vundle plugin, which is needed to install
		# the rest of the plugins.
		vcsrepo {"${path}/${repository_name}/bundle/":
			ensure   => present,
			provider => git,
			source   => $bundle_source
		} ->

		exec {'install_plugins':
			command => "vim +BundleUpdate"
		}
	}
}
