#!/bin/bash
groupmod -g $gid acroread 2>/dev/null
usermod -u $uid -g $gid acroread 2>/dev/null

mkdir -p /home/acroread/.adobe/Acrobat/9.0/Preferences 2>/dev/null

cat > /home/acroread/.adobe/Acrobat/9.0/Preferences/reader_prefs <<EOF
<</AVGeneral [/c <<     /AppInitialized [/b true]
>>]
/AVPrivate [/c <<       /ChooseLangAtStartup [/b false]
        /EULAAcceptanceTime [/i $(date +%s)]
        /SplashDisplayedAtStartup [/b true]
        /UnixLanguageStartup [/i 4542037]
        /showEULA [/b false]
>>]
/Originals [/c <<       /ProofingSpace [/s (U.S. Web Coated \(SWOP\) v2)]
>>]
/SDI [/c <<     /MaximizeNextDocument [/b false]
>>]
/Selection [/c <<       /DefaultSelect [/a /Select]
>>]
/unixAppSizePreferences [/c <<  /unixAppOpenMaximizedPreference [/b true]
>>]
>>
EOF

if [[ -n "${CUPS_SERVER}" ]]; then
	mkdir -p /etc/cups/ 2>/dev/null
    cat > /etc/cups/client.conf <<EOF
# The ServerName directive specifies sets the remote server
# that is to be used for all client operations. That is, it
# redirects all client requests to the remote server. The
# default port number is 631 but can be overridden by adding
# a colon followed by the desired port number to the value.
# The default is to use the local server ("localhost").
ServerName ${CUPS_SERVER}
EOF
fi

if [[ -d /home/acroread/.adobe ]]; then
  chown -R acroread:acroread /home/acroread/.adobe
fi

exec su -ls "/bin/bash" -c "mkdir -p /home/acroread/.local/share; /usr/bin/acroread '$ARGS' '$FILE'" acroread
