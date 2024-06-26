local response_format = "Respond EXACTLY in this format:\n```$ftype\n<your code>\n```"

return {
  "yamsergey/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    model = "codellama",
    prompts = {
      MD_Table = {
        model = "mistral",
        prompt = "Create aligned markdown table only from provided data."
          .. "Use consistent column width and space out columns."
          .. response_format
          .. "\n\n```$ftype\n$sel```",
        action = "display_replace",
      },
    },
    -- your configuration overrides
  },
}
