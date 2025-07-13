# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

source ~/anaconda3/etc/profile.d/conda.sh

MY_CONFIGURATION_FILE="/home/dimits/scripts/aueb.ovpn"
alias start_vpn="openvpn3 session-start --config ${MY_CONFIGURATION_FILE}"
alias stop_vpn="openvpn3 session-manage --config ${MY_CONFIGURATION_FILE} --disconnect"
