class vim::spell inherits vim {
	# Create the spell directory.
	file {"${path}/.spell":
		ensure => directory,
		group  => $vim::params::user,
		owner  => $vim::params::user

	} ->

	# Download the thesaurus file.
	exec {'download_thesaurus':
		command => "curl -O http://www.gutenberg.org/dirs/etext02/mthes10.zip",
		cwd     => "${path}/.spell",
		user    => $vim::params::user
	} ->

	# Extract the thesaurus file from the archive and delete the archive.
	exec {'install_thesaurus':
		command => "unzip -p mthes10.zip mthesaur.txt > thesaurus.txt | rm mthes10.zip",
		user    => $vim::params::user
	} ->

	# Link to the custom words file.
	file {"${path}/.spell/spellfile.add":
		ensure => 'link',
		group  => $vim::params::user,
		owner  => $vim::params::user,
		target => "${path}/${repository_name}/spellfile.add"
	}
}
