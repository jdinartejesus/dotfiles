#TODO: Fix OMF Path to be adjustable!

# Path to Oh My Fish install.
set -gx OMF_PATH /Users/dinartejesus/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/dinartejesus/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

#TODO: Fix need for nvm fish installation!
test -s /Users/dinartejesus/.nvm-fish/nvm.fish; and source /Users/dinartejesus/.nvm-fish/nvm.fish
