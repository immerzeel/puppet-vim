class vim::params {
	$bundle_source   = 'git://git@github.com/gmarik/vundle.git'
	$path            = ''
	$repository_name = 'vimfiles'
	$source          = 'git://git@github.com/immerzeel/vimfiles.git'
	$user            = ''

	case $::osfamily {
		'Ubuntu': {
			# On virtual machine with Ubuntu, default to 'vagrant'.
			if $::is_virtual {
				$user   = 'vagrant'
				$path   = '/home/vagrant'
			}
		}
		default: {
			fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
		}
	}
}
