HOME_DESTS := $(patsubst home/%,~/%,$(shell find home -type f))

.PHONY: install, home_symlinks
install: home_symlinks

home_symlinks: $(HOME_DESTS)

~/%: ./home/%
	@echo "Installing" $(notdir $@) "..."
	mkdir -p $(dir $@)
	rm -f $@
	ln -s $(abspath $^) $@
	@echo

