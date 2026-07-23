# Homebrew tap

Homebrew formulae for projects maintained by
[frostney](https://github.com/frostney).

## Install

Install a formula directly:

```sh
brew install frostney/tap/gocciascript
brew install frostney/tap/lwpt
```

Or add the tap first:

```sh
brew tap frostney/tap
brew install gocciascript
brew install lwpt
```

## Formulae

| Formula | Description |
| --- | --- |
| `gocciascript` | Sandbox-first ECMAScript runtime and its CLI tools |
| `lwpt` | Lightweight Pascal toolkit |

LWPT depends on Free Pascal. Homebrew installs the supported `fpc` version
alongside it.

## Upgrade

```sh
brew update
brew upgrade gocciascript lwpt
```
