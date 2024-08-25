local CLI = {}

function CLI:mostrar_menu()
    print("Escolha o algoritmo:")
    print("1. First-Fit")
    print("2. Best-Fit")
    print("3. Worst-Fit")
    io.write("Digite o número da sua escolha: ")
    return tonumber(io.read())
end

function CLI:executar_escolha(escolha, processos, memorias, algoritmos)
    local algoritmo
    if escolha == 1 then
        algoritmo = algoritmos.FirstFit
    elseif escolha == 2 then
        algoritmo = algoritmos.BestFit
    elseif escolha == 3 then
        algoritmo = algoritmos.WorstFit
    else
        print("Escolha inválida.")
        return false
    end
    return algoritmo:alocar(processos, memorias)
end

return CLI

