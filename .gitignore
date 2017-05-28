local inSelection = false
local plate = ""
work = 1
local changeYourJob = {
	{ name="Pole Emploi",  id=407, x=-266.94, y=-960.744, z=31.2231 },
}

local base = {
	opened = false,
	title = "Pole emploi",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.2,
		width = 0.15,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.35,
		font = 0,
		["main"] = {
			title = "ANNONCES",
			name = "main",
			buttons = {
				{ title = "Chômeur", name = "chomeur", id = 1 },
				{ title = "Pêcheur", name = "pecheur", id = 3 },
				{ title = "Joaillier", name = "joaillier", id = 4 },
				{ title = "Chauffeur de taxi", name = "taxi", id = 5 },
				{ title = "Eboueur", name = "eboueur", id = 6 },
				{ title = "Livreur", name = "livreur", id = 8 },
				{ title = "Convoyeur de Fonds", name = "convoyeur", id = 9 },
				{ title = "Dealer", name = "dealer", id = 10 },
				{ title = "Dépanneur", name = "depanneur", id = 12 },
			}
		},
	}
}

RegisterNetEvent('jobssystem:updateJob')
AddEventHandler('jobssystem:updateJob', function(nameJob, policeGrade)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	SendNUIMessage({
		updateJob = true,
		job = nameJob,
		grade = tostring(policeGrade),
		player = playerName
	})
end)

function IsNearJobs()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
	for _, item in pairs(changeYourJob) do
	    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
	    if(distance <= 10) then
	    	return true
	    end
	end
end

Citizen.CreateThread(function()
    for _, item in pairs(changeYourJob) do
      	item.blip = AddBlipForCoord(item.x, item.y, item.z)
      	SetBlipSprite(item.blip, item.id)
    	SetBlipAsShortRange(item.blip, true)
    	BeginTextCommandSetBlipName("STRING")
    	AddTextComponentString(item.name)
    	EndTextCommandSetBlipName(item.blip)
    end
end)

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function drawMenuButton(button, x, y, selected)
	local menu = base.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.title)
	if selected then
		DrawRect(x, y, menu.width ,menu.height ,255 ,255 ,255, 255)
	else
		DrawRect(x, y, menu.width, menu.height, 0, 0, 0, 150)
	end
	DrawText(x - menu.width / 2 + 0.005, y - menu.height / 2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = base.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95, 0.65, 0.050, 0, 0, 0, 150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt, x, y, selected)
	local menu = base.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width / 2 - 0.03, y - menu.height / 2 + 0.0028)
end

function drawMenuTitle(txt, x, y)
	local menu = base.menu
		SetTextFont(2)
		SetTextProportional(0)
		SetTextScale(0.5, 0.5)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		AddTextComponentString(txt)
		DrawRect(x, y, menu.width, menu.height, 0, 0, 0, 150)
		DrawText(x - menu.width / 2 + 0.005, y - menu.height / 2 - 0.002)
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

RegisterNetEvent('setWork')
AddEventHandler('setWork', function(id)
	if id ==  11 then
		TriggerEvent('es_em:medicOn')
		TriggerEvent('police:noLongerCop')
		TriggerEvent('es_tx:taxiOff')
	elseif id == 5 then
		TriggerEvent('es_tx:taxiOn')
		TriggerEvent('police:noLongerCop')
		TriggerEvent('es_em:medicOff')
	elseif id == 2 then
		TriggerEvent('es_em:medicOff')
		TriggerEvent('es_tx:taxiOff')
	else
		work = id
		TriggerEvent('police:noLongerCop')
		TriggerEvent('es_em:medicOff')
		TriggerEvent('es_tx:taxiOff')
	end	
	TriggerServerEvent("skin_customization:SpawnPlayer")
end)

