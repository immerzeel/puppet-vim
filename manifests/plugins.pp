class vim::plugins inherits vim {
	if $bundle_source !='' {
		# Create the bundle directory and chown it for the user
		# and group, otherwise the plugins won't install.
		file {"${path}/${repository_name}/bundle":
			ensure => directory,
			owner => $user,
			group => $group
		}
		# Install the Vundle plugin, which is needed to install
		# the rest of the plugins.
		vcsrepo {"${path}/${repository_name}/bundle/vundle":
			before   => Notify['install_plugins_later'],
			ensure   => present,
			group    => $group,
			owner    => $user,
			provider => git,
			source   => $bundle_source
		}

		notify {'install_plugins_later':
			message => "Installation of the Vim plugins takes too long. run 'vim +BundleInstall +qall' after provisioning."
		}
	}
}
