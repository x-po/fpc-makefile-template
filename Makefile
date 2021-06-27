default: release

release:
	lazbuild --build-mode=Release -B src/*.lpi

debug:
	lazbuild --build-mode=Debug -B src/*.lpi
