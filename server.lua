

-- Generate world
addCommandHandler("pos",
function(player, cmd)
	local x, y, z = getElementPosition(player)
	outputChatBox(x..", "..y..", "..z)
end)

-- 0 = grass
-- 1 = normal road
-- 2 = + corner
-- 3 = corner
-- 4 = T corner


	-- C		-		T		-		C
	-- -		0		-		0		-
	-- T		-		X		-		T
	-- -		0		-		0		-
	-- C		-		T		-		C


World = {
	map = {
		{		{3, 90},		{1,0}, 		{4,90},			{1,0},		{3, 0}		},
		{		{1,90},			{0,0},		{1, 90},		{0,0},		{1,90}		},
		{		{4,180},		{1,0},		{2, 0},			{1,0},		{4,0}		},
		{		{1,90},			{0,0},		{1, 90},		{0,0},		{1,90}		},
		{		{4,180},		{1,0},		{2, 0},			{1,0},		{4,0}		},
		{		{1,90},			{0,0},		{1, 90},		{0,0},		{1,90}		},
		{		{4,180},		{1,0},		{2, 0},			{1,0},		{4,0}		},
		{		{1,90},			{0,0},		{1, 90},		{0,0},		{1,90}		},
		{		{4,180},		{1,0},		{2, 0},			{1,0},		{4,0}		},
		{		{1,90},			{0,0},		{1, 90},		{0,0},		{1,90}		},
		{		{4,180},		{1,0},		{2, 0},			{1,0},		{4,0}		},
		
		{		{3, 180},		{1,0},		{3, 270}		}
		
		---- Line
		-- |  Column
	},
	objects = {},
	buildAreas = {}
}


function World.generate(map)
	if map then
		for index, line in pairs(map)do
			for sIndex, column in pairs(line)do				
				local object = createObject(getModelFromType(column[1]),
									(index*15),
									(sIndex*15),
									50,
									0,0, column[2]);
				table.insert(World.objects, object);
				
				-- check if it's a build area
				if column[1] == 0 then
					local x = index*15;
					local y = sIndex*15;
					local z = 50;

					local startX, startY, startZ = x-(15/2), y-(15/2), z;
					local finalX, finalY, finalZ = x+(15/2), y+(15/2), z
					
					local tmp = {}
					tmp.startX, tmp.startY, tmp.startZ = startX, startY, startZ;
					tmp.finalX, tmp.finalY, tmp.finalZ = finalX, finalY, finalZ;
					tmp.size = getDistanceBetweenPoints3D(startX, startY, startZ, finalX, startY, startZ);
					
					table.insert(World.buildAreas, tmp)
				end
			end
		end
	end
end

function World.resStart()
	World.generate(World.map)
end

function getModelFromType(id)
	local l = {
		[0] = 2675,
		[1] = 2673,
		[2] = 2672,
		[3] = 2671,
		[4] = 2674
	}
	
	if l[id] then
		return l[id];
	end
end

function getBuildAreas()
	if World.buildAreas then
		return World.buildAreas;
	end
end


--[[ Events ]]--
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), World.resStart)