
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find select telescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current word" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
    vim.keymap.set("n", "<leader>sr.", builtin.oldfiles, { desc = "Search recent files" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })

    vim.keymap.set("n", "<leader>s", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzy Search Buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim config files" })
  end,
}
