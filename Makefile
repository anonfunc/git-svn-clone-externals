install:
	mkdir -p ~/bin
	ln -fs `pwd`/git-* ~/bin
	if which git-svn-clone-externals; then echo "Done"; else echo "Adding ~/bin to PATH..."; echo 'export PATH=~/bin:$$PATH' >> .bashrc; echo 'export PATH=~/bin:$$PATH' >> .zshrc; fi

.PHONY: install