AddEventHandler("playerSpawned", function(spawn)
    TriggerServerEvent("jobssystem:spawn", spawn)
end)

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = base.currentmenu
	local btn = button.name
	local id = button.id

	-------------------
	-- Menu Pricipal --
	-------------------
	if this == "main" then
		if btn == "pecheur" then
			Notify("Rendez-vous au ~g~port de pêche")
			inSlection = false
			Close()

		elseif btn == "joaillier" then
			Notify("Rendez-vous au ~g~dépôt de camion")
			inSlection = false
			Close()

		elseif btn == "taxi" then
			Notify("Rendez-vous au ~g~dépôt de taxi")
			inSlection = false
			Close()

		elseif btn == "eboueur" then
			Notify("Rendez-vous à la ~g~décharge")
			inSlection = false
			Close()

		elseif btn == "dealer" then
			Notify("Rendez-vous à la ~g~décharge")
			inSlection = false
			Close()

		elseif btn == "livreur" then
			Notify("Rendez-vous à la ~g~décharge")
			inSlection = false
			Close()

		elseif btn == "convoyeur" then
			Notify("Rendez-vous à la ~g~décharge")
			inSlection = false
			Close()

		elseif btn == "depanneur" then
			Notify("Rendez-vous à la ~g~décharge")
			inSlection = false
			Close()
		end
		TriggerServerEvent("jobssystem:jobs", id)
	end
end

function OpenMenu(menu)
	base.lastmenu = base.currentmenu
	base.menu.from = 1
	base.menu.to = 10
	base.selectedbutton = 0
	base.currentmenu = menu
end

function Back()
	if base.currentmenu == "main" then
		Close()
	else
		OpenMenu(base.lastmenu)
	end
end

function LocalPed()
	return GetPlayerPed(-1)
end

function Open()
	inSlection = true
	base.currentmenu = "main"
	base.opened = true
	base.selectedbutton = 0
end

function Close()
	Citizen.CreateThread(function()
		inSlection = false		
		base.opened = false
		base.menu.from = 1
		base.menu.to = 10
	end)
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)	
		DrawMarker(1, -265.757, -961.45, 30.00, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 146, 186, 205, 150, 0,0, 0,0)
	    if IsNearJobs() then
	    	if not base.opened then
	    		DisplayHelpText('Appuyer sur ~g~E~w~ pour accéder aux ~b~métiers')
			end	    	
	    	--drawTxt("Appuyer sur ~g~ENTRER~s~ pour accéder aux ~b~métiers",0,1,0.5,0.8,0.4,255,255,255,255)
		    if (IsControlJustPressed(1,38) and not inSeletion) then
		    	if base.opened and not inSeletion then
					Close()
				else
					Open()
				end
			end
		else
			if base.opened then
				Close()
			end
		end
		if base.opened then
			local ped = LocalPed()
			local menu = base.menu[base.currentmenu]
			drawTxt(base.title, 1, 1, base.menu.x, base.menu.y + 0.04, 0.5, 255, 255, 255, 255)
			drawMenuTitle(menu.title, base.menu.x,base.menu.y + 0.090)
			drawTxt(base.selectedbutton.."/"..tablelength(menu.buttons), 0, 0, base.menu.x + 0.015 + base.menu.width / 2 - 0.0385, base.menu.y + 0.075, 0.4, 255, 255, 255, 255)
			local y = base.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= base.menu.from and i <= base.menu.to then
					if i == base.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,base.menu.x,y,selected)
					y = y + 0.03
					if selected and IsControlJustPressed(1, 201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if base.opened then
			if IsControlJustPressed(1, 202) then
				Back()
			end
			if IsControlJustPressed(1, 188) then
				if base.selectedbutton > 1 then
					base.selectedbutton = base.selectedbutton -1
					if buttoncount > 10 and base.selectedbutton < base.menu.from then
						base.menu.from = base.menu.from -1
						base.menu.to = base.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1, 187)then
				if base.selectedbutton < buttoncount then
					base.selectedbutton = base.selectedbutton +1
					if buttoncount > 10 and base.selectedbutton > base.menu.to then
						base.menu.to = base.menu.to + 1
						base.menu.from = base.menu.from + 1
					end
				end
			end
		end
	end
