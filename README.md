How to Use
-------------------------------------------------
### Prerequisites
Vim74 compiled with python support:

```
cd vim74/src/
./configure --enable-pythoninterp
make
make install
```

### Installation
After cloning the repository with recursion, symlink vimrc file:

```
ln -s .vim/vimrc .vimrc
```

Then launch Vim, run `<leader>p`(leader key remapped to comma) to install plugins with [Vundle](https://github.com/VundleVim/Vundle.vim).

Plugin [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) needs additional compiling:

```
cd .vim/bundle/YouCompleteMe
python install.py
```
