RegisterNetEvent("delallveh")
AddEventHandler("delallveh", function ()
    TriggerEvent('chatMessage', '', { 255, 255, 255 }, "^1Vehicle Cleanup in 30 seconds^3.")    --- Edit this to change the massage before the cleanup!
    Citizen.Wait(30000)                                                                         --- Time before the cleanup is done 30 000 = 30 seconds
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
    TriggerEvent('chatMessage', '', { 255, 255, 255 }, "^1Vehicle Cleanup Complete!^3.")     --- This is massage after the cleanup has been completed!
end)