end)


-----------------
---- PECHEUR ----
local skinpecheur= true
local carpecheur = false
local pecheurStarted = false
local carHandle = nil
local fishCurrent = 1
---- PECHEUR ----
-----------------
-----------------
---- EBOUEUR ----
local skinEboueur = true
local carEboueur = false
local eboueurStarted = false
local firstTrash = true
local abort = false
local carHandle = nil
local trashCurrent = 1
local trashNext = 2
local blip = {}
local trash = {
    { x = -321.623, y = -1545.83, z = 30.0199 },
}
---- EBOUEUR ----
-----------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -----------------
        ---- PECHEUR ----
        if work == 3 then        	
            if skinpecheur then DrawMarker(1, 805.509, -2948.64, 6.0, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 146, 186, 205, 150, 0, 0, 0, 0) end            
            if carpecheur then DrawMarker(1, 789.938, -2900.15, 6.0, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 146, 186, 205, 150, 0, 0, 0, 0) end
            if pecheurStarted then
            	-- Vérification distance véhicule avant annulation de la mission
            	if (GetDistanceBetweenCoords(GetEntityCoords(carHandle), GetEntityCoords(GetPlayerPed(-1))) > 30) then
					drawTxt("Si vous vous éloignez trop du véhicule ~r~la mission va être annulée", 0,1,0.5,0.95,0.3,255,255,255,255)
            	end
            	if (GetDistanceBetweenCoords(GetEntityCoords(carHandle), GetEntityCoords(GetPlayerPed(-1))) > 60) then
            		pecheurStarted = false
					fishCurrent = 0
            	end
            	if fishCurrent == 1 then
            		-- On pèche
	            	DrawMarker(1, 1631.42, -2937.14, 1.0, 0, 0, 0, 0, 0, 0, 2.5001, 2.5001, 0.8001, 255, 244, 0, 150, 0, 0, 0, 0)
	            	if (GetDistanceBetweenCoords(1631.42, -2937.14, 1.0, GetEntityCoords(GetPlayerPed(-1))) < 5) then
	            		drawTxt("~b~Pèche du poisson en cours...", 0,1,0.5,0.95,0.3,255,255,255,255)
	            		Citizen.CreateThread(function()
	            			Citizen.Wait(15000)
	            			--bite ajout iventaire
	            			--marker pour revenir au port
		            		DrawMarker(1, 789.938, -2900.15, 6.0, 0, 0, 0, 0, 0, 0, 2.5001, 2.5001, 0.8001, 255, 244, 0, 150, 0, 0, 0, 0)
	            	else
            			fishCurrent = 2
	            	end
	            else
            		if fishCurrent == 2 then
            			-- on revient au port et on prend le camion
		            	DrawMarker(1, 789.938, -2900.15, 6.0, 0, 0, 0, 0, 0, 0, 2.5001, 2.5001, 0.8001, 255, 244, 0, 150, 0, 0, 0, 0)
		                if (GetDistanceBetweenCoords(789.938, -2900.15, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 5 and carpecheur) then
		                	--bite spawn camion
		                	TriggerEvent('vehshop:spawnVehicle', 'trash')
		                	carHandle = GetVehiclePedIsUsing(GetPlayerPed(-1))
		                	carpecheur = false
	            			drawTxt("Aller a ~w~ l'usine  ~w~ pour transformation votre poisson", 0,1,0.5,0.95,0.3,255,255,255,255)
		                end
	            		-- Transformation du poisson
		            	if (GetDistanceBetweenCoords(1087.9, -2289.72, 30.1851, GetEntityCoords(GetPlayerPed(-1))) < 15) then
		            		drawTxt("~b~Transformation du poisson en cours...", 0,1,0.5,0.95,0.3,255,255,255,255)
		            		--bite modif inventaire poisson en poisson pané
		            	else
		            		drawTxt("Aller a ~w~ l'entrepot  ~w~ pour vendre votre poisson", 0,1,0.5,0.95,0.3,255,255,255,255)
		                	fishCurrent = 3               	
		            	end
		            else
		            	-- Vente du poisson à l'entrepot
            		if fishCurrent == 3 then
			            	DrawMarker(1, -58.2754, -1840.23, 26.5854, 0, 0, 0, 0, 0, 0, 2.5001, 2.5001, 0.8001, 255, 244, 0, 150, 0, 0, 0, 0)
			            	if (GetDistanceBetweenCoords(-58.2754, -1840.23, 26.58548, GetEntityCoords(GetPlayerPed(-1))) < 5) then
			            		drawTxt("~b~Vente du poisson en cours...", 0,1,0.5,0.95,0.3,255,255,255,255)
			            		--bite supp inventaire
			            		end
			            	else
			            		drawTxt("Retournez au ~w~ port ~w~ pour finir votre tournée", 0,1,0.5,0.95,0.3,255,255,255,255)
			            		fishCurrent = 4
			            	end
			            end
			            else
			            	-- Fin de la mission on dépose le camion
            				if fishCurrent == 4 then
				                if (GetDistanceBetweenCoords(864.625, -2990.77, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 5) then
				                	--bite suppresion du camion
				                	TriggerEvent('vehshop:spawnVehicle', 'trash')
				                end
				        	end
		         		end
		            end
	            end
	        end
	        if (GetDistanceBetweenCoords(805.509, -2948.64, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 2 and skinpecheur) then
                DisplayHelpText('Appuyer sur ~g~ENTRER~w~ pour prendre votre ~g~service')
            end
            if (GetDistanceBetweenCoords(789.938, -2900.15, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 2 and carpecheur) then
                DisplayHelpText('Appuyer sur ~g~ENTRER~w~ pour récupérer votre bateau')
            end
            if IsControlJustPressed(1, 201) then
                if (GetDistanceBetweenCoords(805.509, -2948.64, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 2 and skinpecheur) then
                	skinpecheur = false
                	carpecheur = true
                	abort = false
                	--bite skin pecheur
                	TriggerServerEvent("loadout", "pecheur")
                end
                if (GetDistanceBetweenCoords(789.938, -2900.15, 6.0, GetEntityCoords(GetPlayerPed(-1))) < 2 and carpecheur) then
                	--bite spawn bateau
                	TriggerEvent('vehshop:spawnVehicle', 'boat')
                	fishCurrent = 1           
                	pecheurStarted = true    	
                	Citizen.Wait(1000)
                	carHandle = GetVehiclePedIsUsing(GetPlayerPed(-1))
                end
            end
        end
        ---- PECHEUR ----
        -----------------
        -----------------
        ---- EBOUEUR ----
        if work == 6 then        	
            if skinEboueur then DrawMarker(1, -321.623, -1545.83, 30.0199, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 146, 186, 205, 150, 0, 0, 0, 0) end            
            if carEboueur then DrawMarker(1, -314.676, -1532.25, 26.6293, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 146, 186, 205, 150, 0, 0, 0, 0) end

            if eboueurStarted then
            	-- Vérification distance véhicule avant annulation de la mission
            	if (GetDistanceBetweenCoords(GetEntityCoords(carHandle), GetEntityCoords(GetPlayerPed(-1))) > 30) then
					drawTxt("Si vous vous éloignez trop du véhicule ~r~la mission va être annulée", 0,1,0.5,0.95,0.3,255,255,255,255)
            	end
            	if (GetDistanceBetweenCoords(GetEntityCoords(carHandle), GetEntityCoords(GetPlayerPed(-1))) > 60) then
					skinEboueur = true
					carEboueur = false
					eboueurStarted = false
					abort = true
            	end
            	if trashCurrent <= #trash then
            		-- Tournée des poubelles
	            	if firstTrash then
	            		blip = AddBlipForCoord(trash[1].x, trash[1].y, trash[1].z)
	            		SetBlipSprite(blip, 1)
    					SetBlipColour(blip, 70)
						SetBlipRoute(blip, true)
						firstTrash = false
	            	else
	            		if trashCurrent == trashNext then 
	            			blip = AddBlipForCoord(trash[trashCurrent].x, trash[trashCurrent].y, trash[trashCurrent].z)
	            			SetBlipSprite(blip, 1)
    						SetBlipColour(blip, 70)
							SetBlipRoute(blip, true)
	                    	trashNext = trashNext + 1						
						end	
	            	end
	            	DrawMarker(1, trash[trashCurrent].x, trash[trashCurrent].y, trash[trashCurrent].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.8001, 0, 255, 0, 150, 0, 0, 0, 0)
	                if (GetDistanceBetweenCoords(trash[trashCurrent].x, trash[trashCurrent].y, trash[trashCurrent].z, GetEntityCoords(GetPlayerPed(-1))) < 2) then
	                	if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
	                		SetBlipSprite(blip, 2)
	                		SetBlipRoute(blip, false)
	                    	trashCurrent = trashCurrent + 1
	                	end
	                end
	            else
	            	-- Déchargement du camion
	            	if not abort then
		            	DrawMarker(1, -348.597, -1520.16, 26.4458, 0, 0, 0, 0, 0, 0, 2.5001, 2.5001, 0.8001, 255, 244, 0, 150, 0, 0, 0, 0)
		            	if (GetDistanceBetweenCoords(-348.597, -1520.16, 27.4458, GetEntityCoords(GetPlayerPed(-1))) < 5 and eboueurStarted) then
		            		drawTxt("~b~Déchargement en cours...", 0,1,0.5,0.95,0.3,255,255,255,255)
		            		Citizen.CreateThread(function()
		            			Citizen.Wait(15000)
		            			eboueurStarted = false
		            			skinEboueur = true
		            			carEboueur = false
		            			user:addMoney(1500)
		            		end)
		            	else
		            		drawTxt("Retournez à la ~w~décharge ~w~pour vider le camion", 0,1,0.5,0.95,0.3,255,255,255,255)
		            	end
		            end
	            end
	        end
	        if (GetDistanceBetweenCoords(-321.623, -1545.83, 31.0199, GetEntityCoords(GetPlayerPed(-1))) < 2 and skinEboueur) then
                DisplayHelpText('Appuyer sur ~g~E~w~ pour prendre votre ~g~service')
            end
            if (GetDistanceBetweenCoords(-314.676, -1532.25, 26.6293, GetEntityCoords(GetPlayerPed(-1))) < 2 and carEboueur) then
                DisplayHelpText('Appuyer sur ~g~E~w~ pour récupérer votre véhicule')
            end
            if IsControlJustPressed(1, 201) then
                if (GetDistanceBetweenCoords(-321.623, -1545.83, 31.0199, GetEntityCoords(GetPlayerPed(-1))) < 2 and skinEboueur) then
                	skinEboueur = false
                	carEboueur = true
                	abort = false
                	TriggerServerEvent("loadout", "eboueur")
                end
                if (GetDistanceBetweenCoords(-314.676, -1532.25, 26.6293, GetEntityCoords(GetPlayerPed(-1))) < 2 and carEboueur) then
                	TriggerEvent('vehshop:spawnVehicle', 'trash')
                	carEboueur = false                	
                	eboueurStarted = true                	
                	Citizen.Wait(1000)
                	carHandle = GetVehiclePedIsUsing(GetPlayerPed(-1))
                end
            end
        end
        ---- EBOUEUR ----
        -----------------
    end
end)
