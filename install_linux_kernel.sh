cd linux
make O=/home/panda/git/build/kernel -j 4 &> /tmp/kernel.log
sudo make O=/home/panda/git/build/kernel modules_install install &> /tmp/kernel.log
sudo update-grub2
echo "compile kernel done" | mail -s "[LOG] kernel compile done" mengxu@vmware.com
