# Allow to override settings
CONFIG         ?= Makefile.local
-include $(CONFIG)

Q              ?= @
UPDATEDIR      := /tmp
BUILDTYPE      ?= Debug
BUILDDIR       ?= ./build/$(BUILDTYPE)
INSTALL_DIR    ?= $(BUILDDIR)
GENERATOR      := Ninja
CMAKE          ?= cmake
CMAKE_OPTIONS  ?= -DCMAKE_BUILD_TYPE=$(BUILDTYPE) -G$(GENERATOR)

all:
	$(Q)if [ ! -f $(BUILDDIR)/CMakeCache.txt ]; then $(CMAKE) -H$(CURDIR) -B$(BUILDDIR) $(CMAKE_OPTIONS); fi
	$(Q)$(CMAKE) --build $(BUILDDIR) --target $@
	$(Q)$(CMAKE) -E create_symlink build/Debug/compile_commands.json compile_commands.json

release:
	$(Q)$(MAKE) BUILDTYPE=Release

clean:
	$(Q)rm -rf $(BUILDDIR)

distclean:
	$(Q)git clean -fdx

ccmake:
	$(Q)ccmake -B$(BUILDDIR) -S.

release-%:
	$(Q)$(MAKE) BUILDTYPE=Release $(subst release-,,$@)

%:
	$(Q)if [ ! -f $(BUILDDIR)/CMakeCache.txt ]; then $(CMAKE) -H$(CURDIR) -B$(BUILDDIR) $(CMAKE_OPTIONS); fi
	$(Q)$(CMAKE) --build $(BUILDDIR) --target $@
	$(Q)$(CMAKE) --install $(BUILDDIR) --component $@ --prefix $(INSTALL_DIR)/install-$@
	$(Q)$(CMAKE) -E create_symlink build/Debug/compile_commands.json compile_commands.json
