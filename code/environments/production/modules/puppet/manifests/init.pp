class puppet {

        file { '/etc/puppetlabs/puppet/puppet.conf':
                ensure  => present,
                source  => 'puppet:///modules/puppet/puppet.conf',
                notify  => Service['puppet'],
        }

        service { 'puppet':
                hasrestart      => true,
        }

}

