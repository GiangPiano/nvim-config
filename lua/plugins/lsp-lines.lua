return {
  -- lsp_lines Shows additional fake lines of info re diagnostics. mapped to <Leader>d
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      -- highlight_whole_line = false,
      -- begin without it, use <Leader>d to turn it on.
      vim.diagnostic.config({ virtual_text = true, virtual_lines = false });
      vim.keymap.set(
        "",
        "<leader>l",
        function()
          if (vim.diagnostic.config().virtual_text)
          then
            -- vim.diagnostic.config({ virtual_text = false, virtual_lines = { only_current_line = true } })
            vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
          else
            vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
          end
        end,
        { desc = "Toggle lsp_lines" }
      )
    end,
  },
}
