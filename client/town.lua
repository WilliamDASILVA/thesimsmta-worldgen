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
	if getElementData(getLocalPlayer(), "townID") then
		setElementDimension(getLocalPlayer(), getElementData(getLocalPlayer(), "townID"))
		World.generate(getElementData(getLocalPlayer(), "townID"), getLocalPlayer());
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