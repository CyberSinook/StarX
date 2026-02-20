export RUNLEVEL=1

ZSH="/root/.oh-my-zsh"

if [ ! -d "$ZSH" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi

cp $ZSH/templates/zshrc.zsh-template /root/.zshrc

P10K_DIR="$ZSH/custom/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10K_DIR
fi

cp /root/setup/.p10k.zsh /root/.p10k.zsh

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' /root/.zshrc

chsh -s /bin/zsh root