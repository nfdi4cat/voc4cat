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

set windows-shell := ["C:\\Program Files\\Git\\bin\\sh.exe","-c"]

# List all commands as default command. The prefix "_" hides the command.
_default:
    @just --list

# Ignore recipe lines beginning with #.
set ignore-comments	:= true

# Run initial setup (run this first)
[group('environment')]
setup:
  # install current voc4cat-tool version
  uv tool install voc4cat --with git+https://github.com/dalito/pyLODE.git@nfdi4cat-2.x

# Upgrades voc4cat-tool installation
[group('environment')]
upgrade:
  uv tool install --upgrade voc4cat --with git+https://github.com/dalito/pyLODE.git@nfdi4cat-2.x

# Check the *.xlsx file(s) in inbox-excel-vocabs/ for errors
[group('individual steps')]
check: _fake_actions_env
  @voc4cat --version
  # check inbox file names
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --ci-pre inbox-excel-vocabs/ _main_branch/vocabularies
  # check xlsx file(s). If the check fails, write annotated file to outbox.
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/

# Convert the *.xlsx file(s) in inbox-excel-vocabs/ to turtle
[group('individual steps')]
convert: _fake_actions_env
  # keep a copy of the submitted file(s) outside the inbox, which voc4cat
  # requires to hold nothing but xlsx and markdown
  @mkdir -p _xlsx-backup
  @if ls inbox-excel-vocabs/*.xlsx >/dev/null 2>&1; then cp inbox-excel-vocabs/*.xlsx _xlsx-backup; fi
  @voc4cat convert --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/
  @if [ -z "$(ls outbox/*.ttl 2>/dev/null)" ]; then \
    echo "No ttl file in outbox. Building joined vocabulary ttl-file from individual ttl-files in vocabulary." && \
    voc4cat transform --join --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --outdir outbox/ vocabularies/ ;\
  fi

  #=== post-convert checks ===
  # Delete xlsx in outbox that may be present from former runs
  @rm -f outbox/*.xlsx
  # check all ttl file(s) in outbox
  @voc4cat check --redundant-hierarchies --config _main_branch/idranges.toml --logfile outbox/voc4cat.log outbox/
  # check if vocabulary changes are allowed
  @voc4cat check --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --ci-post _main_branch/vocabularies outbox/

# Run voc4cat (build HTML documentation from ttl files)
[group('individual steps')]
docs:
  @voc4cat docs --logfile outbox/voc4cat.log --force outbox/

# Rebuild the xlsx file from the joined ttl file.
[group('individual steps')]
xlsx: _fake_actions_env
  @rm -f outbox/*.xlsx
  @voc4cat convert --config _main_branch/idranges.toml --logfile outbox/voc4cat.log --template templates/default_sheets.xlsx outbox/

# Join individual ttl files in vocabularies/ to one turtle file in outbox/
[group('individual steps')]
join:
  @voc4cat transform --join --config idranges.toml --logfile outbox/voc4cat.log --outdir outbox vocabularies/

# Add provenance information to all ttl files in vocabularies/
[group('individual steps')]
prov:
  voc4cat transform --prov-from-git --diff-base origin/main --inplace --config idranges.toml --logfile outbox/voc4cat.log vocabularies/

# Run all steps as in gh-actions: check xlsx, convert to SKOS, build docs, re-build xlsx
all: check convert docs xlsx

# The checks that guard a pull request are advisory when run locally and fatal
# in gh-actions. Uncomment to get the pipeline's strict behaviour here, e.g. to
# see whether the IDs you minted are inside the id_range that idranges.toml
# grants your GITHUB_ACTOR. The example name is the one used in the example
# vocabulary; replace it with your own GitHub name (or ORCID).
# These must stay at file level: "export" inside a recipe applies to that line only.
# export GITHUB_ACTIONS := "true"
# export GITHUB_ACTOR := "sofia-garcia"

# The pipeline stamps these into the built vocabulary; uncomment to do the same
# locally. VOC4CAT_MODIFIED sets dcterms:modified on the concept scheme (it
# defaults to today), VOC4CAT_VERSION sets owl:versionInfo and must start with
# "v". A "v_" prefix keeps the git-blame links pointing at main, like the dev
# build in merge.yml; a release tag points them at that tag instead.
# export VOC4CAT_MODIFIED := datetime("%Y-%m-%d")
# export VOC4CAT_VERSION := "v_local"

# Create local environment suitable to run the same commands as in gh-actions
_fake_actions_env:
  @mkdir -p _main_branch
  @mkdir -p _main_branch/vocabularies
  @cp idranges.toml _main_branch/idranges.toml

# Remove all generated files/directories
[group('environment')]
clean:
  rm -rf outbox
  rm -rf outbox_new_voc
  rm -rf _main_branch
