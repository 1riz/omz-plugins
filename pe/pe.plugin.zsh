#
# Aliases
#
alias pe='curl -sSL http://programmingexcuses.com | grep -Eo "<a.+>.+</a>" | grep -Eo "[^<>]+" | sed -n 2p'
