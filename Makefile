HOME_DESTS := $(patsubst home/%,~/%,$(shell find home -type f))

.PHONY: install, home_symlinks
install: home_symlinks setup_git

home_symlinks: $(HOME_DESTS)

~/%: ./home/%
	@echo "Installing" $(notdir $@) "..."
	mkdir -p $(dir $@)
	rm -f $@
	ln -s $(abspath $^) $@
	@echo

.PHONY: setup_git
setup_git: ~/.gitignore
	@echo "Registering ~/.gitignore as global gitignore"
	git config --global core.excludesfile ~/.gitignore
