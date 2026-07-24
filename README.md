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

## Version policy

This tap maintains the latest stable release of each formula. GitHub Releases
is the archive for historical versions.

We add a versioned formula (for example, `gocciascript@0.9`) only when a
supported compatibility line has a concrete user need and we commit to
maintaining it, including compatible release artifacts and security fixes.
Patch releases update the main formula rather than creating additional
versioned formulae.

## Upgrade

```sh
brew update
brew upgrade gocciascript lwpt
```
