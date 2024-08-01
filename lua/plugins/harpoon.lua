return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED: Set up Harpoon
        harpoon.setup()

        vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
        vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

        -- Remove file from the Harpoon list
        vim.keymap.set('n', '<leader>r1', function() harpoon:list():remove_at(1) end, { desc = "Remove file 1 from Harpoon" })
        vim.keymap.set('n', '<leader>r2', function() harpoon:list():remove_at(2) end, { desc = "Remove file 2 from Harpoon" })
        vim.keymap.set('n', '<leader>r3', function() harpoon:list():remove_at(3) end, { desc = "Remove file 3 from Harpoon" })
        vim.keymap.set('n', '<leader>r4', function() harpoon:list():remove_at(4) end, { desc = "Remove file 4 from Harpoon" })

        -- Remove all files from the Harpoon list
        vim.keymap.set('n', '<leader>rc', function() 
            for i = 1, 4 do
                harpoon:list():remove_at(i)
            end
        end, { desc = "Remove all files from Harpoon" })


    end
}

