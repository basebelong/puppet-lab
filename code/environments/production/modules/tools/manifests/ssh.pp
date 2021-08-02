class accounts::ssh {

        file { '/etc/ssh/sshd_config':
                ensure  => present,
                source  => 'puppet:///modules/accounts/sshd_config',
		notify	=> Service['sshd'],
        }

	service { 'sshd':
		hasrestart	=> true,
	}

}

