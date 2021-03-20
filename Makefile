#pkg-config from: https://www.geany.org/manual/gtk/glib/glib-compiling.html
#https://github.com/joprietoe/gdbus/blob/master/Makefile
#https://stackoverflow.com/questions/51269129/minimal-gdbus-client
TARGET = dvorak
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)

install:
	cp dvorak /usr/local/bin/
	cp dvorak.sh /usr/local/sbin/
	sudo chmod +x /usr/local/sbin/dvorak.sh
	cp 80-dvorak.rules /etc/udev/rules.d/
	cp dvorak@.service /etc/systemd/system/
	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload
remove: remove-input remove-usb remove-test

install-input:
	cp dvorak /usr/local/bin/
	cp dvorak.sh /usr/local/sbin/
	sudo chmod +x /usr/local/sbin/dvorak.sh
	cp 80-dvorak.rules /etc/udev/rules.d/
	cp dvorak@.service /etc/systemd/system/
	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload
remove-input:
	rm -f /usr/bin/$(TARGET)
	rm -f /etc/udev/rules.d/80-dvorak.rules 
	sudo udevadm control --reload
	systemctl daemon-reload

install-usb:
	touch /tmp/log-udev-test.log

	cp 80-dvorak-usb.rules /etc/udev/rules.d/
	cp dvorak-usb@.service /etc/systemd/system/
	cp test-udev.sh /tmp/test-udev.sh

	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload

remove-usb:
	rm -f /etc/systemd/system/dvorak-usb@.service
	-@rm /etc/udev/rules.d/80-dvorak-usb.rules
	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload

install-test:
	cp test-udev.sh /tmp/test-udev.sh
	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload
remove-test:
	-@rm /etc/udev/rules.d/test-udev.sh
	udevadm control --reload
	systemctl restart systemd-udevd
	systemctl daemon-reload