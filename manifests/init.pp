# == Class: vim
#
# Install and configure Vim
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# === Examples
#
# include vim
#
# === Authors
#
# Pascal Immerzeel <pascal@immerzeel.net>
#
# === Copyright
#
# Copyright 2014 Pascal Immerzeel, unless otherwise noted.
#
class vim(
	$path   = $vim::params::path,
	$source = $vim::params::source
) {
	include vim::params

	validate_string($path, $source)

	anchor {'vim::begin':} ->
	class {'vim::install':} ->
	class {'vim::config':} ->
	anchor {'vim::end':}
	
}
