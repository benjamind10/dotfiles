-- Ensure packer.nvim is installed
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" }, -- Completion plugin
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
  { "L3MON4D3/LuaSnip" }, -- Snippet engine
  { "saadparwaiz1/cmp_luasnip" }, -- Snippet completion source
  { "gbprod/yanky.nvim" },

  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDCreateDefaultMappings = 1
      -- You can add more configurations here if needed
    end,
  },
  -- Add neotest and its dependencies
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
        },
      })
    end,
  },

  --{
  --"marko-cerovac/material.nvim",
  --config = function()
  --vim.g.material_style = "darker" -- Set the style to 'darker'
  --require("material").setup({
  --contrast = {
  --sidebars = true, -- Enable contrast for sidebars
  --floating_windows = true, -- Enable contrast for floating windows
  --line_numbers = true, -- Enable contrast background for line numbers
  --sign_column = true, -- Enable contrast background for sign column
  --cursor_line = true, -- Enable darker background for the cursor line
  --non_current_windows = true, -- Enable darker background for non-current windows
  --popup_menu = true, -- Enable lighter background for the popup menu
  --},
  --italics = {
  --comments = true, -- Enable italic comments
  --keywords = true, -- Enable italic keywords
  --functions = true, -- Enable italic functions
  --strings = true, -- Enable italic strings
  --variables = true, -- Enable italic variables
  --},
  --contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
  --"terminal", -- Darker terminal background
  --"packer", -- Darker packer background
  --"qf", -- Darker quickfix background
  --},
  --})
  --vim.cmd("colorscheme nord") -- Set the colorscheme to 'material'
  --end,
  --},

  -- Add vim-test for additional test running capabilities
  { "vim-test/vim-test" },
  { "oguzbilgic/vim-gdiff" },
  { "tpope/vim-fugitive" },

  --Configure LazyVim to load gruvbox
  --{
  --"LazyVim/LazyVim",
  --opts = {
  --colorscheme = "gruvbox",
  --},
  --},

  { "shaunsingh/nord.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- change trouble config
  --{
  --  "folke/trouble.nvim",
  --  -- opts will be merged with the parent spec
  --  opts = { use_diagnostic_signs = true },
  --},

  ---- disable trouble
  --{ "folke/trouble.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add pyright to lspconfig
  --{
  --"neovim/nvim-lspconfig",
  -----@class PluginLspOpts
  --opts = {
  -----@type lspconfig.options
  --servers = {
  ---- pyright will be automatically installed with mason and loaded with lspconfig
  --pyright = {},
  --},
  --},
  --},

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
      },
    },
  },

  -- Add null-ls for integrating external formatters and linters
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
              "css",
              "scss",
              "less",
              "html",
              "json",
              "yaml",
              "markdown",
              "graphql",
            },
          }),
          -- Add more sources as needed
        },
      })
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    config = function()
      local opt = vim.opt

      -- Set line numbers
      opt.number = true
      opt.relativenumber = true
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
}
