local Processo = require("classes.Processo")
local Memoria = require("classes/Memoria")
local CLI = require("utils/CLI")
local Visualizacao = require("utils/Visualizacao")
local FirstFit = require("algoritmos.FirstFit")
local BestFit = require("algoritmos.BestFit")
local WorstFit = require("algoritmos/WorstFit")

-- Ajuste dos tamanhos dos processos e memórias
local processos = {
    Processo:new(50),  -- Menor tamanho de processo
    Processo:new(75),  -- Menor tamanho de processo
    Processo:new(100)  -- Tamanho de processo moderado
}

local memorias_base = {
    Memoria:new(100), -- Memória suficiente para um processo
    Memoria:new(200), -- Memória suficiente para dois processos
    Memoria:new(300)  -- Memória suficiente para todos os processos
}

local algoritmos = {
    FirstFit = FirstFit,
    BestFit = BestFit,
    WorstFit = WorstFit
}

-- Inicializa as memórias com a base
local memorias = {}
for i, memoria in ipairs(memorias_base) do
    memorias[i] = Memoria:new(memoria.tamanho)
end

while true do
    local escolha = CLI:mostrar_menu()

    -- Executa o algoritmo escolhido e verifica o resultado
    local resultado = CLI:executar_escolha(escolha, processos, memorias, algoritmos)

    -- Verifica se o resultado é uma string indicando que não cabe mais
    if type(resultado) == "string" and resultado == "não cabeu :(" then
        print(resultado)
    else
        -- Exibe o estado atual da memória
        Visualizacao:mostrar_memoria(memorias)
    end

    -- Pergunta ao usuário se deseja escolher outro algoritmo
    io.write("\nDeseja escolher outro algoritmo? (s/n): ")
    local continuar = io.read()
    if continuar:lower() ~= "s" then
        print("Encerrando o programa.")
        break
    end
end

