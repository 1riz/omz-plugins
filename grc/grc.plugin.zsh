#
# Custom /etc/grc.zsh
#

if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then

  # Supported commands
  cmds=(
    ifconfig \
    last \
    mtr \
    netstat \
    ping \
    ping6 \
    traceroute \
    traceroute6 \
  );

  # Set alias for available commands.
  for cmd in $cmds ; do
    if (( $+commands[$cmd] )) ; then
      alias $cmd="grc --colour=auto $(whence $cmd)"
    fi
  done

  # Clean up variables
  unset cmds cmd
fi
