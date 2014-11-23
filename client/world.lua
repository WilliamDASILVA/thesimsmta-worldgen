
World = {}
World.objects = {}
World.objectsCreated = {}
World.houses = {}

--[[
			[function] World.generate(townID, player)
	
			* Call the server to get the world to a specific town *
	
			Return: nil
]]
function World.generate(townID, player)
	if townID and player then
		triggerServerEvent("World.generate", player, townID);
	end
end

--[[
			[function] World.loaded(objects, houses)
	
			* When the objects are loaded to the client *
	
			Return: nil
]]
function World.loaded(objects, houses)
	World.objects = objects;
	World.houses = houses;

	outputChatBox("HOUSES CLIENT SIDE:"..#World.houses);

	setTimer(World.rendering, 500,0);
end

--[[
			[function] World.rendering()
	
			* Render *
	
			Return: nil
]]
function World.rendering()
	local x, y, z = getElementPosition(getLocalPlayer())
	for i, object in ipairs(World.objects)do
		if getDistanceBetweenPoints3D(x,y, z, object.x, object.y, object.z) <= 100 then
			
			if not object.created then
				local obj = createObject(object.typ, object.x, object.y, object.z, object.rx, object.ry, object.rz);
				setElementDimension(obj, getElementData(getLocalPlayer(), "townID"));
				setElementData(obj, "data", object);
				setElementData(obj, "type", "ground");
				table.insert(World.objectsCreated, obj);
				object.created = true;
			end

		else
			for i, rObject in ipairs(World.objectsCreated)do
				local a, b, c = getElementPosition(rObject);
				if a == object.x and b == object.y and c == object.z then
					object.created = false;
					destroyElement(rObject);
					table.remove(World.objectsCreated, i);
				end
			end
		end
	end
end

--[[
			[function] getBuildingAreas()
	
			* Return the building areas avaliables *
	
			Return: array
]]
function getBuildingAreas()
	outputChatBox("GETTING HOUSES"..#World.houses.."-"..getElementData(getLocalPlayer(), "townID"))
	return World.houses;
end

--[[
	Event Handlers
]]
addEvent("World.loaded", true);
addEventHandler("World.loaded", getRootElement(), World.loaded);