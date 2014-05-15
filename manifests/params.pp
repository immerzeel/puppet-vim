class vim::params {
	$bundle_source   = 'git://git@github.com/gmarik/vundle.git'
	$path            = ''
	$repository_name = 'vimfiles'
	$source          = 'git://git@github.com/immerzeel/vimfiles.git'
	$user            = ''

	# On virtual machine, default to 'vagrant'.
	if $::is_virtual {
		$user   = 'vagrant'
		$path   = '/home/vagrant'
	}
}
