class vim::plugins inherits vim {
	if $bundle_source !='' {
		# Install the Vundle plugin, which is needed to install
		# the rest of the plugins.
		vcsrepo {"${path}/${repository_name}/bundle/":
			ensure   => present,
			provider => git,
			source   => $bundle_source,
			before   => Exec['install_plugins']
		}

		# Let the Vundle plugin install the plugins in the .vimrc.
		exec {'install_plugins':
			command => "vim +BundleInstall +qall"
			command => "sudo -u vagrant vim +BundleInstall +qall",
			environment => "HOME=/home/vagrant/"
		}
	}
}
