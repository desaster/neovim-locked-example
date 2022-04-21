local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn

--
-- Install packer
--

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    print "Installing packer..."
    packer_bootstrap = fn.system({ "git", "clone", "https://github.com/smhc/packer.nvim", install_path })
    fn.system({ 'git', '-C', install_path, 'checkout', 'snapshot_load' })
    fn.system({ 'patch', '-p1', './data/nvim/site/pack/packer/start/packer.nvim/lua/packer.lua', 'packer-fix.lua' })
    execute("packadd packer.nvim")
    print("done.")
end

--
-- Initialize packer
--

local packer = require 'packer'
packer.init {
    snapshot = 'packer-lock.json',
    -- snapshot located in config since I also want it in version control
    snapshot_path = vim.fn.stdpath('config'),
    disable_commands = false
}
local use = packer.use
packer.reset()

--
-- Specify packages
--

use {
    'smhc/packer.nvim',
    branch = 'snapshot_load'
}
use 'hoob3rt/lualine.nvim'

--
-- If packer was just installed, install packages
--

if packer_bootstrap then
    require('packer').install()
end

--
-- Setup lualine to show the version of lualine
--

-- TODO: how to use packages directly after bootstrapping?
local ok, _ = pcall(require, 'lualine')
if ok then
    local function gitrev()
        return fn.system({'git', '-C', './data/nvim/site/pack/packer/start/lualine.nvim', 'rev-parse', 'HEAD'})
    end

    require('lualine').setup {
        sections = {
            lualine_a = { gitrev },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        }
    }
end

-- vim: set sw=4 et:
