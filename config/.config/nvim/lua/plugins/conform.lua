return {
  {
    "stevearc/conform.nvim",
    opts = {},
    require("conform").setup({
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
    }),
  },
}