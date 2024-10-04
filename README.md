# Config files

### The purpose of this is to aggregate my current config files within a shared directory on windows. This is supposed to mimick the behavior of the *.config* directory on linux machines.

Symlink nvim/ to $env:LOCALAPPDATA\Local\nvim
Symlink PowerShell ps1 to $env:USERPROFILE\Documents\PowerShell

Currently I am just copying the file from the Windows Terminal local app data directory to this repo, I still need to figure this one out.

Change komorebi home directory to this config: `$Env:KOMOREBI_CONFIG_HOME = Join-Path -P $env:USERPROFILE -ChildPath '\config\komorebi\'`

.wezterm.lua belongs in home directory, create a symlink for that.


Windows Terminal
Komorebi
Neovim
git
CMake
LLVM (set a PATH to bin/ dir for clang /Program Files/LLVM/bin)
VS Studio Build tools, problems with LLVM
nodejs
python3
tree-sitter-cli (npm install -g tree-sitter-cli)

```bash
winget install Git.Git OpenJS.NodeJS LLVM.LLVM LGUG2Z.komorebi Neovim.Neovim LGUG2Z.whkd Obsidian.Obsidian Anki.Anki junegunn.fzf Python.Python.3.11 BurntSushi.ripgrep.MSVC SumatraPDF.SumatraPDF Microsoft.WindowsTerminal Kitware.CMake
```
### Linux

This part is pretty self-explaintory, clone this repo to be the *.config* directory

Follow the checkhealth installs for nvim
