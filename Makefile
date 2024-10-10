# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= 
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Define the index and output files for the conversion
MD_INPUT      = docs/index.md docs/about.md
RST_OUTPUT = source/index.rst

# Convert Markdown to reStructuredText
convert:
	pandoc $(MD_INPUT) -f markdown -t rst -o $(RST_OUTPUT)

# Build the documentation after conversion
build: convert
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)


# Clean the build directory
clean:
	rm -rf $(BUILDDIR)/* $(SOURCEDIR)/*.rst

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help convert build Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
