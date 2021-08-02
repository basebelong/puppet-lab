class accounts {

	$rootgroup = $osfamily ? {
		'Debian'	=> 'sudo',
		'RedHat'	=> 'wheel',
		default	=> warning('This distribution is not supported by the Accounts module'),
	}

	include accounts::groups
	include accounts::ssh

	user { 'containersson':
		ensure		=> present,
		home		=> '/home/containersson',
		shell		=> '/bin/bash',
		managehome	=> true,
		gid		=> 'containersson',
		groups		=> "$rootgroup",
		password	=> '$1$z51Y9L2R$c/FioWrTf84CA1AhBimbZ0',
	}

	file { '/home/containersson/.ssh/':
		ensure	=> directory,
		mode	=> '0700',
		owner	=> 'containersson',
		group	=> 'containersson',
	}

	file { '/home/containersson/.ssh/authorized_keys':
		ensure	=> file,
		mode	=> '0400',
		owner	=> 'containersson',
		group	=> 'containersson',
		source	=> 'puppet:///modules/accounts/ssh_keys/jonas_rsa.pub',
	}

}
    
