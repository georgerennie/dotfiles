function fish_greeting
    echo -n "🚀🦧🌽 "
    set_color green
    echo -n (date "+%H:%M: ")
    set_color blue -u
    echo -n (pwd)
    set_color normal
    echo " 🌽🦧🚀"
end

set FISH_EMOJI_LIST 🤣😆😋😎😙😗🙄😣😮🥱😫😌😛🤤😔😬😱🤠\
👻🙈🙉🙊🐵🦍🦧🐒🐈🐫🐪🐐🐑🐏🐖🦥🐬🐳🐋🐟🐠🐡🦐🦑🐙🦞🦀🐞\
👀👄👅🎈🎆🎇🧨✨🎉🎊🎃🎵🎶🎸🪕🎻🎹🥁🍕🥓🌈🌞🧡💛💚💙💜🤎\
💖💦💤
set FISH_EMOJI_LIST_LENGTH (string length $FISH_EMOJI_LIST)

function fish_prompt
    set emoji_index (math (random) % $FISH_EMOJI_LIST_LENGTH + 1)
    echo -n (string sub -s $emoji_index -l 1 $FISH_EMOJI_LIST)

    set_color green
    echo -n ":"

    set_color 00AEFF

    # Prompt with the current directory name
    if test "$PWD" != "/"
        if test "$PWD" != "$HOME"
            echo -n (basename $PWD)"/ "
        else
            echo -n "~/ "
        end
    else
        echo -n "/ "
    end

    set_color normal
end

# Check for existence of a command, telling the user how to install it
# if it doesnt exist, and returning an appropriate status code for use
# in an if statement
function check_for -d "check_for <tool> <install_command>"
    if type -q $argv[1]
        return 0
    else
        echo (set_color FFA500)$argv[1] not installed: \
            (set_color normal)consider installing it with \
            (set_color 00AEFF)$argv[2]
        return 1
    end
end

# Prefer exa to ls/tree if possible
if check_for exa "cargo install exa"
    abbr -a -g ls exa
    abbr -a -g tree "exa -T"
end

# Prefer ripgrep to grep if possible
if check_for rg "cargo install ripgrep"
    abbr -a -g grep rg
end

# Prefer bat to cat if possible
if check_for bat "cargo install bat"
    abbr -a -g cat bat
end

# Prevent check_for appearing externally
functions -e check_for

# If on my wsl computer with the code_ee folder, use ce as a shortcut
if test -d /d/code_ee/
    abbr -a -g ce "cd /d/code_ee/"
end

# Created a temporary directory and cd to it
function mktemp
    cd (command mktemp -d)
end

# Git commit with message
function gcm
    git commit -m "$argv"
end

# Use python3 as default python
if type -q python3
    abbr -a -g python python3
end

# hmmmm
abbr -a -g maths math

# map :x and :q to exit in fish lol
function :x
    exit
end
function :q
    exit
end

# Add cless function to pipe the output of the following command into coloured
# less. doesnt expand abbreviations correctly 😢
if type -q less && type -q unbuffer
    function cless
        unbuffer $argv | less -R
    end
end

function uwu
    $argv | sed "s/[lr]/w/g;s/n\([aeiou]\)/ny\1/g;s/v/ff/g"
end

set fish_color_command blue
