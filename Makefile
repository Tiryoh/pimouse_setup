.DEFAULT_GOAL := help

help:
	@echo "the RaspberryPiMouse device driver installer"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## install the raspimouse device driver installer as a service
	[ -d $(dir ${MAKEFILE_DIR}../)/RaspberryPiMouse ] || su -c 'cd $(dir ${MAKEFILE_DIR}../) && git clone https://github.com/rt-net/RaspberryPiMouse.git' -s /bin/sh $(shell logname)
	sed -e 's#/home/ubuntu#/home/$(shell logname)#' -i raspimouse.service setup.bash
	cp raspimouse.service /etc/systemd/system/raspimouse.service
	systemctl daemon-reload
	systemctl enable raspimouse.service
	@echo 'Run "systemctl start raspimouse"'

uninstall: ## remove the raspimouse device driver installer from systemd
	-systemctl stop raspimouse.service
	systemctl disable raspimouse.service
	rm /etc/systemd/system/raspimouse.service
	systemctl daemon-reload
