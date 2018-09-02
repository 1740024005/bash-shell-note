#! /usr/bin/expect

set passwd 
set ip 

spawn sftp xlink@$ip
expect {
  "(yes/no)?" {send "yes\r"; expect_continue}
  "Password:" {send "$paawd\r"}
}

expect "sftp>"
send "cd /pviotapi01\ sftp\ \(10.20.41.159\)\r"
expect "sftp>"
send "cd xlink\r"
expect "sftp>"
send "rm /pviotapi01\\\ sftp\\\ \\\(10.20.41.159\\\)/xlink/tmp/dist.zip\r"
expect "sftp>"
send "put /Users/cengzhiqian/dist/ccpg/dist.zip /pviotapi01\\\ sftp\\\ \\\(10.20.41.159\\\)/xlink/tmp/\r"
expect "sftp>"
send "bye\r"
expect eof


spawn ssh xlink@$ip
expect {
    "yes/no" { send "yes\r"; exp_continue}
    "Password:" { send "$passwd\r" }
  }

expect "server:"
send "1\r"
expect "account:"
send "2\r"
expect "\\\$"
send "bash /data/shell/update_www.sh\r"
expect "\\\$"
send "exit\r"
expect "exit."
send "q\r"
expect eof
