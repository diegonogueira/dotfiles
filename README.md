## Instalação

```bash
sudo apt install git zsh stow
```

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
rm -rf ~/.zshrc
git clone git@github.com:diegonogueira/dotfiles .dotfiles
cd .dotfiles
stow git && stow shell && stow zsh && stow oh-my-zsh
```