local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Salvar posição original
local originalPosition = humanoidRootPart.CFrame

-- Função para teleportar para todos os Tools
local function teleportToTools()
    local tools = {}  -- Tabela para armazenar as ferramentas
    -- Procurar por todas as ferramentas no Workspace
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Tool") then
            table.insert(tools, obj)  -- Adiciona ferramenta à lista
        end
    end
    
    -- Teleporta para cada ferramenta uma vez
    for _, tool in pairs(tools) do
        if tool.Parent == workspace then  -- Verifica se a ferramenta ainda está no mapa
            humanoidRootPart.CFrame = tool.Handle.CFrame  -- Teleporta para a posição da ferramenta
            wait(0)  -- Espera o próximo frame para teleportar
        end
    end

    -- Retorna para a posição original após pegar todas as ferramentas
    humanoidRootPart.CFrame = originalPosition
end

-- Inicia a função de teleportar quando o script é executado
teleportToTools()
