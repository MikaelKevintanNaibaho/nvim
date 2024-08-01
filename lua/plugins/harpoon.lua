return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED: Set up Harpoon
        harpoon.setup()

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add() 
            vim.notify("Harpoon: File added!!!")
        end)

        vim.keymap.set('n', '<C-e>', function()
            harpoon.ui:toggle_quick_menu(harpoon:list()) 
        end)

        vim.keymap.set("n", "<leader>g1", function() 
            harpoon:list():select(1) 
            vim.notify("Harpoon: Switch to file 1")
        end)
        vim.keymap.set("n", "<leader>g2", function() 
            harpoon:list():select(2) 
            vim.notify("Harpoon: Switch to file 2")
        end)
        vim.keymap.set("n", "<leader>g3", function() 
            harpoon:list():select(3) 
            vim.notify("Harpoon: Switch to file 3")
        end)
        vim.keymap.set("n", "<leader>g4", function() 
            harpoon:list():select(4) 
            vim.notify("Harpoon: Switch to file 4")
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>gp", function() 
            harpoon:list():prev() 
            vim.notify("Harpoon: Switch to prev file")
        end)

        vim.keymap.set("n", "<leader>gn", function() 
            harpoon:list():next() 
            vim.notify("Harpoon: Switch to next file")
        end)

        -- Remove file from the Harpoon list
        vim.keymap.set('n', '<leader>r1', function() 
            harpoon:list():remove_at(1) 
            vim.notify("Harpoon: Removed file 1")
        end, { desc = "Remove file 1 from Harpoon" })
        vim.keymap.set('n', '<leader>r2', function() 
            harpoon:list():remove_at(2) 
            vim.notify("Harpoon: Removed file 2")
        end, { desc = "Remove file 2 from Harpoon" })
        vim.keymap.set('n', '<leader>r3', function() 
            harpoon:list():remove_at(3) 
            vim.notify("Harpoon: Removed file 3")
        end, { desc = "Remove file 3 from Harpoon" })
        vim.keymap.set('n', '<leader>r4', function() 
            harpoon:list():remove_at(4) 
            vim.notify("Harpoon: Removed file 4")
        end, { desc = "Remove file 4 from Harpoon" })

        -- Remove all files from the Harpoon list
        vim.keymap.set('n', '<leader>rc', function() 
            for i = 1, 4 do
                harpoon:list():remove_at(i)
            end
            vim.notify("Harpoon: Removed all files")
        end, { desc = "Remove all files from Harpoon" })


    end
}

