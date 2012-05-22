#!/bin/bash

# read settings and functions
source 'config'
source 'helper'

# display whats going on
display_message 'Preparing data'

# recreate directory structure
rm -rf 'cache' && mkdir -p cache/factions

# copy wesnoth data into current tree
cp -R $SRC/multiplayer/factions/*default.cfg cache/factions
cp -R $SRC/core/units 'cache'

# remove -default suffix as its not default era
for faction in cache/factions/*.cfg; do mv $faction ${faction/-default/}; done

# run wmlindent against cache configs
$SRC/tools/wmlindent 'cache' &> /dev/null

# copy cache configs into editable
cp -R 'cache' 'editable'

# set release patch name
rpatch="backup/release-$RELEASE.patch"

# apply changes that were saved in release patch
if [ -f $rpatch ]; then patch -p1 -d editable/ -i ../$rpatch 2> /dev/null; fi

