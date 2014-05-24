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
		#
		# Decided to install the plugins after provisioning, as 
		# this section could timeout and there is no real estimate
		# to make how long it could take.
		#
		# After installation:
		#
		# Run `vim +BundleInstall +qall` or enter :BundleInstall
		# when Vim is running.
		vcsrepo {"${path}/${repository_name}/bundle/vundle":
			ensure   => present,
			group    => $group,
			owner    => $user,
			provider => git,
			source   => $bundle_source
		}
	}
}
