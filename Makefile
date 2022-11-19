linux: clean
	touch linuxsetup.log
	./bin/linux.sh
clean:
	rm -f linuxsetup.log
	./bin/cleanup.sh
