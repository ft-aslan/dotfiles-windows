# Linking Config Files

`New-Item -ItemType SymbolicLink -Path "C:\path\to\target_folder" -Target "C:\path\to\source_folder"`

Replace `"C:\path\to\target_folder"` with the path where you want the symbolic link to be created,
and `"C:\path\to\source_folder"` with the path of the folder you want to link.

Example;
`New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"`

Example for removing links;
`Remove-Item -Path "$env:LOCALAPPDATA\nvim" -Force`

Symlink in Linux;
`ln -s path/to/target_folder path/to/source_folder`
Removing symlink in Linux;
`rm -rf /path/to/symlink`
