local FirstFit = {}

function FirstFit:alocar(processos, memorias)
    local alocacao = {}
    for _, processo in ipairs(processos) do
        local alocado = false
        for _, memoria in ipairs(memorias) do
            if memoria:getLivre() >= processo:getTamanho() then
                memoria:alocar(processo)
                alocado = true
                table.insert(alocacao, {processo = processo, memoria = memoria})
                break
            end
        end
        if not alocado then
            return "não cabeu :("
        end
    end
    return alocacao
end

return FirstFit

