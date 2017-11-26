# Install some basic stuff

sudo pacman -Sy --noconfirm python3 ansible
# Setup VIM
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
mkdir -p ~/.vim/undo_files

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
