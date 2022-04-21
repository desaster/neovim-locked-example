#!/bin/sh

echo -e "\nDid we actually get the package version we wanted?\n"

echo -n "  version of lualine.nvim requested by snapshot file: "
cat "./config/nvim/packer-lock.json" | jq '."lualine.nvim".commit'

echo -n "  actual version of lualine.nvim: "
git -C "./data/nvim/site/pack/packer/start/lualine.nvim" rev-parse HEAD

echo
