return {
  { "akinsho/bufferline.nvim", enabled = false },
  -- Make the fuzzy finder (snacks.picker) include dotfiles
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- file picker (<leader><space>, <leader>ff): show dotfiles + gitignored
          files = { hidden = true, ignored = true },
          -- live grep (<leader>/, <leader>sg): search dotfiles + gitignored too
          grep = { hidden = true, ignored = true },
          -- explorer keeps defaults (no dotfiles, no gitignored); toggle in-tree with H / I
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- Open .ipynb files as plain text (markdown or python)
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false, -- must load early so .ipynb is intercepted
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
  },
  -- Inline images (plots, matplotlib output)
  {
    "3rd/image.nvim",
    build = "luarocks --local --lua-version=5.1 install magick",
    opts = {
      backend = "kitty", -- or "ueberzug" on X11
      processor = "magick_cli",
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif" },
    },
  },
  -- The kernel runner
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_wrap_output = true
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Init kernel" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Run operator" },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Run line" },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Re-run cell" },
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Run selection", mode = "v" },
      { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Enter output" },
      { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Hide output" },
      { "<leader>md", ":MoltenDelete<CR>", desc = "Delete cell" },
    },
  },
  -- Optional but recommended: quarto-nvim for cell text objects, runner UI
  {
    "quarto-dev/quarto-nvim",
    dependencies = { "jmbuhr/otter.nvim", "nvim-treesitter/nvim-treesitter" },
    ft = { "quarto", "markdown" },
    opts = {
      codeRunner = { enabled = true, default_method = "molten" },
    },
  },
}
