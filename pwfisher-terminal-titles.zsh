# https://superuser.com/a/344397/79598:
setTerminalText () { local mode=$1 ; shift ; echo -ne "\033]$mode;$@\007" }
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }
# me:
DISABLE_AUTO_TITLE="true"
stt_tab "${PWD##*/} · .zprofile"
function precmd () { stt_tab "${PWD##*/}" }
function preexec() { stt_tab "${PWD##*/} · $1" }
