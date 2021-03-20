5810  bat /etc/systemd/system/
 5811  bat /etc/systemd/system/dvorak-usb@.service
 5812  sudo make remove
 5813  sudo udevadm control --reload
 5814  sudo make remove
 5815  cat /tmp/log-udev-test.log
 5816  setxkbmap -I ~/.xkb bepo_code.xkb -print | xkbcomp -I${HOME}/.xkb/ - ${DISPLAY}
 5817  sudo rm /tmp/log-udev-test.log
 5818  touch /tmp/log-udev-test.log
 5819  setxkbmap -I ~/.xkb bepo_code.xkb -print | xkbcomp -I${HOME}/.xkb/ - ${DISPLAY}
 5820  cat /tmp/log-udev-test.log
 5821  udevadm control --reload
 5822  sudo udevadm control --reload
 5823  sudo udevadm test-builtin usb_id /sysbus/usb/uevent
 5824  sudo udevadm test-builtin usb_id /sysbus/usb/devices/usb1/1-0:1.0/bInterfaceClass
 5825  sudo udevadm test /sys/bus/usb/devices/6-0:1.0/bInterfaceClass
 5826  \ls --color=tty /etc/systemd/system/
 5827  sudo make install-usb
 5828  \ls --color=tty /etc/systemd/system/
 5829  sudo make install-usb
 5832  lsusb -v 
 5833  lsusb
 5835  ls /dev/usb/
 5836  ls /dev/usb/hiddev0 
 5837  lsusb
 5840  lsusb -d 17ef:6099
 5841  lsusb
 5842  lsusb -d 17ef:6099
 5843  lsusb -d 17ef:6099 -t -v
 5844  cat /proc/bus/input/devices
 5845  cat /proc/bus/input/devices | \grep Sysfs

```
 udevadm info -q path -n /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.6/2-1.6:1.2/0003:046D:C52B.0003/0003:046D:404D.0004/input/input29
 
 udevadm info -q path -n /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.6/2-1.6:1.2/0003:046D:C52B.0003/
 udevadm test /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0/0003:17EF:6099.0010/input/input42
 sudo make install-usb
 
 udevadm test /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0/0003:17EF:6099.0010/input/input42
```

To test my lenovo keyboard
# udevadm test /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0/0003:17EF:6099.0010/input/input42