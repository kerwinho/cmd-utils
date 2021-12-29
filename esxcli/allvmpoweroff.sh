ssh -x root@$1 esxcli vm process list
# Shutdown all virtual machines
ssh -x root@$1 'for i in $(esxcli vm process list | grep "World ID:" | grep -o "[0-9]*"); do esxcli vm process kill --type=soft --world-id=$i; done;'
