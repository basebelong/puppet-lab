node default {
}

node /server-\d.*/ {
        include accounts
	include puppet
}

