# Set prompt options
let add_newline = false
let right_format = "[$cmd_duration]"
let format = """
$username$hostname$directory
$character
"""

# Configure character module
let character.success_symbol = "[🭧🭒](bold fg:blue)[ ➜ ](bold bg:blue fg:#000000)[](bold fg:blue)"
let character.error_symbol = "[🭧🭒](bold fg:red)[ ✗ ](bold bg:red fg:#000000)[](bold fg:red)"

# Disable package module
config disable package

# Configure git modules
config git_branch symbol " "
config git_branch truncation_length 4
config git_branch truncation_symbol ""

config git_commit commit_hash_length 4
config git_commit tag_symbol " "

config git_state format "[\($state( $progress_current of $progress_total)\)]($style) "
config git_state cherry_pick "[ PICKING](bold red)"

config git_status conflicted "  "
config git_status ahead "  "
config git_status behind "  "
config git_status diverged "  "
config git_status untracked "  ‍"
config git_status stashed "  "
config git_status modified "  "
config git_status staged '[++\($count\)](blue)'
config git_status renamed " ✍️ "
config git_status deleted "  "

# Configure hostname module
config hostname ssh_only false
config hostname format "[ ](bold bg:yellow fg:blue)[$hostname](bg:yellow bold fg:#000000)[ ](bold fg:yellow bg:green)"
config hostname trim_at ".companyname.com"

# Disable line_break module
config disable line_break

# Disable memory_usage module
config disable memory_usage

# Disable time module
config disable time

# Configure username module
config username style_user "bold bg:blue fg:#000000"
config username style_root "red bold"
config username format "[🭃](bold fg:blue)[$user]($style)"
config username show_always true

# Configure directory module
config directory home_symbol " "
config directory read_only "  "
config directory style "bold bg:green fg:#000000"
config directory truncation_length 2
config directory truncation_symbol "./"
config directory format '[$path]($style)[🭞](fg:green )'

config directory add_substitutions "Documents" " " "/" "  " "Downloads" " " "Music" " " "Pictures" " "

# Configure cmd_duration module
config cmd_duration min_time 0
config cmd_duration format '[🬈🬖🬥🬅 ](bold bg:cyan fg:#000000)[time:$duration](bold bg:cyan fg:#000000)[ 🬖🬥🬔🬗](bold bg:cyan fg:#000000)'
