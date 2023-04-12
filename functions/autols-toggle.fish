function autols-toggle --description "toggle autols"
    # test if the proper number of arguments is parsed to the function.
    # Only one argument should be given. (on, off, -h, --help)
    

    set argv_count (count $argv)
    if test $argv_count -eq 0
        if set -q _autols_toggle_status
            set --query _autols_toggle_status; and set --erase _autols_toggle_status
            echo -e "\tautols is turned off!"
        else
            set --query _autols_toggle_status; or set -Ux _autols_toggle_status 
            echo -e "\tautols is turned on!"
        end
        return 0

    else if test ! $argv_count -eq 1
        echo -e "error:\tto many arguments parsed to function."
        echo "see --help for information of how to use function."
        return -1
    else 
        switch $argv[1]
            case "on"
                set --query _autols_toggle_status; or set -Ux _autols_toggle_status 
                echo -e "\tautols has been turned on!"
            case "off"
                set --query _autols_toggle_status; and set --erase _autols_toggle_status
                echo -e "\tautols has been turned off!"
            case "-h" "--help"
                _autols::help
        end 
    end
end

function _autols::help --description "print help message for autols-toggle"

set -l options "\t\twithout any options it acts like a toggle\non \t\tturn autols on
off\t\tturn autols off
-h | --help\tShow this help message"
set -l author "Kristoffer Sørensen, Jurek Nitschky" 
set -l origin "https://github.com/Kristoffer-PBS/autols-fish"
set -l repo "https://github.com/jurek-nky/autols-fish"
echo -e "autols-fish - a small plugin that automatically invokes ls whenever you enter a new directory.\n"
echo -e "usage:\tautols-toggle [<>|on|off]\n\noptions:\n$options\n"
echo -e "author:\t\t$author"
echo -e "repo:\t\t$repo"
echo -e "original repo:\t$origin"
end

