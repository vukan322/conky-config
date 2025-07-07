_G.top_processes = {}
local last_update_time = 0
local update_interval = 3

local function run_command(cmd)
	local handle = io.popen(cmd)
	if not handle then
		return nil
	end
	local output = handle:read("*a")
	handle:close()
	return output:gsub("[\n\r]$", "")
end

_G.conky_run_process_update = function()
	local current_time = os.time()
	if (current_time - last_update_time) >= update_interval then
		last_update_time = current_time

		local ps_cmd = "ps -eo comm,pid,pcpu,pmem --sort=-pcpu --no-headers | grep -v 'ps' | head -n 5"
		local processes_raw = run_command(ps_cmd)

		for i = #_G.top_processes, 1, -1 do
			table.remove(_G.top_processes, i)
		end

		if processes_raw then
			for line in processes_raw:gmatch("[^\r\n]+") do
				local name, pid, cpu_str, mem_str = line:match("^(.*)%s+(%d+)%s+([%d%.]+)%s+([%d%.]+)$")
				if name and pid then
					name = name:match("^%s*(.-)%s*$")
					if string.len(name) > 15 then
						name = string.sub(name, 1, 15)
					end

					local cpu_num = tonumber(cpu_str)
					local formatted_cpu
					if cpu_num >= 10 then
						formatted_cpu = string.format("%.0f", cpu_num)
					else
						formatted_cpu = cpu_str
					end

					local mem_num = tonumber(mem_str)
					local formatted_mem
					if mem_num >= 10 then
						formatted_mem = string.format("%.0f", mem_num)
					else
						formatted_mem = mem_str
					end

					local formatted_line =
						string.format("%-16s %-6s %4s%% %4s%%", name, pid, formatted_cpu, formatted_mem)
					table.insert(_G.top_processes, formatted_line)
				end
			end
		end

		while #_G.top_processes < 5 do
			table.insert(_G.top_processes, "")
		end
	end
	return ""
end

_G.conky_get_process = function(index)
	local i = tonumber(index)
	if _G.top_processes[i] then
		return _G.top_processes[i]
	end
	return ""
end
