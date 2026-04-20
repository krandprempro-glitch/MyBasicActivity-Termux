#!/data/data/com.termux/files/usr/bin/bash

echo ""
echo "========================================="
echo "   MyBasicActivity - Linux Installer"
echo "========================================="
echo ""

# تحديث الحزم
echo "[1/3] Updating packages..."
pkg update -y && pkg upgrade -y

# تثبيت proot-distro
echo "[2/3] Installing proot-distro..."
pkg install proot-distro -y

# تثبيت Ubuntu
echo "[3/3] Installing Ubuntu (first time only)..."
if [ ! -d "$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu" ]; then
    proot-distro install ubuntu
else
    echo "Ubuntu already installed."
fi

# تشغيل Ubuntu
echo ""
echo "========================================="
echo "   Starting Ubuntu Linux"
echo "   Type 'exit' to return to Termux"
echo "========================================="
echo ""
proot-distro login ubuntu
