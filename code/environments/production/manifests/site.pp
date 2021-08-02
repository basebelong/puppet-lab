node default {
    include accounts
}

node /server-\d.*/ {
    include accounts
}

