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
	systemctl restart systemd-udevd.service
	systemctl daemon-reload
	systemctl start dvorak@event3.service
remove:
	systemctl stop dvorak@event3.service
	rm -f /usr/bin/$(TARGET)
	rm -f /etc/udev/rules.d/80-dvorak.rules 
	rm -f /etc/systemd/system/dvorak@.service
	sudo udevadm control --reload
	sudo systemctl restart udevd.service
	systemctl daemon-reload