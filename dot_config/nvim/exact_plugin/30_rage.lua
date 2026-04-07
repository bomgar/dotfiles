local wk = require("which-key")
wk.add({
	{ "<leader>fr", function() require("rage").rage() end, desc = "rage" },
})
