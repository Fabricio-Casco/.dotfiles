local onBufferChange = vim.api.nvim_create_augroup("BuffEnterLeaveControl", {clear = true})

local set_buffer_highlight = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = onBufferChange,
    pattern = pattern,
    callback = function()
      vim.opt_local.relativenumber = value
      vim.opt_local.cursorline = value
    end
  })
end


set_buffer_highlight("WinLeave", false)
set_buffer_highlight("WinEnter", true)
set_buffer_highlight("FileType", false, "TelescopePrompt")
