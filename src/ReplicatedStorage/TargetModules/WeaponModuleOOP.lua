local StarterGui = game:GetService("StarterGui")
local BaseWeapon = {}
BaseWeapon.__index = BaseWeapon

function BaseWeapon.new(name, WeaponType) -- Constuctor function
    local NewWeapon = {}
    setmetatable(NewWeapon, BaseWeapon)

    NewWeapon.Name = name
    NewWeapon.WeaponType = WeaponType

    return NewWeapon
end

function BaseWeapon:Damage()
    self.Damage = 50
end

function BaseWeapon:Flash()

end

function BaseWeapon:Reload()
    self.ReloadSpeed = 13
end

function BaseWeapon:Fire()

end

function BaseWeapon:Equip()

end
return BaseWeapon