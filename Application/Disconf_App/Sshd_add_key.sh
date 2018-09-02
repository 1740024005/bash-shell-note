#!/bin/env bash
# --

echo "#Kol_key" >> /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/Or9LDekfahRHgKQAqtA12sc+b4kGz3h3hxQkc7urWfuMxnqZx2clPdwWFpSZ7vW9EfJfRhH2MQJnTFwjqXMmygQYPcij//t3O+NFcfmy8wRKJZup+J+MJXVxvTWJQvh416cVulH2zOK1pQupnHTjaW2uNzFOfP4lr1qXkhNZ3vZtkuqhbbPy4QwUG0dcsNaZhHlGcyXcaB7k7q7MIaA98bl3+XcYs78cDfvnRkLF6U548vo/o2vsYyrRGD1z7jwRUYAY43pOg1UndnkkCWkVhL0Xa5PPIguh5RjJxfjM/pTJfC2+iSDDW19lpcsD/nVjvmwhPN4DET4CmnHMbOx7" >> /root/.ssh/authorized_keys

sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i "s/GSSAPIAuthentication yes/GSSAPIAuthentication no/g" /etc/ssh/sshd_config
sed -i 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/g' /etc/ssh/sshd_config
sed -i 's/Port 36000/Port 11022/g' /etc/ssh/sshd_config
/etc/init.d/sshd restart
