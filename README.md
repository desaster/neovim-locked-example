# Example of a neovim configuration with locked package versions

[Packer](https://github.com/wbthomason/packer.nvim) supports "snapshots",
which should allow locking package versions to a specific version.

In this repository I'm attempting to create a simple configuration, where:
* packer-lock.json specifies exact versions of packages
* packer configuration will install these exact versions of packages, no extra fuss
* during startup, no "revert snapshot" operations are executed

*STATUS: experimental! not a working example!*

## What is included

The provided script `nvim-lockedversions` will start nvim, pointing the
`config`, `cache`, `state` and `data` directories to the to this repository.
This way this should be a reasonably isolated sandbox, so it doesn't interfere
with the normal neovim installation and vice versa.

Provided files:

* `nvim-lockedversions` - a script that starts nvim with isolated configuration
* `reset.sh` - deletes downloaded or generated stuff, allowing to start the experiment from scratch
* `did-snapshot-work.sh` - a script that will demonstrate if the package snapshot worked
* `config/nvim/init.lua` - minimal neovim configuration
* `config/nvim/packer-lock.json` - a packer snapshot file

## How to use this repository

First of all, make sure you have nvim version 0.7.0:

```
nvim --version
NVIM v0.7.0
```

Then simply run `./nvim-lockedversions`.

This should automatically install `packer` and the packages specified in
`init.lua`

To verify that the packages were installed correctly, run
`./did-snapshot-work.sh`

## How to determine success

Run `./did-snapshot-work.sh`. 

If successful, it should output:

```
Did we actually get the package version we wanted?

  version of lualine.nvim requested by snapshot file: "13ead78"
  actual version of lualine.nvim: 13ead784c4219478d329dea1d4ab733dde5eb438
```

If not successful, it might display something like this:

```
Did we actually get the package version we wanted?

  version of lualine.nvim requested by snapshot file: "13ead78"
  actual version of lualine.nvim: 13ead784c4219478d329dea1d4ab733dde5eb438
```
