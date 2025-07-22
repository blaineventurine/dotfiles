() {
  function prompt_mise() {
    # Get all active tools from mise
    local raw_output=$(mise ls --current 2>/dev/null)
    
    local lines=("${(@f)raw_output}")
    local i=0
    local max=${#lines}
    
    while (( i < max )); do
      local line="${lines[i+1]}"  # Zsh arrays are 1-indexed
      
      # Check if this is a tool line (no indentation)
      if [[ "$line" =~ ^[[:alnum:]]+ ]]; then
        # Extract tool and version
        local parts=("${(@s/ /)line}")
        local tool="${parts[1]}"
        local version="${parts[-1]}"  # Last element is the version
        
        # Skip symlinks and global configs
        if [[ "$line" != *"(symlink)"* && "$line" != *"~/.config/mise/config.toml"* ]]; then
          # Only show tools with local versions
          if [[ "$line" == *".tool-versions"* ]]; then
            local tool_upper=${(U)tool}
            p10k segment -r -i "${tool_upper}_ICON" -s "$tool" -t "$version"
          fi
        fi
      fi
      
      (( i++ ))
    done
  }

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}
