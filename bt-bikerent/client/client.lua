ESX = exports['es_extended']:getSharedObject()

-- LOOPS --

local havebtbmx = false

for batkata,batka in pairs(Config.NPCLocations) do
    if Config.Blip then
        CreateThread(function()
            local bikeblip = AddBlipForCoord(batka.x, batka.y, batka.z)
            SetBlipSprite(bikeblip, batka.sprite)
            SetBlipScale(bikeblip, batka.scale)
            SetBlipColour(bikeblip, batka.colour)
            SetBlipAsShortRange(bikeblip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(batka.label)
            EndTextCommandSetBlipName(bikeblip)
        end)
    end
end

for shmatka,batka in pairs(Config.NPCLocations) do
    CreateThread(function()
        RequestModel(GetHashKey(batka.ped))
        while not HasModelLoaded(GetHashKey(batka.ped)) do
            Wait(1)
        end 
        npc = CreatePed(1, GetHashKey(batka.ped), batka.x, batka.y, batka.z-1, batka.h, false, true)
        SetPedCombatAttributes(npc, 46, true)
        SetPedFleeAttributes(npc, 0, 0)
        SetBlockingOfNonTemporaryEvents(npc, true)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
    end)
end

-- CODE --

for btbike,bike in pairs(Config.NPCLocations) do
    exports['qtarget']:AddBoxZone("btbikerent", vector3(bike.x, bike.y, bike.z), 1.0, 1.0, {
        name="btbikerent",
        heading=bike.h,
        debugPoly=false,
        minZ=bike.z-1-2,
        maxZ=bike.z-1+2
    }, {
        options = {
            {
                icon = "fa-solid fa-bicycle",
                label = "Вземи колело под наем",
                action = function()
                    lib.registerContext({
                        id = 'btbikerent_menu',
                        title = Config.Language['context_header'],
                        options = {
                            {
                                title = Config.Language['context_open_menu'],
                                description = Config.Language['context_open_menu_description'],
                                arrow = true,
                                onSelect = function()
                                    lib.hideContext()
                                    if not havebtbmx then
                                        ESX.TriggerServerCallback('bt-bikrent:server:getMoney', function(haveMoney)
                                            if haveMoney then
                                                ESX.Game.SpawnVehicle('bmx', vector3(222.59094, 173.52476, 105.23776), 75.0, function(vehicle)
                                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                    ESX.TriggerServerCallback('bt-bikerent:server:item', function(itemGiven)
                                                        if itemGiven then
                                                            Notify('Ти взе колелото сега карай и си пази rental paper-a.', 'success')
                                                        end
                                                    end, 'add', 'rental', '1')
                                                    bmxvehicle = vehicle
                                                end)
                                                havebtbmx = true
                                            end
                                        end, Config.Prices['getprice'])
                                    else
                                        Notify(Config.Notify['alreay_have_bike'], 'error')
                                    end
                                end
                            },
                            {
                                title = Config.Language['context_bt_bike'],
                                description = Config.Language['context_bt_bike_return'],
                                onSelect = function()
                                    if havebtbmx then
                                        if DoesEntityExist(bmxvehicle) then
                                            ESX.Game.DeleteVehicle(bmxvehicle)
                                            ESX.TriggerServerCallback('bt-bikerent:server:giveMoney', function(moneyGiven)
                                                if moneyGiven then
                                                    Notify(Config.Notify['you_return_a_bike'], 'success')
                                                    TriggerServerEvent('bt-bikerent:removeItem', 'rental', 1)
                                                    havebtbmx = false
                                                end
                                            end, Config.Prices['returnprice'])
                                        end
                                    else
                                        Notify(Config.Notify['you_dont_have_bike'], 'error')
                                    end
                                end
                            }
                        }
                    })
                    lib.showContext('btbikerent_menu')
                end
            },
        },
        distance = 1.5
    })
end