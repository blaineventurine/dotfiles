() {
function prompt_mise() {
 # Cache the mise output to avoid running it on every prompt refresh
  local cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-mise-cache"
  local cache_timeout=300  # 5 minutes in seconds
  
  # Check if cache exists and is recent enough
  if [[ -f "$cache_file" && $(( $(date +%s) - $(stat -f %m "$cache_file" 2>/dev/null || stat -c %Y "$cache_file" 2>/dev/null) )) -lt $cache_timeout ]]; then
    local plugins=("${(@f)$(cat "$cache_file")}")
  else
    # Update the cache
    mise ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $1, $2}' > "$cache_file"
    local plugins=("${(@f)$(cat "$cache_file")}")
  fi

  local plugin
  for plugin in "${(k)plugins}"; do
    local parts=("${(@s/ /)plugin}")
    local tool=${(U)parts[1]}
    local version=${parts[2]}
    p10k segment -r -i "${tool}_ICON" -s "$tool" -t "$version"
  done
}
  typeset -g POWERLEVEL9K_MISE_FOREGROUND=66

  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_FOREGROUND=134
  typeset -g POWERLEVEL9K_MISE_ELIXIR_FOREGROUND=129
  typeset -g POWERLEVEL9K_MISE_ERLANG_FOREGROUND=125
  typeset -g POWERLEVEL9K_MISE_FLUTTER_FOREGROUND=38
  typeset -g POWERLEVEL9K_MISE_GOLANG_FOREGROUND=37
  typeset -g POWERLEVEL9K_MISE_HASKELL_FOREGROUND=172
  typeset -g POWERLEVEL9K_MISE_JAVA_FOREGROUND=32
  typeset -g POWERLEVEL9K_MISE_JULIA_FOREGROUND=70
  typeset -g POWERLEVEL9K_MISE_LUA_FOREGROUND=32
  typeset -g POWERLEVEL9K_MISE_NODEJS_FOREGROUND=70
  typeset -g POWERLEVEL9K_MISE_PERL_FOREGROUND=67
  typeset -g POWERLEVEL9K_MISE_PHP_FOREGROUND=99
  typeset -g POWERLEVEL9K_MISE_POSTGRES_FOREGROUND=31
  typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=37
  typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=168
  typeset -g POWERLEVEL9K_MISE_RUST_FOREGROUND=37

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}
