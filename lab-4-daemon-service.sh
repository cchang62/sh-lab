#!/bin/bash
: <<'END'
# Comment Block Info - Start
# single quotes, ', around the END dilimtier are preventing the block being parsed and executed. It's very important.
# https://stackoverflow.com/questißons/947897/block-comments-in-a-shell-script
# Comment Block Info - End

Examples of progress bar:
1. https://github.com/fearside/ProgressBar/blob/master/progressbar.sh 
2. https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
3. [.service file syntax]https://www.freedesktop.org/software/systemd/man/systemd.syntax.html 
END

# Replace example to your custom ienw
sudo cat > /etc/systemd/system/example.service << EOF
[Unit]
Description=example daemon
After=network.target
#After=mysqld.service
StartLimitIntervalSec=0

[Service]
Type=simple
WorkingDirectory=/usr/local/
#ExecStart=/usr/local/go/bin/go run src/test1/main.go
ExecStart=/usr/local/bin/example    # Where example is binary file
Restart=always
RestartSec=1
User=centos

[Install]
WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload \
&& systemctl enable example.service \   # Run the service when VM is on boot.
&& systemctl start example.service 
