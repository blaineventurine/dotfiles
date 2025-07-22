# Tokyo Night Moon theme colors for Powerlevel10k

# Main prompt colors
typeset -g POWERLEVEL9K_BACKGROUND=236  # Dark blue/black background
typeset -g POWERLEVEL9K_FOREGROUND=189  # Light blue/gray foreground

# Directory colors
typeset -g POWERLEVEL9K_DIR_BACKGROUND=236  # Slightly lighter than background
typeset -g POWERLEVEL9K_DIR_FOREGROUND=117  # Light blue
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=110  # Soft blue
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=116  # Cyan

# Status indicators
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=210  # Soft red
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=236  # Slightly lighter than background

# Command execution time
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=147  # Soft purple/blue
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=236  # Slightly lighter than background

# Background jobs
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=116  # Cyan
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=236  # Slightly lighter than background

# User (normal and root)
typeset -g POWERLEVEL9K_USER_DEFAULT_FOREGROUND=189  # Light blue/gray
typeset -g POWERLEVEL9K_USER_ROOT_FOREGROUND=210  # Soft red

# Host
typeset -g POWERLEVEL9K_HOST_LOCAL_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_HOST_REMOTE_FOREGROUND=216  # Soft orange

# Context (user@host)
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=189  # Light blue/gray
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=210  # Soft red
typeset -g POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=216  # Soft orange

# Time
typeset -g POWERLEVEL9K_TIME_FOREGROUND=147  # Soft purple/blue
typeset -g POWERLEVEL9K_TIME_BACKGROUND=236  # Slightly lighter than background

# Battery
typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=210  # Soft red
typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=189  # Light blue/gray

# Load
typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=216  # Soft orange
typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=210  # Soft red

# Vi mode
typeset -g POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=116  # Cyan
typeset -g POWERLEVEL9K_VI_MODE_VISUAL_FOREGROUND=216  # Soft orange
typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_FOREGROUND=210  # Soft red

# Mise tool colors
typeset -g POWERLEVEL9K_MISE_FOREGROUND=189  # Default color (light blue/gray)

typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_FOREGROUND=183  # Soft purple
typeset -g POWERLEVEL9K_MISE_ELIXIR_FOREGROUND=213  # Pink/purple
typeset -g POWERLEVEL9K_MISE_ERLANG_FOREGROUND=210  # Soft red
typeset -g POWERLEVEL9K_MISE_FLUTTER_FOREGROUND=117  # Light blue
typeset -g POWERLEVEL9K_MISE_GOLANG_FOREGROUND=116  # Cyan
typeset -g POWERLEVEL9K_MISE_HASKELL_FOREGROUND=216  # Soft orange
typeset -g POWERLEVEL9K_MISE_JAVA_FOREGROUND=110  # Soft blue
typeset -g POWERLEVEL9K_MISE_JULIA_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_MISE_LUA_FOREGROUND=117  # Light blue
typeset -g POWERLEVEL9K_MISE_NODEJS_FOREGROUND=150  # Soft green
typeset -g POWERLEVEL9K_MISE_PERL_FOREGROUND=147  # Soft purple/blue
typeset -g POWERLEVEL9K_MISE_PHP_FOREGROUND=176  # Muted purple
typeset -g POWERLEVEL9K_MISE_POSTGRES_FOREGROUND=110  # Soft blue
typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=116  # Cyan
typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=210  # Soft red (ruby color)
typeset -g POWERLEVEL9K_MISE_RUST_FOREGROUND=216  # Soft orange (rust color)

# Prompt separators
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%F{238}\uE0B1%f'
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{238}\uE0B3%f'
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'

# Prompt heads
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{238}╭─%f'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰─%f'

# Transient prompt
# typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir

