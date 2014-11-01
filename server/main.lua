--[[
	Server - Main
]]

Server = {}

--[[
			[function] Server.init()
	
			* Init the worldgen *
	
			Return: nil
]]
function Server.init()
	Town.init();
end

function Server.townInitialized()
	for i, user in ipairs(getElementsByType("player"))do
		if getElementData(user, "connected") == true then
			local userData = getElementData(user, "userdata");
			local townID = Town.getTownFromUser(userData.id);
			setElementData(user, "townID", townID);
			triggerClientEvent(user, "Town.initialized", user, townID);

			--World.generate(townID);
		end
	end
end


--[[
	Event Handlers
]]
addEvent("Town.initialized", true)
addEventHandler("Town.initialized", getRootElement(), Server.townInitialized);
addEventHandler("onResourceStart", getResourceRootElement(), Server.init);