if status is-interactive
	alias c="clear"
	alias f="set img (ls ~/Pictures/fastfetch-random/*.{jpg,png,jpeg,webp} 2>/dev/null | shuf | head -n1); fastfetch --logo \$img --logo-type kitty --logo-width 30"
	alias cf="clear && f"
	alias lt="eza --tree --level=2 --icons"
	alias ls="eza --icons"
end

# Created by `pipx` on 2025-12-27 13:31:29
set PATH $PATH /home/cyp/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/cyp/miniconda3/bin/conda
    eval /home/cyp/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/cyp/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/cyp/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/cyp/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

starship init fish | source
