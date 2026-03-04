# nvim-nepes

A Neovim colorscheme inspired by the Nepes corporate identity. Supports dark and light themes with full treesitter, LSP, and LazyVim plugin coverage.

## Features

- Dark and light variants
- Transparent background support
- Full treesitter highlight coverage (legacy `@text.*` and modern `@markup.*`)
- LSP diagnostics with undercurl and tinted virtual text backgrounds
- LazyVim ecosystem: Neo-tree, Telescope, Which-key, Noice, Flash, Snacks, Lazy.nvim, Mini, blink.cmp, nvim-cmp, Gitsigns, Trouble, nvim-notify, render-markdown, and more
- User-defined highlight overrides via `overrides` callback
- Rainbow headings for markdown and org-mode

## Installation

### lazy.nvim

```lua
{
  "kayspark/nvim-nepes",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "dark",       -- "dark" or "light"
    transparent = false,  -- set true for transparent background
    overrides = function(colors)
      return {}
    end,
  },
  config = function(_, opts)
    require("nepes").setup(opts)
    vim.cmd("colorscheme nepes")
  end,
}
```

### Manual

Clone the repository and add it to your `runtimepath`:

```vim
set rtp+=~/workspace/colorscheme/nvim-nepes
colorscheme nepes
```

## Configuration

Call `setup()` before loading the colorscheme:

```lua
require("nepes").setup({
  theme = "dark",         -- "dark" or "light"
  transparent = false,    -- transparent background for Normal, floats, sign column
  overrides = function(colors)
    -- Override or add highlight groups
    return {
      Comment = { fg = colors.fg_muted, italic = false },
    }
  end,
})
vim.cmd("colorscheme nepes")
```

## Palette

The color palette is defined in `lua/nepes/palette.lua`. Both dark and light variants share the same semantic color names with adjusted values for contrast and readability.

| Role      | Dark        | Light       |
|-----------|-------------|-------------|
| bg        | `#1C1C1E`   | `#F8F8F8`   |
| fg        | `#D8D8DC`   | `#1C1C1E`   |
| blue      | `#4A6ABF`   | `#23438E`   |
| red       | `#D4252C`   | `#C4181F`   |
| green     | `#43AD49`   | `#2E8A34`   |
| orange    | `#FEA413`   | `#D08A10`   |
| magenta   | `#9B6ABF`   | `#7A4FA0`   |
| cyan      | `#3A9BA5`   | `#2D7A82`   |
| yellow    | `#E8C55A`   | `#9A7E20`   |

## License

MIT
