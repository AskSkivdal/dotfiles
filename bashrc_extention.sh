alias cat=bat
alias ls="eza --icons"
alias la="eza -a --icons"
alias lr="eza -T"
alias ll="eza -l -b --no-permissions --git --icons"
alias py=python3
alias httpyac="docker run -it -v ${PWD}:/data ghcr.io/anweber/httpyac:latest"
alias flatpaks='echo "flatpak install flathub $(flatpak list --app --columns=application -a | tail -n +1 | tr "\n" " ")"'

alias repl='uv run --with numpy --with pandas --with geopandas python -i .local/bin/scripts/repl_prelude.py'

alias copy='xsel -ib'

mark-danger() {
    printf '\033]11;#3a0000\007'   # dark red background
}
mark-warning() {
    printf '\033]11;#493C00\007'
}
mark-safe() {
    printf '\033]111\007'          # reset background to configured value
}