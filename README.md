# homebrew-tap

Homebrew tap for [kanban](https://github.com/fulsomenko/kanban), a fast keyboard-driven terminal kanban board written in Rust.

## Install

```sh
brew install fulsomenko/tap/kanban
```

Or with an explicit tap:

```sh
brew tap fulsomenko/tap
brew install kanban
```

## Develop / HEAD

To install from the upstream `develop` branch instead of the latest stable release:

```sh
brew install --HEAD fulsomenko/tap/kanban
```

## Updates

Each `kanban` release auto-updates the formula in this tap via CI. To pull the latest version:

```sh
brew update
brew upgrade kanban
```

## License

The Ruby formula code in this repository is licensed under Apache-2.0 (see `LICENSE.md`). The `kanban` binary it installs is also licensed under Apache-2.0, owned by the upstream project at https://github.com/fulsomenko/kanban.
