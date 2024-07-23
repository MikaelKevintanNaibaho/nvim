-- ~/.config/nvim/lua/plugins/autopairs.lua

return {
    -- Specify the plugin name and its configuration (if needed)
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
    -- Add more plugins if needed, each as a separate table item
}
