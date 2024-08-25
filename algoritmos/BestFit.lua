local BestFit = {}

function BestFit:alocar(processos, memorias)
    local alocacao = {}
    for _, processo in ipairs(processos) do
        local melhor_memoria
        local menor_livre = math.huge
        for _, memoria in ipairs(memorias) do
            local livre = memoria:getLivre()
            if processo:getTamanho() <= livre and livre < menor_livre then
                melhor_memoria = memoria
                menor_livre = livre
            end
        end
        if melhor_memoria then
            melhor_memoria:alocar(processo)
            table.insert(alocacao, {processo = processo, memoria = melhor_memoria})
        else
            return "não cabeu :("
        end
    end
    return alocacao
end

return BestFit

