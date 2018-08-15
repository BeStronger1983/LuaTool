require "Class"

local AccountTemplate = class()

-- Abstract Methods
function AccountTemplate:Allow()
    error("abstract method: should be implemented by derived")
end

function AccountTemplate:NotAllow()
    error("abstract method: should be implemented by derived")
end

function AccountTemplate:MaxLimit()
    error("abstract method: should be implemented by derived")
end

-- Template Method
function AccountTemplate:Withdraw(amount)
    print("Withdraw " .. amount)
    local limit = self:MaxLimit()

    if amount < limit then
        self:Allow()
    else
        self:NotAllow()
    end

    print("--------------------------------------------------------------------------------------")
end

--------------------------------------------------------------------------------------

local AccountNormal = class(AccountTemplate)

-- Implement Abstract Methods
function AccountNormal:Allow()
    print("AccountNormal Allow this Withdraw ...")
end

function AccountNormal:NotAllow()
    print("AccountNormal Not Allow this Withdraw ...")
end

function AccountNormal:MaxLimit()
    return 1000
end

--------------------------------------------------------------------------------------

local AccountPower = class(AccountTemplate)

-- Implement Abstract Methods
function AccountPower:Allow()
    print("AccountPower Allow this Withdraw ...")
end

function AccountPower:NotAllow()
    print("AccountPower Not Allow this Withdraw ...")
end

function AccountPower:MaxLimit()
    return 5000
end

--------------------------------------------------------------------------------------

local normal = class(AccountNormal)
normal:Withdraw(600)
normal:Withdraw(1500)

local power = class(AccountPower)
power:Withdraw(3000)
power:Withdraw(10000)
