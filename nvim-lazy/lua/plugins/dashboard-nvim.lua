return {
  "nvimdev/dashboard-nvim",
  optional = true,
  opts = function(_, opts)
    local projects = {
      action = 'lua require("auto-session.session-lens").search_session()',
      desc = " Projects",
      icon = " ",
      key = "p",
    }
    projects.key_format = "  %s"

    table.insert(opts.config.center, 3, projects)
  end,
}
