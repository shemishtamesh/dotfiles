local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- dap.configurations.python = {
--     {
--         type = 'python';
--         request = 'launch';
--         name = "Launch file";
--         program = "${file}";
--         pythonPath = function()
--             return '/usr/bin/python'
--         end;
--     },
-- }
-- 
-- dap.adapters.python = {
--     type = 'executable';
--     command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--     args = { '-m', 'debugpy.adapter' };
-- }

