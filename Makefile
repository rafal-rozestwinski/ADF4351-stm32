all: upload serial

build:
	pio run

upload:
	echo "DAT=A7 CLK=A5 LE=A4 ??=A6  3.3V=3.3 GND=GND"
	echo "FOR CHEAPER BOARD, DATA pin is REALLY CLK; CLK PIN is LE; LE pin is actually DATA"
	pio run -t upload

serial:
	miniterm -e   --eol LF /dev/ttyUSB0 115200
