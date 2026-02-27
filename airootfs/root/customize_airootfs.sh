#!/bin/bash
set -e

systemctl enable gdm
systemctl enable NetworkManager

if ! id "live" &>/dev/null; then
    useradd -m -G wheel,audio,video,storage -s /bin/bash live
    passwd -d live
fi

echo "live ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/live
chmod 440 /etc/sudoers.d/live

sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

mkdir -p /etc/gdm
cat > /etc/gdm/custom.conf <<EOF
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=live
EOF

systemctl set-default graphical.target

dconf update
