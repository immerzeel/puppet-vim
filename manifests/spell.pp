class vim::spell inherits vim {
	# Create the spell directory.
	file {"${path}/.spell":
		ensure => directory,
		group  => $group,
		owner  => $user

	} ->

	# Download the thesaurus file.
	exec {'download_thesaurus':
		command => "curl -O http://www.gutenberg.org/dirs/etext02/mthes10.zip",
		cwd     => "${path}/.spell",
		user    => $user
	} ->

	# Extract the thesaurus file from the archive.
	exec {'install_thesaurus':
		command => "unzip -p mthes10.zip mthesaur.txt > thesaurus.txt",
		creates => "${path}/.spell/thesaurus.txt",
		cwd     => "${path}/.spell",
		user    => $user
	} ->

	# Delete the archive, we don't need the other files.
	file {"${path}/.spell/mthes10.zip":
		ensure => purge
	} ->

	# Link to the custom words file.
	file {"${path}/.spell/spellfile.add":
		ensure => link,
		group  => $group,
		owner  => $user,
		target => "${path}/${repository_name}/spellfile.add"
	}
}
