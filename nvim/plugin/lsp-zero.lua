local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()


-- When a language server gets attached to a buffer you gain access to some keybindings and commands. All of these are bound to built-in functions, so you can get more details using the :help command.
--
-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
--
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
--
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
--
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
--
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
--
-- <Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
--
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
--
-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
--
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
--
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
--
