
# /etc/pacman.d/mirrorlist
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak_$(date +%m%d_%H:%M:%D)

echo '## Country : China

## tsinghua
Server = https://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch

## ustc
Server = https://mirrors.ustc.edu.cn/manjaro/stable/$repo/$arch

## sjtu
Server = https://mirrors.sjtug.sjtu.edu.cn/manjaro/stable/$repo/$arch' | sudo tee /etc/pacman.d/mirrorlist


# /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf

echo '
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
' | sudo tee -a /etc/pacman.conf

sudo pacman -Syy

sudo pacman -S archlinuxcn-keyring --noconfirm

sudo pacman -Syyu --noconfirm

sudo pacman -S zsh vim git --noconfirm

# oh-my-zsh
#chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i "s/^plugins=(git/& zsh-autosuggestions zsh-syntax-highlighting/" ~/.zshrc
#sed -i "s/^plugins=(.*^)/& git zsh-autosuggestions zsh-syntax-highlighting command-not-found sublime/"

sed -i "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"ys\"/" ~/.zshrc
