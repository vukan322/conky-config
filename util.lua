_G.conky_days_until = function(target_day)
	target_day = tonumber(target_day)
	if not target_day then
		return "Invalid Day"
	end

	local now = os.time()
	local today_day = tonumber(os.date("%d", now))
	local this_month = tonumber(os.date("%m", now))
	local this_year = tonumber(os.date("%Y", now))

	local target_table = { year = this_year, month = this_month, day = target_day }

	if today_day >= target_day then
		if this_month == 12 then
			target_table.month = 1
			target_table.year = this_year + 1
		else
			target_table.month = this_month + 1
		end
	end

	local target_timestamp = os.time(target_table)
	local seconds_remaining = target_timestamp - now
	local days = math.ceil(seconds_remaining / 86400)

	return days
end
