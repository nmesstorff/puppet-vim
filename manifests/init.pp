# == Class: vim
#
# Manage your system-wide vim plugins and configuration via puppet
#
# === Parameters
#
# Document parameters here.
#
# [*parameter1*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*variable1*]
#   Explanation of how this variable affects the funtion of this class and
#   if it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames."
#
# === Examples
#
#  class { 'vim':
#    parameter1 => [ 'just', 'an', 'example', ]
#  }
#
# === Authors
#
# Norman Messtorff <normes@normes.org>
#
# === Copyright
#
# Copyright 2013 Norman Messtorff
#
class vim (){
  package{ 'vim':
    ensure => present,
    before => File['/etc/vim'],
  }

  File{
    owner => 'root',
    group => 'root',
  }

  file{ '/etc/vim':
    ensure => directory,
  }

  file{ '/etc/vim/vimrc':
    source => 'puppet:///vim/vimrc',
  }

  file { '/etc/vim/pathogen':
    ensure  => directory,
    source  => 'puppet:///vim/pathogen',
    recurse => true,
  }

  file { '/etc/vim/bundle':
    ensure  => directory,
    source  => 'puppet:///vim/bundle',
    recurse => true,
  }
}

