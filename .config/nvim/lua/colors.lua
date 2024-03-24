-- options: ayu_mirage, rose-pine, kanagawa-{wave, dragon, lotus}, soft-era, frappe, seoul256-light
local colorscheme = 'seoul256-light'
local lualine_opts = nil

if colorscheme == 'ayu_mirage' then
    require('ayu').setup({
        mirage = true,
        overrides = {},
    })

    local colors = require('ayu.colors')
    colors.generate(true)

    local custom_ayu = require('lualine.themes.ayu_mirage')
    custom_ayu.normal.c.bg = colors.bg
    custom_ayu.inactive.c.bg = colors.bg

    lualine_opts = { theme = custom_ayu }
    colorscheme = 'ayu-mirage'
elseif colorscheme == 'rose-pine' then
    require('rose-pine').setup {
        variant = 'dawn',
        styles = {
            bold = true,
            italic = false,
            transparency = false
        }
    }
elseif colorscheme == 'frappe' then
    require('catppuccin').setup { flavour = 'frappe' }
    colorscheme = 'catppuccin'
end

if lualine_opts ~= nil then
    require('lualine').setup { options = lualine_opts }
else
    require('lualine').setup()
end

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
