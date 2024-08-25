local Visualizacao = {}

function Visualizacao:mostrar_memoria(memorias)
    print("\nEstado atual da memória:")

    local preenchido = "#"
    local livre = "."

    for i, memoria in ipairs(memorias) do
        local tamanho = memoria:getTamanho()
        local livre_size = memoria:getLivre()
        local ocupado_size = tamanho - livre_size
        local visualizacao = ""
        if ocupado_size > 0 then
            visualizacao = visualizacao .. string.rep(preenchido, ocupado_size)
        end
        if livre_size > 0 then
            visualizacao = visualizacao .. string.rep(livre, livre_size)
        end

        print(string.format("Memória %d: %s (%dK livre)", i, visualizacao, livre_size))
    end
end

return Visualizacao

