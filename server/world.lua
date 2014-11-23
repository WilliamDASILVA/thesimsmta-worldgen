--[[
	Server - World
]]

World = {}
World.roads = {
	['normal'] 	= 2673,
	['corner'] 	= 2671,
	['t']		= 2674,
	['cross']	= 2672
}

World.objects = {}
--[[
	All the objects are stored in this var,
	the array index is the dimension (aka the townID)
	They're created only if the player is nearly
]]
World.houseEmplacements = {}

--[[
			[function] World.generate(int townID)
	
			* Generate a world *
	
			Return: nil
]]
function World.generate(townID)

	World.objects[townID] = {};
	World.houseEmplacements[townID] = {};

	local xml = xmlLoadFile("towns/"..townID..".xml");
	if xml then
		local childNodes = xmlNodeGetChildren(xml);

		local townPosition = {}
		townPosition.x = xmlNodeGetAttribute (xml, "posX");
		townPosition.y = xmlNodeGetAttribute (xml, "posY");
		townPosition.z = xmlNodeGetAttribute (xml, "posZ");

		for i, node in ipairs(childNodes)do
			if xmlNodeGetName(node) == "road" then
				local t = {};
				t.x = townPosition.x + 15 * xmlNodeGetAttribute(node, "posX");
				t.y = townPosition.y + 15 * xmlNodeGetAttribute(node, "posY");
				t.z = townPosition.z + 15 * xmlNodeGetAttribute(node, "posZ");
				t.rx = xmlNodeGetAttribute(node, "rotX");
				t.ry = xmlNodeGetAttribute(node, "rotY");
				t.rz = xmlNodeGetAttribute(node, "rotZ");
				t.typ = World.getRoadFromType(xmlNodeGetAttribute(node, "type"));

				table.insert(World.objects[townID], t);

			elseif xmlNodeGetName(node) == "house" then
				local t = {};
				t.x = townPosition.x + 15 * xmlNodeGetAttribute(node, "posX");
				t.y = townPosition.y + 15 * xmlNodeGetAttribute(node, "posY");
				t.z = townPosition.z + 15 * xmlNodeGetAttribute(node, "posZ");
				t.rx = 0;
				t.ry = 0;
				t.rz = 0;
				t.typ = 2675;
				t.width = t.x + 15;
				t.height = t.y + 15;

				table.insert(World.objects[townID], t);
				table.insert(World.houseEmplacements[townID], t);

			end


		end

		outputChatBox("HOUSES LOADED:"..#World.houseEmplacements[townID]);


		triggerClientEvent(client, "World.loaded", client, World.objects[townID], World.houseEmplacements[townID]);

		xmlUnloadFile(xml);
	else
		outputDebugScript("Failled to load xml");
	end
end

--[[
			[function] World.getRoadFromType(type)
	
			* Returns the road id from the road type *
	
			Return: nil
]]
function World.getRoadFromType(typ)
	if typ then
		return World.roads[typ];
	end
end

--[[
	Event Handlers
]]
addEvent("World.generate", true)
addEventHandler("World.generate", getRootElement(), World.generate);