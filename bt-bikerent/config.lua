Config = {}

Config.Blip = true -- TRUE OR FALSE --
Config.NPCLocations = {
    { x = 224.30474, y = 171.84652, z = 105.19875, h = 33.641262, ped = 'a_m_m_genfat_01', scale = 1.0, sprite = 480, colour = 29, label = 'Колела под наем'}, -- PED LOCATION AND BLIP --
}
Config.Prices = {
    ['getprice'] = 80, -- GET PRICE HOW MUCH TO GET --
    ['returnprice'] = 80 -- RETURN PRICE HOW MUCH TO RETURN --
}

Config.Language = {
    ['context_header'] = 'КОЛЕЛА ПОД НАЕМ', -- HEADER NAME --
    ['context_open_menu'] = 'Bmx Bike', -- NAME 1 --
    ['context_open_menu_description'] = 'Вземи колелото за 80$.', -- NAME DESCRIPTION --
    ['context_bt_bike'] = 'Върни колелото.', -- NAME 2 --
    ['context_bt_bike_return'] = 'Връща ти 80$.', -- NAME 2 DESCRIPTION --
}

Config.Notify = {
    ['you_dont_have_bike'] = 'Нямаш колело което да върнеш!',
    ['you_return_a_bike'] = 'Ти върна колело за 80$.',
    ['alreay_have_bike'] = 'Вече имаш колело.',
    ['you_get_bike'] = 'Ти взе колелото сега карай и си пази rental paper-a.',
}
-- IGNORE --

function Notify(msg, type)
    if type == 'info' then
        exports['king-library']:Notify(msg, 'primary')
    elseif type == 'success' then
        exports['king-library']:Notify(msg, 'success')
    elseif type == 'error' then
        exports['king-library']:Notify(msg, 'error')
    end
end

function TextUI(msg, type)
    if type == 'info' then
        exports['king-library']:TextUI('show', msg, 'info')
    elseif type == 'success' then
        exports['king-library']:TextUI('show', msg, 'success')
    elseif type == 'error' then
        exports['king-library']:TextUI('show', msg, 'error')
    elseif type == 'hide' then
        exports['king-library']:TextUI('hide')
    end
end