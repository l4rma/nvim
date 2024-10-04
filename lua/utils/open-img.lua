local M = {}
-- Function to extract image link and open it with qview
M.open = function()
  -- Get the line under the cursor
  local line = vim.api.nvim_get_current_line()
  -- Get the cursor position (row, col)
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  -- Find image link markdown pattern in the form ![alt text](image-url)
  local link_start, link_end = line:find("!%[.-%]%((.-)%)")

  -- Check if the cursor is on a markdown image link
  if link_start and link_end and col >= link_start and col <= link_end then
    -- Extract the image URL
    local url = line:match("!%[.-%]%((.-)%)")
    if url then
      -- Open the image in qview
--      vim.fn.jobstart({"qview", url}, {detach = true}) NO IDEA WHY THIS IS NOT WORKING! :((((
      vim.cmd(":!qview " .. url)
    else
      print("No valid image link found under cursor.")
    end
  else
    print("Cursor is not on an image link.")
  end
end

vim.api.nvim_create_user_command("OpenMdImgFile", M.open, {});

return M
