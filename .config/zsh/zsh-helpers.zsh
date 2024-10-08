# TODO: move all of this to ~/bin
light-mode() {
  kitty +kitten themes --reload-in=all Tokyo Night Day
}

dark-mode() {
  kitty +kitten themes --reload-in=all Tokyo Night Moon
}

function ghpr() {
  gh pr list --limit 100 --json number,title,updatedAt,author --template \
    '{{range .}}{{tablerow .number .title .author.name (timeago .updatedAt)}}{{end}}' |
    fzf --height 25% --reverse |
    cut -f1 -d ' ' |
    xargs gh pr checkout
  }

kill-dashboard() {
  pkill -f "AlgoliaWeb" &> /dev/null
  # ps aux | grep "repos/AlgoliaWeb" | awk '{print $2}' | xargs kill -SIGTERM &> /dev/null
  kill $(lsof -wni tcp:3000) &> /dev/null
}

# # stdio encryption and decryption
# encrypt() {
#   openssl aes-256-cbc
# }
# decrypt() {
#   openssl aes-256-cbc -d
# }
encrypt() {
  # $2 is the path to the parent of the folder to encrypt
  # $3 is the name of the subfolder to encrypt
  gpgtar --encrypt \
    --symmetric \
    --output "$3".gpg \
    --gpg-args="--cipher-algo AES256 --passphrase=$(pass "$1") --batch" \
    --directory "$2" \
    "$3" \
    && rm -rf "${2:?}/$3" > /dev/null
}

decrypt() {
  # $2 is the path to decrypt to/path to the file to decrypt
  # $3 is the name of the file to be decrypted
  gpgtar --decrypt \
    --directory "$2" \
    --gpg-args="--passphrase=$(pass "$1") --batch" \
    "$2/$3".gpg \
    && rm -rf "$2/$3".gpg > /dev/null
}
