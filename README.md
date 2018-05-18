How to Use
-------------------------------------------------
### Prerequisites
Vim80 compiled with python support:

    cd vim/src/
    ./configure --enable-pythoninterp
    make
    make install

### Installation
After cloning the repository with recursion, symlink vimrc file:

    ln -s .vim/vimrc .vimrc

Then launch Vim, run `<leader>p`(leader key remapped to comma) to install plugins with [Vundle](https://github.com/VundleVim/Vundle.vim).

Plugin [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) needs additional compiling:

    cd .vim/bundle/YouCompleteMe
    python install.py

### Markdown
Markdown file can be rendered and auto-refreshed on write, which relies on [pandoc](http://pandoc.org/) and [browser-sync](https://www.browsersync.io/):

    brew install pandoc node.js
    npm install -g browser-sync
