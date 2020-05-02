local modem = peripheral.wrap("back")
modem.transmit(8080, 1, "password")
modem.close(1)
shell.run("clear")
