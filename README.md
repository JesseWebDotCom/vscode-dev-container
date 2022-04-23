
# vscode-dev-container

This is my personal, fully configured dev environment for python, powershell, shell coding and more (Markdown, YAML, TOML, etc). Its optimized to ease development and provide beautiful code (replacing other IDE's like Pycharm, Windows PowerShell ISE, etc).

FYI - Using this dev container for Python development and code execution is 10x faster than PyCharm Community Edition.

## Language Enhancements
<!-- markdownlint-disable MD033 -->
<table><tr><td>Language</td><td>Enhancements</td></tr>
<tr><td>Markdown</td><td><ul><li>Auto-Preview</li><li>Formatting (markdownlint)</li><li>Linting (markdownlint)</li><li>More...</li></ul></td></tr>
<tr><td>Python</td><td><ul><li>Auto-REPL</li><li>Documenting (autoDocstring)</li><li>Execution (code runner)</li><li>Formatting (black, autopep8, yapf)</li><li>Intellisense (pylance, type hints)</li><li>Linting (mypy, bandit, flake8, pylint, pycodestyle)</li><li>Testing (pytest)</li><li>More...</li></ul></td></tr>
<tr><td>PowerShell</td><td><ul><li>Execution (code runner)</li><li>Formatting (powershell)</li><li>Intellisense (powershell)</li><li>Linting (psscriptanalyzer)</td></tr>
<tr><td>Shell</td><td><ul><li>Debugging (bash debug)</li><li>Intellisense (bash ide)</li><li>Linting (shell-check)</li><li>Testing (tbd)</li><li>More...</li></ul></td></tr>
<tr><td>TOML</td><td><ul><li>Formatting (prettier toml)</li><li>Linting (better toml)</li><li>More...</li></ul></td></tr>
<tr><td>YAML</td><td><ul><li>Formatting (red hat)</li><li>Linting (red hat)</li><li>More...</li></ul></td></tr>
<tr><td>Other</td><td><ul><li>Formatting (prettier)</li><li>More...</li></ul></td></tr>
</table>

## IDE Enhancements

* Standard and customizable Run button across all executable file types
* TODOs tree
* Task explorer
* Icons for files/folders in explorer view
* More

## Terminal Enhancements

* Defaults to bash
* Support for bash, pwsh, and zsh
* Standard prompt and theming through [oh-my-posh](https://ohmyposh.dev)
* -NoLogo PowerShell terminal
* More

## Tools & Tasks

* **Create projects from templates** - tools/project_create.py
* Misc helper scripts (ex. delete all docker containers/images)
* Key tools are accessible directly through vs code tasks
* Standardized, formatted, color output logging

## Screenshots

### Python

![AREPL](docs/img/python_arepl.gif)

### Linting

![Linting](docs/img/linting.png)

### Terminals

Bash
![Bash Terminal](docs/img/terminal_bash.png)
ZSH
![ZSH Terminal](docs/img/terminal_zsh.png)
PWSH
![PWSH Terminal](docs/img/terminal_pwsh.png)

### Explorer

![Explorer Icons](docs/img/explorer_icons.png)
![Task Explorer](docs/img/explorer_tasks.png)

## Configuration

While this environment and settings work for me, they may not be ideal for everyone. For example, you may need to set a different time zone, use a different terminal theme, or install some additional packages into the container. While you could directly modify the default install script and environment file that controls these things, those files would then be out of sync with this repo (making it difficult for you to use updated versions as I post them). Instead, create and use customization files.

### Defaults

These files contain the core configurations for the container and should not be modified.

* .devcontainer/build/setup_container.sh - installs default packages (ex. powershell) and configurations (ex. extension caching)
* .devcontainer/build/variables.env - sets time zone, PowerShell version, etc.

## Customizations

These files allow you to customize the container with customizations like setting your desired time zone, terminal theme, container & python package installs, etc. You may leave them blank if you do not have any customizations but they need to be present to prevent the container build from failing.

* .devcontainer/customize/setup_container.sh - add custom commands needed for your project (ex. install packages). These commands will be run after .devcontainer/build/setup_container.sh is run.
  * TIP: Call tools/project_create.py (with the desired parameters) to auto create your project structure
  * TIP: For python projects, call to install your requirements and constraints (ex. pip3 install -r requirements.txt -c constraints.txt)
}

* .devcontainer/customize/variables.env - set your time zone, desired PowerShell version, etc. The variables here will be merged with and override variables found in the devcontainer.json.

## Installation

This setup utilizes a [dev container](https://code.visualstudio.com/docs/remote/containers) to configure the entire environment. So, we simply need VS Code, Docker Desktop, and the code from this repo.

1. Install [VS Code](https://code.visualstudio.com/download) and install the [Remote-Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Clone this repo and create/configure the [customziation files](#customizations) as needed (they can be blank but must be present)
3. Install [Docker Desktop](https://docs.docker.com/get-docker/) and configure its settings to start at login
4. Run `tools/host_setup.sh` (from your host system, not from within vs code) and then restart vs code to install the required font and properly display terminal prompts (currently OSX only)
5. Start VS Code, run the Remote-Containers: Open Folder in Container... command from the Command Palette (F1) or quick actions Status bar item, and select the cloned repo folder.

## HOWTO

### Create a project from a template

When creating new projects, you typically end up manually creating the same folders (ex. src/proj/your_project)
and files (ex. readme.md, requirements.txt, src/proj/your_project/**init**.py, etc.). You also have to manually
add the same data to some of the project files (ex. project name at the top of the readme.md).

Instead, you can automatically create a new project with a template:

1. Find or create your desired template in /templates (see included ones for examples)
2. Run `tools/project_create.py` (with the desired parameters) OR run the VS Code task `Projects: Create`

## Issues

* This environment has only been validated on a mac. It will not work on other operating systems like Windows until I get around to making it compatible.
* If your terminal fonts look weird and or you see a popup stating `The terminal only Supports monospace fonts`, run `tools/host_setup.sh` (from your host system, not from within vs code) and then restart vs code to install the required font and properly display terminal prompts (currently OSX only)
* Naming a source code subfolder "py" will break test discovery. This seems to be a [known issue](https://github.com/microsoft/vscode-python/issues/17414.)
