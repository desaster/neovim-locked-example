This patch tweaks the PR to support snapshot_path
https://github.com/wbthomason/packer.nvim/pull/849
--- ./data/nvim/site/pack/packer/start/packer.nvim/lua/packer.lua	2022-04-21 13:09:43.087827106 +0300
+++ fixed-packer.lua	2022-04-21 13:22:55.933711145 +0300
@@ -132,9 +132,10 @@
     vim.notify("Couldn't create " .. config.snapshot_path, vim.log.levels.WARN)
   end
 
-  if config.snapshot then
+  local snapshot_file = join_paths(config.snapshot_path, config.snapshot)
+  if snapshot_file then
     local status, content = pcall(function()
-      return vim.fn.readfile(config.snapshot)
+      return vim.fn.readfile(snapshot_file)
     end)
     if (status and content ~= nil) then
       config.snapshot_commits = vim.fn.json_decode(content)
