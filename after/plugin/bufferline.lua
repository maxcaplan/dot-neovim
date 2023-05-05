require('bufferline').setup {
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = false
			}
		},
		separator_style = "thick",
	}
}

function close_current_buffer()
	require('bufdelete').bufdelete(0)
end

vim.keymap.set("n", "<leader>q", function() close_current_buffer() end)
