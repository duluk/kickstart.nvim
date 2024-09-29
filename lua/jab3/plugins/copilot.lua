-- local function get_hostname()
--   local f = io.popen '/bin/hostname'
--   local hostname = f:read '*a' or ''
--   f:close()
--   hostname = string.gsub(hostname, '\n$', '')
--   return hostname
-- end

-- local hostname = get_hostname()
local hostname = vim.fn.hostname()

if hostname ~= '<redacted>' then
  return {
    {
      'github/copilot.vim',
    },
  }
else
  return {}
end
