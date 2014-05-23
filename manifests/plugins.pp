class vim::plugins inherits vim {
	if $bundle_source !='' {
		# Install the Vundle plugin, which is needed to install
		# the rest of the plugins.
		vcsrepo {"${path}/${repository_name}/bundle/vundle":
			before   => Exec['install_plugins'],
			ensure   => present,
			group    => $group,
			owner    => $user,
			provider => git,
			source   => $bundle_source
		}

		# Let the Vundle plugin install the plugins in the .vimrc.
		exec {'install_plugins':
			command => "vim +BundleInstall +qall",
			user    => $user
		}
	}
}
