# Aliases
alias ls='ls -ltra --color'

# Where to find commands
export PATH=\
$HOME/go/bin:\
$HOME/.local/bin:\
$HOME/node_modules/.bin:\
$PATH

# Returns true if a supported agent is spotted on the premises.
has_agents() {
  command -v claude &> /dev/null ||
    command -v copilot &> /dev/null
}

# Give the user a hint on installing guessing machines.
if ! has_agents; then
  printf "No AI agents detected on %s, install them with %s\\n" \
         "${HOSTNAME}" \
         /usr/local/bin/install-agents
fi
