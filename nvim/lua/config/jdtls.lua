local jdtls = require("jdtls")

local config = {
  cmd = { "jdtls" }, -- Ensure 'jdtls' is correctly set in your PATH
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  settings = {
    java = {
      saveActions = {
        organizeImports = false, -- Disable organize imports on save
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
