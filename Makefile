RM=rm -f
socket=localhost:8080

test2: phpwin/php php.ini
	-taskkill /F /IM php.exe 2>/dev/null
	(PATH=phpwin/php php.exe -S "$(socket)" -t . form2.php &)
	cygstart "http://$(socket)"

test: phpwin/php
	-taskkill /F /IM php.exe 2>/dev/null
	(PATH=phpwin/php php -c . -S "$(socket)" -t . phpinfo.php &)
	cygstart "http://$(socket)"

php.ini: phpwin/php/php.ini-development
	cp $< $@

phpwin/php:
	$(MAKE) -C phpwin

phpwin/php/php.ini-production:
	$(MAKE) -C phpwin

clean:
	$(RM) php.ini

veryclean:
	$(MAKE) clean
	$(MAKE) -C phpwin veryclean
