# Neovim 配置介绍
==========================

该项目主要是本人正在使用的neovim配置，主要基于 [nvimrc-tutorial](https://github.com/aMonst/nvimrc-tutorial) 这么一个教学项目。为了与之前的教程对应，nvimrc-tutorial 会随着教程的更新而更新，而该项目会根据我自身的使用习惯随时调整

## 使用方法

1. 使用git安装配置到 ~/.config/nvim 目录下
```shell
git clone https://github.com/aMonst/my-nvimrc.git ~/.config/nvim
```

2. 安装packer 插件，用于后续做插件管理
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

3. 打开Nvim，并使用命令安装对应插件
```shell
:PackerInstall
```

