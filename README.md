# ***vim-interfaces***

## Local Installation with Pathogen

### [Pathogen](https://github.com/tpope/vim-pathogen)

Install Pathogen to ~/.vim/autoload/pathogen.vim. Or copy and paste the following into your terminal/shell:

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

### Your .vimrc

Add the following line in your `.vimrc` file

```bash
execute pathogen#infect()
syntax on
filetype plugin indent on
```

### vim-interface installation

- Clone the repository from `/.vim/bundle` directory


## Global installation 

You must copy the content of  `ftdetect`, `ftplugin` and `syntax` directories to their equivalent in `/usr/share/vim/vim81` directory.


