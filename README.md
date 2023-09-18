## Photoshop Settings Backup Tool

### Description:

This tool is designed to create backups of your Adobe Photoshop settings on macOS. With it, you can save your brushes, layer colors, workspaces, and many other user settings.

### Benefits:

- **Safety:** Make backups of your settings before updating Photoshop or macOS.
- **Portability:** Easily transfer your settings to another computer.
- **Time-saving:** Restore your settings in minutes, not hours.

### Interface:

Users will be prompted to:

- Choose a destination path for the backup.
- Select a version of Adobe Photoshop from those installed on the computer.
- Choose a workspace to copy (default is `xd0`).

### Status Indicators:

- 🟢: Action completed successfully.
- 🔥: An error occurred.

### Compatibility:

- Works on macOS.
- Designed for versions of Adobe Photoshop installed in the standard applications directory.

### How to Use:

1. **Downloading the Tool:**

   - Open the terminal on your computer.
   - Enter the command:
     ```bash
     git clone [YOUR_GITHUB_REPOSITORY_LINK]
     ```
   - Navigate to the directory with the tool using the command

      ```bash
      cd PhotoshopSettingsBackupTool
      ```

2. **Running the Tool:**
   - Grant the tool execution permissions with the command:
     ```bash
     chmod +x PhotoshopSettingsBackupTool.sh
     ```
   - Run the tool with the command:
     ```bash
     ./PhotoshopSettingsBackupTool.sh
     ```
   - Follow the on-screen instructions.

### Notes:

- For beginners: If you're unfamiliar with using the terminal, find a beginner's guide to its use and familiarize yourself with the basics.
