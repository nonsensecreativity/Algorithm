include config.mk
include sources.mk

.PHONY: clean check phar

load.php: $(SOURCES)
	$(PHP) make-loader.php $^ > $@

phar: morrisonlevi_algorithm.phar

morrisonlevi_algorithm.phar: load.php $(SOURCES)
	$(PHP) -d phar.readonly=0 make-phar.php $@ $^

clean:
	$(RM) morrisonlevi_algorithm.phar
	$(RM) load.php

check: load.php
	$(PHP) $(PHPUNIT) -c phpunit.xml

