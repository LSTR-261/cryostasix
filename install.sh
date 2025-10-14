set -e

printf "Flake:" "$1" "\nDisk: "$2" "

# Wait for User to confirm
while true; do
  read -r -p "Press Enter to descend..." key
  if [[ -z "$key" ]]; then
    break
  fi
done

printf "You've stranded on \nThe Shores of Oblivion\n"

sudo nixos-generate-config --no-filesystems --show-hardware-config >./hosts/"$1"/hardware-configuration.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./hosts/"$1"/disko-config.nix --yes-wipe-all-disks
sudo nixos-install --flake ".#$1"
