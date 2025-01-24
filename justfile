# This file defines task to be run locally with the just command runner.
#
# Just can be installed in various ways and is available for Linux, MacOS and
# Windows, see https://github.com/casey/just?tab=readme-ov-file#installation
#
# It also requires "uv" which makes running python tools like voc4cat simpler.
# To install follow https://docs.astral.sh/uv/getting-started/installation/
#
# This recipe file assumes presence of a "bash" shell even on Windows.
# It is included in git for windows so most likely you have it already.
# Else download it from https://git-scm.com/download/win

export GITHUB_ENV := datetime("%Y-%m-%dT%H%M")

# List all commands as default command. The prefix "_" hides the command.
_default:
    @just --list

# Set cross-platform Python shebang line (assumes presence of launcher on Windows)
shebang := if os() == 'windows' {
  'py'
} else {
  '/usr/bin/env python3'
}

# Directory variables
src := "src"

# Ignore recipe lines beginning with #.
set ignore-comments	:= true

# Run initial setup (run this first)
setup:
  # install current voc4cat-tool version
  uv tool install voc4cat --with git+https://github.com/dalito/pyLODE.git@nfdi4cat-2.x

# Updates voc4cat-tool installation
update:
  uv tool install voc4cat

# Check the voc4cat.xlsx file in inbox/ for errors
check: _fake_actions_env
  @voc4cat --version
  # check inbox file names
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --ci-pre inbox-excel-vocabs/ _main_branch/vocabularies
  # check xlsx file(s). If the check fails, write annotated file to outbox.
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/

# Convert the voc4cat.xlsx file in inbox/ to turtle
convert: _fake_actions_env
  # make a backup of the original file just in case
  @cp inbox-excel-vocabs/voc4cat.xlsx inbox-excel-vocabs/voc4cat.xlsx.backup
  @voc4cat convert --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/
  @if [ -z "$(ls outbox/*.ttl 2>/dev/null)" ]; then \
    @echo "No ttl file in outbox. Building joined vocabulary ttl-file from individual ttl-files in vocabulary.\n" && \
    @voc4cat transform --join --logfile outbox/voc4cat.log --outdir outbox/ vocabularies/ ;\
  fi

  #=== post-convert checks ===
  # check all ttl file(s) in outbox
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log outbox/
  # check if vocabulary changes are allowed
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --ci-post _main_branch/vocabularies outbox/

# Run voc4cat (build HTML documentation from ttl files)
docs:
  @voc4cat docs --logfile outbox/voc4cat.log --force outbox/

# Run combination of steps as in gh-actions: check xlsx, convert to SKOS, build docs
all: check convert docs

# Create local environment suitable to run the same commands as in gh-actions
_fake_actions_env:
  @mkdir -p _main_branch
  @mkdir -p _main_branch/vocabularies
  @cp idranges.toml _main_branch/idranges.toml

# # Clean all generated files
clean:
  rm -rf outbox
  rm -rf outbox_new_voc
  rm -rf _main_branch
