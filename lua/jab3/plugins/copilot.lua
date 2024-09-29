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
