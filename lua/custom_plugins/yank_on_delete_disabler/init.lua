local m = {}

function m.setup()
  vim.keymap.set({"n", "v"}, "d", '"_d', {})
  vim.keymap.set("n", "c", '"_c', {})
end

return m
