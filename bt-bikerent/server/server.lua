ESX = exports['es_extended']:getSharedObject()

-- Code --
ESX.RegisterServerCallback('bt-bikrent:server:getItem', function(src, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getInventoryItem('gtx1650').count >= amount then
        xPlayer.removeItem(amount)
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('bt-bikerent:removeItem')
AddEventHandler('bt-bikerent:removeItem', function(itemName, itemCount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem(itemName, itemCount)
end)

ESX.RegisterServerCallback('bt-bikerent:server:item', function(src, cb, action, item, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    if action == 'add' then
        if xPlayer.canCarryItem(item, amount) then
            xPlayer.addInventoryItem(item, amount)
            cb(true)
        else
            cb(false)
        end
    elseif action == 'remove' then
        if xPlayer.getInventoryItem(item).count >= amount then
            xPlayer.removeInventoryItem(item, amount)
            cb(true)
        else
            cb(false)
        end
    elseif action == 'get' then
        if xPlayer.getInventoryItem(item).count >= amount then
            cb(true)
        else
            cb(false)
        end
    elseif action == 'carry' then
        if xPlayer.canCarryItem(item, amount) then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('bt-bikrent:server:getMoney', function(src, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getInventoryItem('cash').count >= amount then
        xPlayer.removeMoney(amount)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('bt-bikerent:server:giveMoney', function(src, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.canCarryItem('cash', amount) then
        xPlayer.addMoney(amount)
        cb(true)
    else
        cb(false)
    end
end)