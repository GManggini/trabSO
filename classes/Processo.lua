local Processo = {}
Processo.__index = Processo

function Processo:new(tamanho)
    local obj = {tamanho = tamanho}
    setmetatable(obj, Processo)
    return obj
end

function Processo:getTamanho()
    return self.tamanho
end

return Processo

