# Homebrew tap

Homebrew formulae for projects maintained by
[frostney](https://github.com/frostney).

## Install

Install a formula directly:

```sh
brew install frostney/tap/gocciascript
brew install frostney/tap/herakles
brew install frostney/tap/lwpt
brew install frostney/tap/wasmlight
```

Or add the tap first:

```sh
brew tap frostney/tap
brew install gocciascript
brew install herakles
brew install lwpt
brew install wasmlight
```

## Formulae

| Formula | Description |
| --- | --- |
| `gocciascript` | ECMAScript engine for embedding, and its CLI tools |
| `herakles` | Bun-first workspace orchestrator for many repositories |
| `lwpt` | Lightweight Pascal toolkit |
| `wasmlight` | WebAssembly runtime and native compiler for Object Pascal |

Homebrew installs the GitHub CLI (`gh`) alongside `herakles`.

The `lwpt` formula installs only the `lwpt` executable. LWPT builds and tests
projects with Free Pascal unless a project selects another compiler profile.
The
[LWPT consumer guide](https://github.com/frostney/lwpt/blob/main/docs/user/consumer-guide.md#install-the-released-toolkit)
installs Free Pascal and LWPT together on macOS:

```sh
brew install fpc frostney/tap/lwpt
```

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
brew upgrade gocciascript herakles lwpt wasmlight
```
