--[[
	Client - Town
]]

Town = {}


--[[
			[function] Town.init()
	
			* Init the town for the local player *
	
			Return: nil
]]
function Town.init()
	
	-- load town
	local userdata = getElementData(getLocalPlayer(), "userdata")
	if userdata['townID'] then
		setElementData(getLocalPlayer(),"townID", userdata['townID']);
		setElementDimension(getLocalPlayer(), userdata.townID)
		World.generate(userdata.townID, getLocalPlayer());
	end

end

function TownInit()
	Town.init();
end

function Town.initialized()
	--Town.init();
end

addEvent("Town.initialized", true);
addEventHandler("Town.initialized", getRootElement(), Town.initialized);