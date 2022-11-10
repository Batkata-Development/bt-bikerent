Config = {}

Config.Blip = true -- TRUE OR FALSE --
Config.NPCLocations = {
    { x = 224.30474, y = 171.84652, z = 105.19875, h = 33.641262, ped = 'a_m_m_genfat_01', scale = 1.0, sprite = 480, colour = 29, label = 'Колела под наем'}, -- PED LOCATION AND BLIP --
}
Config.Prices = {
    ['getprice'] = 80, -- GET PRICE HOW MUCH TO GET --
    ['returnprice'] = 60 -- RETURN PRICE HOW MUCH TO RETURN --
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
