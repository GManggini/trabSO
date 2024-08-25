local Memoria = {}
Memoria.__index = Memoria

function Memoria:new(tamanho)
    local obj = { tamanho = tamanho, livre = tamanho }
    setmetatable(obj, Memoria)
    return obj
end

-- aloca processo na memoria
function Memoria:alocar(processo)
    if processo:getTamanho() <= self.livre then
        self.livre = self.livre - processo:getTamanho()
        return true
    else
        return false
    end
end

-- ler tamanho total memoria
function Memoria:getTamanho()
    return self.tamanho
end

-- ler espaco livre
function Memoria:getLivre()
    return self.livre
end

return Memoria

