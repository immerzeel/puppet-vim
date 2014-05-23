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
class vim (
	$bundle_source   = $vim::params::bundle_source,
	$group           = $vim::params::group,
	$path            = $vim::params::path,
	$repository_name = $vim::params::repository_name,
	$source          = $vim::params::source,
	$user            = $vim::params::user
) inherits vim::params {
	validate_string($bundle_source,
			$path,
			$repository_name,
			$source,
			$user)

	anchor {'vim::begin':} ->
	class {'vim::install':} ->
	class {'vim::config':} ~>
	class {'vim::plugins':} ->
	class {'vim::spell':} ->
	anchor {'vim::end':}
	
}
