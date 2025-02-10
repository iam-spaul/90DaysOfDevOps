# User Account Management Script

## Overview
This Bash script provides user account management functionalities, including creating, deleting, resetting passwords, and listing users on a Linux system. It uses command-line arguments to perform specific actions efficiently.

## Features
- **User Creation (-c, --create)**: Create a new user account.
- **User Deletion (-d, --delete)**: Delete an existing user account.
- **Password Reset (-r, --reset)**: Reset the password of an existing user.
- **List Users (-l, --list)**: Display all user accounts with their UIDs.
- **Help (-h, --help)**: Show usage information.

## Prerequisites
- Linux-based system
- Root or sudo privileges

## Installation
1. Copy the script to your system.
2. Ensure execution permissions:
   ```bash
   chmod +x user_mgmt.sh
   ```

## Usage
Run the script with the desired option:

```bash
./user_mgmt.sh [OPTIONS]
```

### Available Options
| Option | Description |
|--------|-------------|
| `-c`, `--create` | Create a new user account |
| `-d`, `--delete` | Delete an existing user account |
| `-r`, `--reset` | Reset a user's password |
| `-l`, `--list` | List all user accounts with UIDs |
| `-h`, `--help` | Show help message |

### Examples
#### 1. Create a New User
```bash
./user_mgmt.sh --create
```
*Prompts for username and password, then creates the account.*

#### 2. Delete a User
```bash
./user_mgmt.sh --delete
```
*Prompts for a username and deletes the account if it exists.*

#### 3. Reset Password
```bash
./user_mgmt.sh --reset
```
*Prompts for a username and a new password, then updates it.*

#### 4. List Users
```bash
./user_mgmt.sh --list
```
*Displays all user accounts along with their UIDs.*

#### 5. Show Help
```bash
./user_mgmt.sh --help
```
*Displays usage instructions.*

## Error Handling
- Checks if a user exists before creating, deleting, or resetting passwords.
- Provides appropriate messages for successful or failed operations.

## Notes
- The script uses `sudo` for operations that require administrative privileges.
- It ensures passwords are securely set using the `passwd` command.

## License
This script is open-source and free to use or modify as needed.

