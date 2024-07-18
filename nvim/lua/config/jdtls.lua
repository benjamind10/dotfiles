local jdtls = require("jdtls")

-- Define the root directory
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- Define the workspace directory
local workspace_dir = vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Set JDTLS configuration
local config = {
  cmd = { "/home/shiva/.local/share/nvim/lazy/nvim-jdtls" },
  root_dir = root_dir,
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
