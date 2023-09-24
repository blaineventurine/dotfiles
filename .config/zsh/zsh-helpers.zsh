# TODO: move all of this to ~/bin
light-mode() {
  kitty +kitten themes --reload-in=all Tokyo Night Day
}

dark-mode() {
  kitty +kitten themes --reload-in=all Tokyo Night Moon
}
# this will clone a remote notebook
# `clone-notebook canary` will clone the canary notebook
clone-notebook() {
  nb notebooks add "$1" git@github.com:blaineventurine/notes.git "$1"
}

nb-list() {
  nb list -t note --no-color |  sed -r 's/\[//' | sed -r 's/\]//' |
  fzf --height 50% \
    --preview "nb show -p {1} | head -n 200 | bat -l md" \
    --bind "alt-j:preview-down,alt-k:preview-up,alt-d:preview-page-down,alt-u:preview-page-up" \
    --preview-window=right:70% |
  cut -d$' ' -f1
}

nb-edit() {
  nb e "$(nb-list)"
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
