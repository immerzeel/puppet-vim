class vim::spell inherits vim {
	# Create the spell directory.
	file {"${path}/.spell":
		ensure  => directory
	} ->

	# Download the thesaurus file.
	exec {'download_thesaurus':
		cwd     => "${path}/.spell",
		command => "curl -O http://www.gutenberg.org/dirs/etext02/mthes10.zip"
	} ->

	# Extract the thesaurus file from the archive and delete the archive.
	exec {'install_thesaurus':
		command => "unzip -p mthes10.zip mthesaur.txt > thesaurus.txt | rm mthes10.zip"
	} ->

	# Link to the custom words file.
	file {"${path}/.spell/spellfile.add":
		ensure => 'link',
		target => "${path}/${repository_name}/spellfile.add"
	}
}
