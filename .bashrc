#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
alias l='ls -la'

function hypr() {
    if [[ "$1" == "conf" ]]; then
        kate ~/.config/hypr/hyprland.conf
    else
        echo "Usage: hypr conf"
    fi
}
# The "Super Flush" - DNS, RAM, and System Caches
alias flush="sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo systemctl restart systemd-resolved.service && echo 'DNS and RAM Caches Flushed!'"

alias paclean="sudo pacman -Sc && yay -Sc"

alias toys='(kitty --title "Network" bmon -b & disown); sleep 0.3; (kitty --title "Bonsai" sh -c "sleep 0.5 && cbonsai -l -b -o -L 40" & disown); (kitty --title "Pipes" pipes.sh -f 20 -d 100 & disown); sleep 0.3; exec btop'

alias errors='journalctl -p 3 -xb --no-pager'

# Force spotify_player to use a permanent config path
alias spotify_player='spotify_player --config-folder ~/.config/spotify-player'

# The Golden Rule: Check news, check updates, snapshot, then you decide.
alias checkup='echo "--- 1. ARCH NEWS ---" && informant check && echo "--- 2. SYSTEM UPDATES ---" && checkupdates; echo "--- 3. AUR UPDATES ---" && yay -Qua; echo "--- 4. CREATING SNAPSHOT ---" && sudo timeshift --create --comments "PreUpdate" --tags D'

# Quick fix for your keyring issues if they come back
alias fix-keys='sudo pacman-key --init && sudo pacman-key --populate archlinux endeavouros && sudo pacman-key --recv-keys 87DEFA4AB94A99A4C8C3112556C464BAAC421453 && sudo pacman-key --lsign-key 87DEFA4AB94A99A4C8C3112556C464BAAC421453'

alias jb='sudo ~/palera1n-linux-x86_64 -l'

# --- Terminal Aesthetics ---

# Define the Look (The Function)
show_banner() {
    /usr/bin/clear
    DARK_SQUAD=("gengar" "darkrai" "umbreon" "sableye" "mewtwo" "chandelure" "tyranitar" "haunter")
    SELECTED_POKE=${DARK_SQUAD[$RANDOM % ${#DARK_SQUAD[@]}]}

    if command -v pokemon-colorscripts > /dev/null; then
        pokemon-colorscripts -n $SELECTED_POKE --no-title
    fi

    # Your Name in the ORIGINAL font + Dark Purple
    echo -e "\e[1;35m"
    figlet "bsdfgv"
    echo -e "\e[0m"
    echo ""
}

# Run it when you first open the terminal
show_banner

# Override the clear command to use the function
alias clear='show_banner'

# --- File Finder (fzf) ---
# This enables the Ctrl+T and Ctrl+R shortcuts in Bash
if [ -f /usr/share/fzf/key-bindings.bash ]; then
  source /usr/share/fzf/key-bindings.bash
fi

# This enables auto-completion (tabbing) for fzf
if [ -f /usr/share/fzf/completion.bash ]; then
  source /usr/share/fzf/completion.bash
fi

export EDITOR='kate'
alias rice-sync='cd ~/RiceBackup && git add . && git commit -m "Update rice: $(date +%Y-%m-%d_%H:%M)" && git push && cd -'
