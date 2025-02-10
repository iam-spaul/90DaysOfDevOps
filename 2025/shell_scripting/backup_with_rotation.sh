#!/bin/bash



<<info
this script for the backup
info





# Check if the user provided an argument
if [ "$1" != "" ]; then
    echo "Backup for: $1"
else
    echo "Please provide a directory path"
    exit 1  # Exit the script if no path is given
fi

# Create a timestamped backup folder
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
target_dir="${1%/}"  #removing trailing slash
backup_dir="${target_dir}/backups_${timestamp}"


if [ ! -d "$target_dir" ];then
	echo "target dir not present"
	exit 1

fi

mkdir -p "$backup_dir"

# Copy files (fixing directory recursion issue)
rsync -a --exclude="backups_*" "$target_dir/" "$backup_dir/"
#cp "$target_dir/" "$backup_dir/"

echo "Backup completed at: $backup_dir"



# 🔄 Keep only the last 3 backups
backups=($(ls -d "$target_dir/backups_"* 2>/dev/null | sort))
if [ ${#backups[@]} -gt 3 ]; then
    remove_count=$(( ${#backups[@]} - 3 ))
    echo "🗑 Removing $remove_count old backup(s)..."
    for (( i=0; i<remove_count; i++ )); do
        echo "❌ Deleting: ${backups[$i]}"
        rm -rf "${backups[$i]}"
    done
fi

# 📌 Show the latest backups
echo -e "\n📂 Current backups:"
ls -d "$target_dir/backups_"* 2>/dev/null | sort -r | xargs -n 1 basename
