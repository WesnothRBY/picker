#!/bin/bash

# read settings and functions
source 'config'
source 'helper'

# check if cache and editable directories exist
if [ ! -d 'cache' ] || [ ! -d 'editable' ] ; then
  display_message 'Run prepare script first' ; exit
fi

# display whats going on
display_message 'Building era'

# set root path variable
rpath='../../eras/dev'

# process faction configs
for infile in $(find editable/factions -name *.cfg) ; do
  outfile=$rpath/${infile/editable/}
  mkdir -p $(dirname $outfile) && touch $outfile

  while IFS= read line ; do
    if line_match "$line" "id"
      then line_replace "$line" "id"

    elif line_match "$line" "leader"
      then line_replace "$line" "leader"

    elif line_match "$line" "random_leader"
      then line_replace "$line" "random_leader"

    elif line_match "$line" "recruit"
      then line_replace "$line" "recruit"

    elif line_match "$line" "type"
      then line_replace "$line" "type"

    else
      echo "$line"
    fi
  done < $infile > $outfile
done

# process unit configs
for infile in $(find editable/units -name *.cfg) ; do
  outfile=$rpath/${infile/editable/}
  mkdir -p $(dirname $outfile) && touch $outfile

  while IFS= read line ; do
    if line_match "$line" "advances_to"
      then line_replace "$line" "advances_to"

    elif line_match "$line" "id"
      then line_replace "$line" "id"

    else
      echo "$line"
    fi
  done < $infile > $outfile
done

# process era config template
config=$rpath/../${NAME// /_}.cfg
cp default.tpl $config && sed -i "s/PLACEHOLDER/$NAME $RELEASE/g" $config

# set release patch name
rpatch="backup/release-$RELEASE.patch"

# save current state in release patch
save_patch $rpatch

# remove unneeded directories
rm -fr cache/ editable/

