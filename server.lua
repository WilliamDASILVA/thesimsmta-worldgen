

-- Generate world
addCommandHandler("pos",
function(player, cmd)
	local x, y, z = getElementPosition(player)
	outputChatBox(x..", "..y..", "..z)
end)


World = {
	objects = {}
}



function World.generate(dimension)
	if dimension then
		for k = 0, dimension do
			if k%2 == 0 then -- Si la ligne est une ligne est pair
				for i = 0, dimension do
					if i == 0 then
						-- createObject(2671, -15,13.5, 50, 0, 0, 180)
						if k == 0 then -- Si le coin, on met un qui tourne
							createObject(2671,
													i*(-15)-15,
													(13.5*k)+13.5,
													50,
													0,0,180
													)

						else -- Si ce n'es pas un coin, on met un T
							createObject(2674,
													(( i*15)-15)-15/2,
													(15*k)+6,
													50,
													0,0,90
													)
						end
					-- elseif i == dimension then
						-- outputDebugString("Last"..i)
					else
					
						if i%2 == 0 then
							if k == 0 then -- Si c'est le premier de la ligne, on met le T
								createObject(2674,
													(( i*15)-15)-15/2,
													6,
													50,
													0,0,180
													)

							else -- Sinon, c'est que c'est un dans le milieu alors on met on +
								createObject(2672,
													(( i*15)-15)-15/2,
													((k*15)+6),
													50,
													0,0,180
													)
							end
							
							if i == dimension-1 then -- Creation du dernier T de la ligne
								if k == 0 then
								
								else
								
									createObject(2674,
														(i*15)+7.5,
														(k*15)+6,
														50,
														0,0,270
														)
								end
							end
						else
							-- routes verticale
							createObject(2673,
												(i*15)-15,
												(k*15),
												50,
												0, 0, 90
												)
												
						end
						
						if k == 0 then -- Si dans la première ligne et dans la dernière colone, on met un qui tourne
							if i == dimension then
								createObject(2671,
														(i*15)-15,
														13.5,
														50,
														0,0,270
														)
							end
						end
					end
				end
			else -- Sinon, la ligne est impair
				for i = 0, dimension do
					if i%2 == 0 then -- Si c'est pair
						if i == 0 then
							createObject(2673,
													0+((i*15)+1.5),
													(k*15)-1.5,
													50,
													0, 0, 0
													)
							-- On cr�e aussi celui qui est au point 0
							createObject(2673,
													(-15)+(-13.5),
													(k*15)-1.5,
													50,
													0, 0, 0
													)
						else
							createObject(2673,
													0+((i*15)+1.5),
													(k*15)-1.5,
													50,
													0, 0, 0
													)
						end
					else -- Impair, on met rien
						
					end
				end
			end
		end
	end
end

function World.resStart()
	World.generate(9)
end



--[[ Events ]]--
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), World.resStart)