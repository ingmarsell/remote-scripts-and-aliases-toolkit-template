# Remote Scripts and Aliases Toolkit Template

This template is designed to simplify and automate the process of remotely connecting to and managing servers or other devices running Ubuntu. It provides a structured way to organize SSH configurations, scripts, and shell aliases, making remote operations more efficient and shareable within teams.

## Key Features

- **Scripts and Aliases**: Provides a system of creating and sharing scripts and aliases that streamline workflow efficiency by automating routine tasks and simplifying complex commands.
- **SSH Configuration and Remote Aliases**: Offers a system for managing SSH configurations and remote aliases that enhance security and connectivity, enabling seamless access to remote servers without the hassle of remembering complex commands or IP addresses.
- **Customizable and Shareable**: The template is designed for easy customization and sharing, allowing teams to extend the toolkit with their scripts and configurations.
- **Supports Multiple Shells**: Includes setup for both bash and zsh shells, ensuring compatibility across different user environments.


## Getting Started

### Prerequisites

- A machine running Ubuntu or similar
- Git

### Installation

1. **Clone the Repository**: Start by cloning this template repository to your local machine.

    ```bash
    git clone <template-repository-url>
    ```

2. **Run the Installation Script**: Navigate to the cloned directory and execute the `install.sh` script. This script sets up the necessary configurations, scripts, and aliases on your system.

    ```bash
    cd <cloned-template-directory>
    ./install.sh
    ```

3. **Reload Your Shell**: Apply the changes by reloading your shell environment.

### Customization

- **Aliases**: Add your custom aliases to `aliases/bash_aliases` and `aliases/zsh_aliases` for them to be automatically applied
- **Scripts**: Add bash scripts to the `scripts` folder to automate repeditive tasks. They will be accessible from anywhere through PATH
- **SSH Configuration**: Add your SSH configs to the  `ssh/config` file to simplify the process of connecting to remote machines.
- **Remote aliases**: Customize remote aliases in `ssh/.sshrc` to define aliases that will automatically work on a remote machines, when using the `sshrc` script for connection

## Usage

1. Add an accessible server to `ssh/config` under the host `sample-server`
2. Run a local sample alias that runs a script that connects to the previously defined `sample-server`

```bash
$ sample_alias
```
3. On the remote server run a sample remote alias that returns the current date
```bash
$ sample_remote_alias
```

## Uninstallation

1. **Run the Uninstallation Script**: Navigate to the repository directory and execute the `uninstall.sh` script.

```bash
cd <cloned-template-directory>
./uninstall.sh
```

2. **Reload Your Shell**: Apply the changes by reloading your shell environment.

