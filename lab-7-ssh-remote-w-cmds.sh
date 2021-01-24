#!/bin/bash

# Ref.
# https://www.cyberciti.biz/faq/linux-unix-osx-bsd-ssh-run-command-on-remote-machine-server/


# Run multiple cmds on single server

# ssh server1 << HERE
#     command1
#     command2
# HERE
#
# ssh username@server1.domain.name << EOF
#     date
#     hostname
#     cat /etc/resolv.conf
# EOF

for s in server1 server2 server3
do
    ssh username@${s} uptime
done

for s in server{1..4}.domain.name
do
    ### Copy a whole folder ###
    # scp -i /path/to/private_key scp -rp /source/directory username@dest:/path
    ### Copy a single shell script ###
    # scp -i /path/to/private_key scp -rp /source/path/to/script.sh username@dest:/path/to
    ### Attend shell script to ssh cmd for remote execution ###
    # where /home/username/bin/test.sh resides in source server
    ssh -i /path/to/private_key username@${s} 'bash -s' < /home/username/bin/test.sh
done