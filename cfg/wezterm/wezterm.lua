local wezterm = require "wezterm"

return {
  -- theming
  use_fancy_tab_bar = false,
  colors = {
    indexed = { [16] = "#F8BD96", [17] = "#F5E0DC" },

    scrollbar_thumb = "#575268",
    split = "#161320",

    tab_bar = {
      background = "#1E1E2E",
      active_tab = {
        bg_color = "#1E1E2E",
        fg_color = "#DDB6F2",
      },
      inactive_tab = {
        bg_color = "#575268",
        fg_color = "#302D41",
      },
      inactive_tab_hover = {
        bg_color = "#575268",
        fg_color = "#D9E0EE",
      },
      new_tab = {
        bg_color = "#15121C",
        fg_color = "#6E6C7C",
      },
      new_tab_hover = {
        bg_color = "#575268",
        fg_color = "#D9E0EE",
        italic = true,
      },
    },

    visual_bell = "#302D41",

    -- nightbuild only
    compose_cursor = "#F8BD96",
  },
  color_scheme = "Catppuccin",

  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,

  -- fonts
  font = wezterm.font_with_fallback {
    { family = "Dank Mono", weight = "Bold" },
    "JetBrainsMono Nerd Font",
    "Material",
  },
  font_size = 14.0,

  -- launcher
  launch_menu = {
    {
      label = "NVIM: open dotfiles repo",
      args = { "nvim", "Desktop/dotfiles" },
    },
  },

  -- keybinds
  disable_default_key_bindings = true,
  leader = { key = " ", mods = "ALT", timeout_milliseconds = 2000 },
  keys = {
    { key = "R", mods = "CTRL", action = "ReloadConfiguration" },
    { key = "F", mods = "CTRL", action = wezterm.action { Search = { Regex = "" } } },

    -- leader binds
    { key = "t", mods = "LEADER", action = wezterm.action { ShowLauncherArgs = { flags = "FUZZY|TABS" } } },
    { key = "l", mods = "LEADER", action = "ShowLauncher" },

    -- tabs
    { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action { ActivateTabRelative = -1 } },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action { ActivateTabRelative = 1 } },
    { key = "T", mods = "CTRL", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "q", mods = "CTRL", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = "Q", mods = "CTRL", action = wezterm.action { CloseCurrentTab = { confirm = false } } },
    { key = "Tab", mods = "CTRL|SHIFT", action = "ActivateLastTab" },

    -- clipboard
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action { CopyTo = "Clipboard" } },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action { PasteFrom = "Clipboard" } },

    -- window
    { key = "n", mods = "CTRL|SHIFT", action = "SpawnWindow" },

    -- pane
    {
      key = "_",
      mods = "CTRL|SHIFT",
      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
    },
    {
      -- weird behavior (keybind above activated by "ctrl shift -" key, so this should be activated by "ctrl shift |" but instead it need "\")
      key = "\\",
      mods = "CTRL|SHIFT",
      action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
    },
  },
}
