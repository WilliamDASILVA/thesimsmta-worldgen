
World = {}
World.objects = {}
World.objectsCreated = {}

function World.generate(townID, player)
	outputDebugString("Client start gen"..tostring(player).."-"..townID);
	if townID and player then
		triggerServerEvent("World.generate", player, townID);
	end
end

function World.loaded(objects)
	World.objects = objects;

	setTimer(World.rendering, 1000,0);
end


function World.rendering()
	local x, y, z = getElementPosition(getLocalPlayer())
	for i, object in ipairs(World.objects)do
		if getDistanceBetweenPoints3D(x,y, z, object.x, object.y, object.z) <= 100 then
			
			if not object.created then
				local obj = createObject(object.typ, object.x, object.y, object.z, object.rx, object.ry, object.rz);
				setElementDimension(obj, getElementData(getLocalPlayer(), "townID"));
				setElementData(obj, "data", object);
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


addEvent("World.loaded", true);
addEventHandler("World.loaded", getRootElement(), World.loaded);