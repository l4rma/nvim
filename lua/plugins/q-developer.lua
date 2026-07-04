return {
    'awslabs/amazonq.nvim',
    config = function()
        require('amazonq').setup({
            ssoStartUrl = 'https://view.awsapps.com/start', -- Authenticate with Amazon Q Free Tier
            -- Enable inline code suggestions.
            inline_suggest = false,
            -- Customize how the chat window is set up.
            on_chat_open = function()
                vim.cmd[[
                    botright split
                    set wrap breakindent nonumber norelativenumber nolist
                ]]
            end,
        })
    end
}
