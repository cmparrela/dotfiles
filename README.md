# macOS Configuration 

This repository is designed to assist you in setting up a new Mac environment, offering an automated method to install commonly used applications, developer tools, and configure shell environments with dotfiles.

## Installation

Before proceeding, ensure that Homebrew is installed on your system. If not, open Terminal and execute the following command:

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Clone this repository to your local machine:

```sh
$ git clone https://github.com/yourusername/yourrepository.git
```

Navigate to the install directory:
```sh
$ cd yourrepository/install
```

Make the installation script executable:
```sh
$ chmod +x install.sh
```

Run the installation script:
```sh
$ ./install.sh
```