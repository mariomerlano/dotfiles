-- import comment plugin safely
local setup, commentJsx = pcall(require, "nvim-treesitter.configs")
if not setup then
  return
end

-- enable commentJsx
commentJsx.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})