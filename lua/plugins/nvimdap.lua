return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.35 },
						{ id = "breakpoints", size = 0.2 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.2 },
					},
					size = 50,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = {
				max_height = 0.3,
				max_width = 0.5,
				border = "rounded",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil,
				max_value_lines = 100,
			},
		},
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP: Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "DAP: Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "DAP: Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "DAP: Step Out",
			},
			{
				"<Leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "DAP: Toggle Breakpoint",
			},
			{
				"<Leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "DAP: Conditional Breakpoint",
			},
			{
				"<Leader>lp",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "DAP: Log Point",
			},
			{
				"<Leader>dr",
				function()
					require("dap").repl.open()
				end,
				desc = "DAP: REPL",
			},
			{
				"<Leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "DAP UI: Toggle",
			},
		},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup(opts)

			-- Open UI when session starts
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Setup CodeLLDB
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/dap_adapters/vscode-lldb/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.c = {
				{
					name = "Launch file (C)",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					terminal = "integrated",
				},
			}

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/dap_adapters/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}
			dap.configurations.cpp = dap.configurations.c
		end,
	},
}
