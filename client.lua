--bite ligne 364
-----------------
---- PECHEUR ----
local skinpecheur= true
local carpecheur = false
local pecheurStarted = false
local carHandle = nil
local fishCurrent = 1
---- PECHEUR ----
-----------------

--bite ligne 393
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
