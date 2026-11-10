A Version & Package Manager for the QuarticC programming language.

---

## Overview

QCM has 2 sections, `tooling` and core.
Tooling commands install and update the compiler version, while core installs packages.

---

## Why Use QCM?

`qcm` to C⁴ is equivelent to everythign except `go run` in the `go` tool to Go.
It's a neccesary part of C⁴ development.

## Example
```bash
qcm tooling install latest
mkdir my-project
cd my-project
qcm init
```

## Install

Just run:
```bash
curl -fsSL "https://raw.githubusercontent.com/Youg-Otricked/quartic-c-manager/master/install.sh" | sh
```
This installs and sets up.
Or clone the repo and run:
```bash
clang++ -O3 -DCPPHTTPLIB_SSL_ENABLED main.cpp -std=c++23 -lssl -lcrypto -o ~/qcm
cd ~
./qcm setup
chmod +x ~/.qcm/bin/qcm
```
In the repo root (which is exactly what the install script does:
```bash
#!/bin/sh
echo "Installing QCM"
set -e
REPO_URL="https://github.com/Youg-Otricked/quartic-c-manager.git" # clone
INSTALL_DIR="$(mktemp -d)" # temp dir
trap 'rm -rf "$INSTALL_DIR"' 0 1 2 15 # delete temp dir
git clone "$REPO_URL" "$INSTALL_DIR" # clone
cd "$INSTALL_DIR" # cd
clang++ -O3 -DCPPHTTPLIB_SSL_ENABLED main.cpp -std=c++23 -lssl -lcrypto -o ~/qcm # compile
cd ~ # cd
echo "Installed. Setting up."
./qcm setup # setup
chmod +x ~/.qcm/bin/qcm # confirm
echo "Done"
```

## Project Structure

QuarticC projects have this structure:

```graph

. MyProject
├─┐ dependencies/
│ ├┐ MyDependencyNumber1/
│ │└─ lib.qc
│ ╵
├─┐ docs/
│ ├─ index.md
│ ╵
├─┐ lib/
│ ├─ lib.qc
│ ╵
├─┐ tests/
│ ├─ main.test.qc
│ ╵
├─ main.qc
│
├─ scope.yaml
╵
```

---

## Core Commands

1. `init`
        guides you through a TUI wizard for creating your project, makes the folder structure above.
2. `help`
        prints core help text
3. `upgrade`
        installs latest version of the CLI
4. `run`
        runs a command in your scope.yaml
5. `setup`
        sets up qcm (thing PATH and stuff)
6. `add`
        installs a package from a github url (or the registry if a offical package, but the registry is just shortend github links)
7. `remove`
        uninstalls a package.
8. `sync`
        changes qc version to current scopes version, installs all dependencies.

## Tooling Commands

All tooling commands are prefixed with `tooling`.

1. `help`
        prints tooling help text
2. `list-remote`
        lists all versions of qc, appending `[QCM TAGGED]` to important / major ones.
3. `install`
        installs a specific version of qc.
4. `uninstall`
        uninstalls a specific version of qc.
5. `list`
        lists all locally installed versions of qc, prefixing current with `*` and appending `[QCM TAGGED]` to important/major ones
6. `use`
        swaps current version of qc and its stdlib to that versions.
