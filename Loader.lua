--// Services
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IsStudio = RunService:IsStudio()

--// Fetch library
local ImGui
if IsStudio then
    ImGui = require(ReplicatedStorage.ImGui)
else
    local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
    ImGui = loadstring(game:HttpGet(SourceURL))()
end

--// Window (Key System) - Centralizada e compacta
local KeySystem = ImGui:CreateWindow({
    Title = "Symera Loader            Status: On ",
    Size = UDim2.new(0, 300, 0, 100), -- Largura mantida, altura reduzida para 100 pixels
    Position = UDim2.new(0.5, -150, 0.5, -50), -- Centralizando na tela
    TabsBar = false,
    NoCollapse = true,
    NoResize = true,
    NoClose = true,
})

-- Criando o conteúdo da janela
local Content = KeySystem:CreateTab({ Visible = true })
local Checkbox = Content:Checkbox({ Label = "Iniciar menu", Value = false })

-- Variável para controlar a barra de progresso
local ProgressBar

-- Função para criar a barra de progresso
local function CreateProgressBar()
    if ProgressBar then
        ProgressBar:Destroy() -- Remove a barra se já existir
    end

    ProgressBar = Content:ProgressBar({ Label = "Loading...", Percentage = 0 })

    -- Atualizando a barra de progresso
    coroutine.wrap(function()
        for Percentage = 0, 100 do
            wait(0.2) -- Velocidade da barra
            ProgressBar:SetPercentage(Percentage)

            -- Destrói o menu e executa o código quando atingir 100%
            if Percentage >= 100 then
                KeySystem:Destroy() -- Destrói o menu
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Kovizim/Basic-menu/refs/heads/main/Meumenu.lua"))() -- Executa o código
                break
            end
        end
    end)()
end

-- Callback para a checkbox
Checkbox.Callback = function(self, Value)
    if Value then
        CreateProgressBar() -- Cria a barra de progresso se ativada
    else
        if ProgressBar then
            ProgressBar:Destroy() -- Remove a barra de progresso
            ProgressBar = nil
        end
    end
end
