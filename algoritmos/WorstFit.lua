local WorstFit = {}

function WorstFit:alocar(processos, memorias)
    local alocacao = {}
    for _, processo in ipairs(processos) do
        local pior_memoria
        local maior_livre = 0
        for _, memoria in ipairs(memorias) do
            local livre = memoria:getLivre()
            if processo:getTamanho() <= livre and livre > maior_livre then
                pior_memoria = memoria
                maior_livre = livre
            end
        end
        if pior_memoria then
            pior_memoria:alocar(processo)
            table.insert(alocacao, {processo = processo, memoria = pior_memoria})
        else
            return "não cabeu :("
        end
    end
    return alocacao
end

return WorstFit

