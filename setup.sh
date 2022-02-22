#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
/bin/bash -c "$(curl -fsSL https://get.volta.sh)"
/bin/bash -c "$(curl -fsSL https://deno.land/install.sh)"

xcode-select --install

brew install direnv exa fd fx hexyl htop gping starship

cat << EOF

# Aliases
alias cat="bat"
alias ls="exa"
alias ping="gping"
alias top="htop"

# Setup Starship (https://starship.rs/)
eval "$(starship init zsh)"

# Setup Homebrew (https://brew.sh/)
export HOMEBREW_NO_ANALYTICS=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup Deno (https://deno.land/)
export DENO_INSTALL="/Users/federico/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Setup direnv (https://direnv.net)
eval "$(direnv hook zsh)"

# Setup Starship (https://starship.rs/)
eval "$(starship init zsh)"

# Setup Volta (https://volta.sh/)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Setup custom Shell scripts directory
export PATH="$PATH:$HOME/.scripts"

EOF >> ~/.zshrc