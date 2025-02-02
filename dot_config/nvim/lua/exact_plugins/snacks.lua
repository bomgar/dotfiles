return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{ "<leader>un",  function() Snacks.notifier.hide() end,                                 desc = "Dismiss All Notifications" },
			{ "<leader>uh",  function() Snacks.notifier.show_history() end,                         desc = "Show notification history" },
			{ "<leader>ud",  function() Snacks.bufdelete() end,                                     desc = "Delete Buffer" },
			{ "<F12>",       function() Snacks.lazygit() end,                                       desc = "Lazygit" },
			{ "<leader>gB",  function() Snacks.gitbrowse() end,                                     desc = "Git Browse" },
			{ "<leader>gsh", function() Snacks.picker.git_log() end,                                desc = "Git search log" },
			{ "<leader>gsf", function() Snacks.picker.git_log_file() end,                           desc = "Git search log file" },
			{ "<leader>gb",  function() Snacks.git.blame_line() end,                                desc = "Git blame" },
			{ "<leader>gf",  function() Snacks.lazygit.log_file() end,                              desc = "Lazygit Current File History" },
			{ "<leader>gl",  function() Snacks.lazygit.log() end,                                   desc = "Lazygit Log (cwd)" },
			{ "<leader>uR",  function() Snacks.rename() end,                                        desc = "Rename File" },
			{ "<c-/>",       function() Snacks.terminal() end,                                      desc = "Toggle Terminal" },
			{ "<c-_>",       function() Snacks.terminal() end,                                      desc = "which_key_ignore" },
			{ "<leader>uc",  function() Snacks.bufdelete.other() end,                               desc = "close all other buffers" },

			{ "<leader>ff",  function() Snacks.picker.files({ hidden = true }) end,                 desc = "Find File" },
			{ "<leader>fF",  function() Snacks.picker.files({ hidden = true, dirs = { "~" } }) end, desc = "Find File in home" },
			{ "<leader>fc",  function() Snacks.picker.command_history() end,                        desc = "command history" },
			{ "<leader>fg",  function() Snacks.picker.grep() end,                                   desc = "Live Grep" },
			{ "<leader>fs",  function() Snacks.picker.grep_word() end,                              desc = "Visual selection or word",    mode = { "n", "x" } },
			{ "<leader>fb",  function() Snacks.picker.buffers() end,                                desc = "Buffers" },
			{ "<leader>f?",  function() Snacks.picker.help() end,                                   desc = "Help Tags" },
			{ "<leader>fw",  function() Snacks.picker.lsp_workspace_symbols() end,                  desc = "LSP workspace symbols" },
			{ "<leader>fm",  function() Snacks.picker.marks() end,                                  desc = "Marks" },
			{ "<leader>fj",  function() Snacks.picker.jumps() end,                                  desc = "Jumplist" },
			{ "<leader>fq",  function() require("fzf-lua").qflist() end,                            desc = "quickfix" },
			{ "<leader>fo",  function() Snacks.picker.recent() end,                                 desc = "recent files" },
			{ "<leader>fl",  function() Snacks.picker.lines() end,                                  desc = "file lines" },
			{ "<leader>fp",  function() Snacks.picker.projects() end,                               desc = "projects" },
		},
		config = function()
			require("snacks").setup(
				{
					styles = {},
					bigfile = { enabled = true },
					notifier = { enabled = true },
					quickfile = { enabled = true },
					statuscolumn = { enabled = true },
					dashboard = { enabled = true },
					words = { enabled = true },
					input = {
						enabled = false,
						win = {
							relative = "win",
						}
					},
					picker = {
						enabled = true,
					}
				}
			)
			Snacks.input.enable()
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesActionRename",
				callback = function(event)
					Snacks.rename.on_rename_file(event.data.from, event.data.to)
				end,
			})
		end
	}
}
