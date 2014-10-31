--[[
	Server - Town
]]

Town = {}
Town.towns = {}


--[[
			[function] Town.init()
	
			* Init the towns *
	
			Return: nil
]]
function Town.init()
	-- contact the server to get the towns
	callRemote("http://127.0.0.1/perso/thesimsmta/api/getTowns", Town.callBack);
end

--[[
			[function] Town.callBack()
	
			* Callback from the init callremote *
	
			Return: nil
]]
function Town.callBack(result)
	if result ~= "ERROR" then
		if not result['error'] then
			table.insert(Town.towns, result['data']);
			triggerEvent("Town.initialized", getResourceRootElement());
		else
			outputDebugString(result['error']);
		end
	end
end

--[[
			[function] Town.getTownFromUser(int userID)
	
			* Returns the town from a player *
	
			Return: townID, false
]]
function Town.getTownFromUser(userID)
	if userID then
		for i, town in ipairs(Town.towns)do
			for a, b in ipairs(town)do
				for k, user in ipairs(b.users)do
					if userID == user.id then
						return b.id;
					end
				end
			end
		end
	else
		return false;
	end
end

--[[
			[function] Town.create()
	
			* Create towns *
	
			Return: nil
]]
function Town.create()
	
end