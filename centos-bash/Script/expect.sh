#!/usr/bin/env expect
set timeout 15
spawn ssh -A -p 22 -i /root/.ssh/ZQZeng ZQZeng@11
expect {
"*ssphrase*:" {send "Qazxsw123_\r"}
}
interact
