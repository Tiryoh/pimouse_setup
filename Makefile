.DEFAULT_GOAL := help
MAKEFILE_DIR := $(shell cd $(dir $(lastword $(MAKEFILE_LIST))); pwd)

help:
	@echo "the RaspberryPiMouse device driver installer"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## install the raspimouse device driver
	[ -d ${MAKEFILE_DIR}/../RaspberryPiMouse ] || su -c 'cd ${MAKEFILE_DIR}/../ && git clone https://github.com/rt-net/RaspberryPiMouse.git' -s /bin/sh $(shell logname)
	cd ${MAKEFILE_DIR}/../RaspberryPiMouse && \
	su -c './utils/build_install.bash' -s /bin/sh $(shell logname) && \
	sudo rmmod rtmouse.ko && \
	sudo cp src/drivers/rtmouse.ko /lib/modules/`uname -r`/kernel/drivers/misc/
	sudo depmod -A
	echo rtmouse | sudo tee /etc/modules-load.d/rtmouse.conf > /dev/null
	sudo modprobe rtmouse

uninstall: ## remove the raspimouse device driver
	-sudo modprobe -r rtmouse
	sudo rm /etc/modules-load.d/rtmouse.conf
	sudo rm /lib/modules/`uname -r`/kernel/drivers/misc/rtmouse.ko
