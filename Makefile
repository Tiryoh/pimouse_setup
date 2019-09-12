install:
	cp raspimouse.service /etc/systemd/system/raspimouse.service
	systemctl daemon-reload
	systemctl enable raspimouse.service
	echo 'Run "systemctl start raspimouse"'

uninstall:
	systemctl stop raspimouse.service
	systemctl disable raspimouse.service
	rm /etc/systemd/system/raspimouse.service
	systemctl daemon-reload
