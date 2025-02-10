# Backup Script with Rotation

## Overview
This Bash script automates the backup process for a specified directory. It creates a timestamped backup folder and ensures that only the last three backups are retained, deleting older backups automatically.

## Features
- Creates a backup of the specified directory with a timestamp.
- Stores backups within the same directory.
- Automatically removes older backups, keeping only the last three.
- Uses `rsync` to copy files efficiently, avoiding redundant data transfer.

## Prerequisites
Ensure that `rsync` is installed on your system. If it's not installed, you can install it using:
```sh
sudo apt install rsync   # For Debian/Ubuntu
sudo yum install rsync   # For RHEL/CentOS
```

## Usage
Run the script with the directory path as an argument:
```sh
./backup_with_rotation.sh /path/to/directory
```

### Example Execution
#### First Run (2023-07-30):
```sh
$ ./backup_with_rotation.sh /home/user/documents
```
Output:
```
Backup for: /home/user/documents
Backup completed at: /home/user/documents/backups_2023-07-30_12-30-45
```

#### Subsequent Run (2023-08-01):
```sh
$ ./backup_with_rotation.sh /home/user/documents
```
Output:
```
Backup for: /home/user/documents
Backup completed at: /home/user/documents/backups_2023-08-01_09-15-30
🗑 Removing 1 old backup(s)...
❌ Deleting: /home/user/documents/backups_2023-07-30_12-30-45
```

After execution, the directory will contain:
```
/home/user/documents/
├── backups_2023-07-30_15-20-10
├── backups_2023-07-30_18-40-55
├── backups_2023-08-01_09-15-30
├── file1.txt
├── file2.txt
...
```

## Script Breakdown
1. **Argument Validation:** Checks if the user has provided a directory path.
2. **Timestamped Backup Creation:** Generates a backup folder with a timestamp.
3. **File Copying:** Uses `rsync` to copy files while excluding previous backups.
4. **Old Backup Removal:** Keeps only the last three backups and deletes the oldest ones.
5. **Backup Listing:** Displays the available backups after execution.

## Error Handling
- If no directory is provided, the script exits with an error.
- If the specified directory does not exist, the script exits with an error.
- The script handles errors in backup creation and file copying by checking directory existence.

## License
This script is provided as-is, without any warranty. Feel free to modify and use it as needed.

## Author
Subhankar Paul

