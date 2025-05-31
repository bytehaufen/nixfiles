return {
  -- Browse and preview json files
  -- Commands: `JqxList` and `JqxQuery`
  {
    "gennaro-tedesco/nvim-jqx",
    event = { "BufReadPost" },
    ft = { "json", "yaml" },
  },
}
