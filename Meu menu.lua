--Serviços 
local RunService: RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IsStudio = RunService:IsStudio()

--// Buscar biblioteca
local ImGui
if IsStudio then
    ImGui = require(ReplicatedStorage.ImGui)
else
    local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
    ImGui = loadstring(game:HttpGet(SourceURL))()
end

local RunService = game:GetService("RunService")
local PlayersService = game:GetService("Players")

local Watermark = ImGui:CreateWindow({
    Position = UDim2.fromOffset(10, 10),
    NoSelectEffect = true,
    CornerRadius = UDim.new(0, 4),
    AutoSize = "XY",
    TabsBar = false,
    NoResize = true,
    NoDrag = true,
    NoTitleBar = true,
    
    Border = true,
    BorderThickness = 2, 
    BackgroundTransparency = 0.8,
}):CreateTab({
    Visible = true
})

-- Label para "By Kovizim"
local AuthorLabel = Watermark:Label({
    Text = "By Kovizim",
    TextColor3 = Color3.fromRGB(173, 216, 230), -- Azul claro
    TextSize = 12 -- Tamanho do texto reduzido
})

-- Label para o ID do jogo
local GameIDLabel = Watermark:Label({
    TextSize = 12 -- Tamanho do texto reduzido
})

-- Label para o ID do usuário
local UserIDLabel = Watermark:Label({
    TextSize = 12 -- Tamanho do texto reduzido
})

RunService.RenderStepped:Connect(function()
    -- Obtém o ID e o nome do jogo
    local GameID = game.PlaceId
    local GameName = game.Name

    -- Obtém o ID do usuário
    local UserID = PlayersService.LocalPlayer.UserId
    local PlayerName = PlayersService.LocalPlayer.Name

    -- Atualiza os labels
    GameIDLabel.Text = `ID:{GameID}({GameName})  ` -- Formato do ID do jogo
    UserIDLabel.Text = `User:{PlayerName}` -- Formato do ID do usuário
end)

--// Criar Janela do Sistema de Key
local KeySystem = ImGui:CreateWindow({
    Title = "Symera  |  Sistema de Key",
    TabsBar = false,
    AutoSize = "Y",
    NoCollapse = true,
    NoResize = true,
    NoClose = false
})

-- Centraliza a janela
KeySystem.Position = UDim2.new(0.5, -KeySystem.Size.X.Offset / 2, 0.5, -KeySystem.Size.Y.Offset / 2)

local Content = KeySystem:CreateTab({
    Visible = true
})

local Key = Content:InputText({
    Label = "Key",
    PlaceHolder = "Key aqui",
    Value = "",
})

Content:Button({
    Text = "Entrar",
    Callback = function()
        if Key:GetValue() == "124" then
            KeySystem:Close() -- Fechando a UI
            
            
            local RunService: RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IsStudio = RunService:IsStudio()

--// Buscar biblioteca
local ImGui
if IsStudio then
    ImGui = require(ReplicatedStorage.ImGui)
else
    local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
    ImGui = loadstring(game:HttpGet(SourceURL))()
end

--// Janela
local Window = ImGui:CreateWindow({
    Title = "Symera Logs",
    Size = UDim2.new(0, 340, 0, 350),
    Position = UDim2.new(0.5, 2, 2, 50)
})
Window:Center()
print(Window.Name)

local AntiCheatTab = Window:CreateTab({
    Name = "Anti-cheat"  -- Mudando o nome de Console para Anti-cheat
})

Window:ShowTab(AntiCheatTab)

local Row2 = AntiCheatTab:Row()

AntiCheatTab:Separator({
    Text = "Anti-cheat:"
})

local Console = AntiCheatTab:Console({
    Text = "Anti-Cheat",
    ReadOnly = true,
    LineNumbers = false,
    Border = false,
    Fill = true,
    Enabled = true,
    AutoScroll = true,
    RichText = true,
    MaxLines = 5000
})

Row2:Button({
    Text = "Limpar",
    Callback = Console.Clear
})
Row2:Button({
    Text = "Copiar"
})
Row2:Button({
    Text = "Pausar",
    Callback = function(self)
        local Paused = shared.Pause
        Paused = not (Paused or false)
        shared.Pause = Paused

        self.Text = Paused and "Pausado" or "Pausar"
        Console.Enabled = not Paused
    end,
})
Row2:Fill()

local antiCheatDetected = false

-- Lista de jogos com anti-cheat
local antiCheatGames = {
    "Arsenal",
    "Phantom Forces",
    "Jailbreak",
    "Adopt Me!",
    "Tower of Hell",
    "Murder Mystery 2",
    "Brookhaven",
    "Bloxburg",
    "Super Bomb Survival",
    "Build A Boat For Treasure",
    "Loomian Legacy",
    "Pet Simulator X",
    "Shindo Life",
    "Anime Fighting Simulator",
    "Flee the Facility",
    "Strucid",
    "MeepCity",
    "Robloxian High School",
    "Bee Swarm Simulator",
    "Tower Defense Simulator",
    "Super Striker League",
    "Vehicle Simulator",
    "Dragon Adventures",
    "Treasure Hunt Simulator",
    "Theme Park Tycoon 2",
    "Speed Run 4",
    "The Wild West",
    "Arctic Simulator",
    "Ragdoll Mayhem",
    "Dungeon Quest",
    "Vesteria",
    "Bee Swarm Simulator",
    "Combat Warriors",
    "SharkBite",
    "Epic Minigames",
    "Jailbreak",
    "Loomian Legacy",
    "Rogue Lineage",
    "Sonic Speed Simulator",
    "Racing Legends",
    "Murder Party",
    "Natural Disaster Survival",
    "Escape Room",
    "Build A Boat For Treasure",
    "Camping",
    "Zombie Attack",
    "Super Bomb Survival",
    "Swordburst 2",
    "Blox Fruits",
    "Bad Business",
    "Project: Alpha",
    "Arsenal",
    "Lumion Legacy",
    "Work at a Pizza Place",
    "Big Paintball!",
    "Tower Heroes",
    "Mad City",
    "Phantom Forces",
    "Demonfall",
    "Dragon Ball Z Final Stand",
    "War Simulator",
    "Tower Defense Simulator",
    "Anime Fighters",
    "Shindo Life",
    "Murder Mystery X",
    "Pet Simulator 2",
    "Ice Cream Simulator",
    "Super Golf!",
    "Jailbreak",
    "Ragdoll Masters",
    "Blox Fruits",
    "Adopt Me!",
    "Super Paper Roblox",
    "Zombie Rush",
    "KAT!",
    "Survivor",
    "Wild Savannah",
    "Funky Friday",
    "Speed Run 4",
    "Apocalypse Rising",
    "Dragon Ball Z: Final Stand",
    "Trade Hangout",
    "Bloxburg",
    "The Wild West",
    "Sky Wars",
    "Destruction Simulator",
    "Tower of Hell",
    "Project: Z",
    "Anime Fighting Simulator",
    "Island Royale",
    "Sharkbite",
    "Super Striker League",
    "Bee Swarm Simulator",
    "Dungeon Quest",
    "Roblox High School 2",
    "Outlaster",
    "Piggy",
    "The Mimic",
    "Flee the Facility",
    "Anime Adventures",
    "Ghost Simulator",
    "Bloxburg",
    "Arsenal",
}

-- Função simulada para determinar se um anti-cheat está presente
local function isAntiCheatActive()
    -- Lógica para verificar se há algum anti-cheat ativo
    -- Substitua esta parte pela verificação real do anti-cheat
    local currentGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    for _, gameName in ipairs(antiCheatGames) do
        if gameName == currentGame then
            return true  -- Anti-cheat detectado
        end
    end
    return false  -- Nenhum anti-cheat detectado
end

coroutine.wrap(function()
    while wait(0.1) do  -- Aumenta a frequência das mensagens para a cada 0,5 segundos
        if shared.Pause then
            continue  -- Pula o loop se estiver pausado
        end

        -- Verifica se o anti-cheat está ativo
        antiCheatDetected = isAntiCheatActive()

        if antiCheatDetected then
            Console:AppendText(
                `<font color="rgb(255, 255, 255)">[ALERTA] Anti-cheat está ativo neste jogo!</font>`
            )
        else
            -- Gera mensagens aleatórias se não houver anti-cheat
            local Date = DateTime.now():FormatLocalTime("h:mm:ss A", "pt-br")  -- Mudando o formato da data para português
            local randomValue = math.random()  -- Obtendo um valor aleatório
            
            Console:AppendText(
                `<font color="rgb(240, 40, 10)">[Logs]</font>`, 
                randomValue  -- Adicionando o valor aleatório ao log
            )
            Console:AppendText(
                `<font color="rgb(0, 255, 0)">[{Date}] Valor: {randomValue}</font>`  -- Formatando a mensagem
            )
        end
    end
end)()
            
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Symera", "rbxassetid://8569322835")

local tab = DrRayLibrary.newTab("Players", "rbxassetid://7300489566")

-- Variáveis globais
local teleporting = false
local currentPlayer = nil

-- Função para teleporte atrás do jogador a 3 metros e olhar para ele
local function teleportBehindPlayer(player)
    local localPlayer = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = player.Character.HumanoidRootPart.Position - (player.Character.HumanoidRootPart.CFrame.LookVector * 3) -- 3 metros atrás do jogador
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos, player.Character.HumanoidRootPart.Position) -- Olhar para o jogador
    end
end

-- Função para atualizar a lista de jogadores
local playersList = {}
local function updatePlayersList()
    playersList = {} -- Limpar a lista
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playersList, player.Name)
    end
end

-- Atualiza a lista de jogadores e força a atualização do dropdown
local function refreshDropdown()
    updatePlayersList() -- Atualiza a lista de jogadores
    playerDropdown:Clear() -- Limpa as opções atuais do dropdown
    for _, playerName in ipairs(playersList) do
        playerDropdown:Add(playerName) -- Adiciona cada jogador na lista atualizada
    end
end

-- Inicializa a lista de jogadores
updatePlayersList()

-- Dropdown para listar jogadores e teletransportar (com tamanho aumentado)
local playerDropdown = tab.newDropdown("Teleport no Player", "Selecione um player para teleportar!", playersList, function(selectedPlayer)
    -- Selecionar o jogador
    currentPlayer = game.Players:FindFirstChild(selectedPlayer)
    if currentPlayer then
        teleportBehindPlayer(currentPlayer)
    end
end, {Size = UDim2.new(0, 200, 0, 300)}) -- Aumentar a largura e altura da dropdown

-- Eventos para atualizar a lista quando jogadores entram ou saem
game.Players.PlayerAdded:Connect(function(newPlayer)
    refreshDropdown() -- Atualiza a lista quando um jogador entra
end)

game.Players.PlayerRemoving:Connect(function(removedPlayer)
    refreshDropdown() -- Atualiza a lista quando um jogador sai
end)

-- Loop de teleporte para manter o jogador atrás e olhando para o selecionado
spawn(function()
    while true do
        if teleporting and currentPlayer then
            teleportBehindPlayer(currentPlayer)
        end
        wait(0.1) -- Intervalo de 0.1 segundos entre os teleportes
    end
end)

-- Toggle para ativar/desativar o teleport loop
tab.newToggle("Loop Teleport", "Teleport em loop, perfeito para várias ocasiões", false, function(toggleState)
    teleporting = toggleState
    if toggleState then
        print("Teleporting to " .. (currentPlayer and currentPlayer.Name or "none") .. " enabled.")
    else
        print("Teleporting disabled.")
    end
end)

local tab = DrRayLibrary.newTab("Esps" , "rbxassetid://7300480952")

tab.newButton("Esp Nome", "Mostra o nome dos usuarios", function()
  
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();

--// Master switch
ESP.Enabled = true;
  
--// Enable names
ESP.ShowName = true;
  

--[[
    Enable skeletons: (currently broken)
    ESP.ShowSkeletons = true;
]]



--[[
    These are all the settings
    local ESP_SETTINGS = {
        BoxOutlineColor = Color3.new(0, 0, 0),
        BoxColor = Color3.new(1, 1, 1),
        NameColor = Color3.new(1, 1, 1),
        HealthOutlineColor = Color3.new(0, 0, 0),
        HealthHighColor = Color3.new(0, 1, 0),
        HealthLowColor = Color3.new(1, 0, 0),
        CharSize = Vector2.new(4, 6),
        Teamcheck = false,
        WallCheck = false,
        Enabled = false,
        ShowBox = false,
        BoxType = "2D",
        ShowName = false,
        ShowHealth = false,
        ShowDistance = false,
        ShowSkeletons = false,
        ShowTracer = false,
        TracerColor = Color3.new(1, 1, 1), 
        TracerThickness = 2,
        SkeletonsColor = Color3.new(1, 1, 1),
        TracerPosition = "Bottom",
    }
    ermm yep thats about it
]] 
  
end)

tab.newButton("Esp China", "Mostra uma seta sobre os jogadores", function()
  
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Função para criar o texto "V"
local function createVLabel(player)
    if player == LocalPlayer then return end  -- Ignora o jogador que executou o script

    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:WaitForChild("Head")

    local textLabel = Instance.new("BillboardGui")
    textLabel.Adornee = head
    textLabel.Size = UDim2.new(0, 50, 0, 50) -- Tamanho fixo
    textLabel.StudsOffset = Vector3.new(0, 3, 0) -- Posição acima da cabeça
    textLabel.AlwaysOnTop = true -- Visível por trás de objetos

    local text = Instance.new("TextLabel")
    text.Text = "V"
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(200, 200, 255) -- Cor do texto mais clara
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 27 -- Tamanho do texto menor

    -- Adiciona um efeito de neon
    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1.5, 0, 1.5, 0)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://301961890" -- Imagem de brilho (neon)
    glow.ImageColor3 = Color3.fromRGB(255, 255, 255) -- Cor do brilho
    glow.Parent = textLabel

    textLabel.Parent = head
    text.Parent = textLabel

    return textLabel
end

-- Função para atualizar o gradiente RGB
local function updateGradient()
    while true do
        local hue = tick() % 5 / 5 -- Muda a cor ao longo do tempo
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character and player ~= LocalPlayer then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local textLabel = head:FindFirstChild("BillboardGui"):FindFirstChild("TextLabel")
                    if textLabel then
                        local r = math.sin(hue * math.pi * 2) * 127 + 128
                        local g = math.sin(hue * math.pi * 2 + math.pi / 3) * 127 + 128
                        local b = math.sin(hue * math.pi * 2 + 2 * math.pi / 3) * 127 + 128
                        textLabel.TextColor3 = Color3.fromRGB(r, g, b)
                    end
                end
            end
        end
        wait(0.1)
    end
end

-- Conectar a criação do "V" quando um jogador entra
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createVLabel(player)
    end)
end)

-- Criar "V" para jogadores que já estão no jogo
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        createVLabel(player)
    end
end

-- Iniciar a atualização do gradiente RGB
updateGradient()
    
end)

tab.newButton("Esp Ciscle", "Cria uma circulo em volta dos playes", function()
 
    local players = game:GetService("Players")
local runService = game:GetService("RunService")
local radius = 3 -- Raio do círculo
local lineCount = 50 -- Número de linhas que formam o círculo
local lineThickness = 0.05 -- Espessura das linhas
local circleColor = Color3.fromRGB(255, 0, 0) -- Cor do círculo (vermelho)
local ballColor = Color3.fromRGB(255, 255, 255) -- Cor da bolinha (branca)

-- Função para criar as linhas visíveis por trás de objetos
local function createLine(startPos, endPos)
    local line = Instance.new("Part")
    line.Anchored = true
    line.CanCollide = false
    line.Transparency = 0
    line.Color = circleColor
    line.Size = Vector3.new(lineThickness, lineThickness, (startPos - endPos).Magnitude)
    line.CFrame = CFrame.new((startPos + endPos) / 2, endPos)
    line.Parent = workspace
    line.CanQuery = false -- Garante que seja visível por trás de objetos
    return line
end

-- Função para desenhar o círculo ao redor dos joelhos de um jogador e seguir o jogador
local function drawCircle(character, player)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local lines = {}
    local ball = Instance.new("Part")

    -- Cria as linhas do círculo
    for i = 1, lineCount do
        local theta1 = (i - 1) / lineCount * 2 * math.pi
        local theta2 = i / lineCount * 2 * math.pi

        local x1 = radius * math.cos(theta1)
        local z1 = radius * math.sin(theta1)
        local x2 = radius * math.cos(theta2)
        local z2 = radius * math.sin(theta2)

        local startPos = rootPart.Position + Vector3.new(x1, -1.5, z1) -- Na altura dos joelhos
        local endPos = rootPart.Position + Vector3.new(x2, -1.5, z2)

        local line = createLine(startPos, endPos)
        table.insert(lines, line)
    end

    -- Cria a bolinha branca que gira ao redor do círculo
    ball.Shape = Enum.PartType.Ball
    ball.Size = Vector3.new(0.5, 0.5, 0.5)
    ball.Color = ballColor
    ball.Anchored = true
    ball.CanCollide = false
    ball.Transparency = 0
    ball.CanQuery = false -- Garante que a bolinha seja visível por trás de objetos
    ball.Parent = workspace

    local angle = 0

    -- Atualiza a posição das linhas e da bolinha em tempo real, seguindo o jogador
    local connection
    connection = runService.RenderStepped:Connect(function()
        if character and character.Parent then
            for i, line in ipairs(lines) do
                local theta1 = (i - 1) / lineCount * 2 * math.pi
                local theta2 = i / lineCount * 2 * math.pi

                local x1 = radius * math.cos(theta1)
                local z1 = radius * math.sin(theta1)
                local x2 = radius * math.cos(theta2)
                local z2 = radius * math.sin(theta2)

                local startPos = rootPart.Position + Vector3.new(x1, -1.5, z1)
                local endPos = rootPart.Position + Vector3.new(x2, -1.5, z2)

                line.Size = Vector3.new(lineThickness, lineThickness, (startPos - endPos).Magnitude)
                line.CFrame = CFrame.new((startPos + endPos) / 2, endPos)
            end

            -- Atualiza a posição da bolinha branca que gira
            local x = radius * math.cos(angle)
            local z = radius * math.sin(angle)
            ball.Position = rootPart.Position + Vector3.new(x, -1.5, z) -- Bolinha girando na altura do joelho
            angle = angle + math.rad(4) -- Controla a velocidade da rotação
        else
            -- Se o jogador se desconectar, destrua imediatamente o círculo e a bolinha
            connection:Disconnect()
            for _, line in ipairs(lines) do
                line:Destroy() -- Remove as linhas imediatamente
            end
            ball:Destroy() -- Remove a bolinha imediatamente
        end
    end)

    -- Evento de desconexão do jogador para remover o círculo
    player.AncestryChanged:Connect(function(_, parent)
        if not parent then
            connection:Disconnect()
            for _, line in ipairs(lines) do
                line:Destroy()
            end
            ball:Destroy()
        end
    end)
end

-- Função para aplicar o círculo em todos os jogadores exceto o LocalPlayer
local function applyCircles()
    for _, otherPlayer in pairs(players:GetPlayers()) do
        if otherPlayer ~= players.LocalPlayer then
            local character = otherPlayer.Character or otherPlayer.CharacterAdded:Wait()
            drawCircle(character, otherPlayer)
        end
    end
end

-- Atualiza o círculo sempre que um novo jogador entrar
players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Connect(function(character)
        drawCircle(character, newPlayer)
    end)
end)

-- Aplica o círculo nos jogadores atuais
applyCircles()
        
    end)

tab.newButton("Esp I see", "Cria uma linha para o player mais proximo do centro da mira", function()
 
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Criar a linha
local line = Drawing.new("Line")
line.Thickness = 5
line.Color = Color3.new(1, 0, 0) -- Cor vermelha
line.Visible = false

local function updateLine()
    local closestPlayer = nil
    local closestDistance = math.huge
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local screenPosition, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - center).Magnitude

            if onScreen and distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition, onScreen = Camera:WorldToViewportPoint(closestPlayer.Character.HumanoidRootPart.Position)

        line.From = center
        line.To = Vector2.new(targetPosition.X, targetPosition.Y)
        line.Visible = true
    else
        line.Visible = false
    end
end

RunService.RenderStepped:Connect(updateLine)
    
end)

tab.newButton("Esp Box ( coner )", "cria caixas em volta dos playes", function()
  
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();

--// Master switch
ESP.Enabled = true;

--// Enable boxes
ESP.ShowBox = true;

--// Set the box type to corner
ESP.BoxType = "Corner Box Esp";
  
--[[
    Enable skeletons: (currently broken)
    ESP.ShowSkeletons = true;
]]



--[[
    These are all the settings
    local ESP_SETTINGS = {
        BoxOutlineColor = Color3.new(0, 0, 0),
        BoxColor = Color3.new(1, 1, 1),
        NameColor = Color3.new(1, 1, 1),
        HealthOutlineColor = Color3.new(0, 0, 0),
        HealthHighColor = Color3.new(0, 1, 0),
        HealthLowColor = Color3.new(1, 0, 0),
        CharSize = Vector2.new(4, 6),
        Teamcheck = false,
        WallCheck = false,
        Enabled = false,
        ShowBox = false,
        BoxType = "2D",
        ShowName = false,
        ShowHealth = false,
        ShowDistance = false,
        ShowSkeletons = false,
        ShowTracer = false,
        TracerColor = Color3.new(1, 1, 1), 
        TracerThickness = 2,
        SkeletonsColor = Color3.new(1, 1, 1),
        TracerPosition = "Bottom",
    }
    ermm yep thats about it
]]
  
end)

tab.newButton("Esp Box ( 3D )", "Cria uma caixa 3D em volta dos playes" , function()
    
--// Locals:
local workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

--// Settings:
local on = true -- Use this if your making gui

local Box_Color = Color3.fromRGB(255,255,255)
local Box_Thickness = 2
local Box_Transparency = 1 -- 1 Visible, 0 Not Visible

local Tracers = false
local Tracer_Color = Color3.fromRGB(255,255,255)
local Tracer_Thickness = 2
local Tracer_Transparency = 1 -- 1 Visible, 0 Not Visible

local Autothickness = true -- Makes screen less encumbered

local Team_Check = true
local red = Color3.fromRGB(227, 52, 52)
local green = Color3.fromRGB(255, 255, 255)

local function NewLine()
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(1, 1)
    line.Color = Box_Color
    line.Thickness = Box_Thickness
    line.Transparency = Box_Transparency
    return line
end

--// Main Function:
for i, v in pairs(game.Players:GetChildren()) do
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    --// Updates ESP (lines) in render loop
    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= player.Name and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = v.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)

                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        if v.TeamColor == player.TeamColor then
                            for u, x in pairs(lines) do
                                x.Color = green
                            end
                        else 
                            for u, x in pairs(lines) do
                                x.Color = red
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for u, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else 
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            else 
                for u, x in pairs(lines) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(v.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end

game.Players.PlayerAdded:Connect(function(newplr)
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    --// Updates ESP (lines) in render loop
    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= player.Name and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = newplr.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)
                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        if newplr.TeamColor == player.TeamColor then
                            for u, x in pairs(lines) do
                                x.Color = green
                            end
                        else 
                            for u, x in pairs(lines) do
                                x.Color = red
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - newplr.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for u, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else 
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            else 
                for u, x in pairs(lines) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(newplr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end)

end)


tab.newButton("Esp Arrows", "cria circulos em volta do jogar para mostrar a direção de outros playes" , function()
    
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RS = game:GetService("RunService")

local DistFromCenter = 125  -- Distância do centro da tela
local activePlayers = {} -- Tabela para armazenar as setas dos jogadores

-- Função para gerar uma cor arco-írisfixa
local function GetRainbowColor()
    local colors = {
        Color3.new(1, 0, 0),    -- Vermelho
        Color3.new(1, 0.5, 0),  -- Laranja
        Color3.new(1, 1, 0),    -- Amarelo
        Color3.new(0, 1, 0),    -- Verde
        Color3.new(0, 0, 1),    -- Azul
        Color3.new(0.5, 0, 1),  -- Índigo
        Color3.new(1, 0, 1),    -- Violeta
    }
    return colors[math.random(1, #colors)]
end

-- Função para calcular a distância entre dois pontos 3D
local function GetDistanceFromPlayer(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPos = player.Character.HumanoidRootPart.Position
        local localPlayerPos = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart.Position

        if localPlayerPos then
            return (playerPos - localPlayerPos).Magnitude  -- Retorna a distância entre os dois jogadores
        end
    end
    return nil
end

-- Função para verificar se o jogador está segurando uma arma
local function GetHeldWeapon(player)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        local tool = humanoid:FindFirstChildOfClass("Tool")  -- Verifica se há alguma ferramenta
        if tool and tool:IsA("Tool") then
            return tool.Name  -- Retorna o nome da ferramenta
        end
    end
    return ""  -- Retorna "Sem arma" se não houver nenhuma
end

-- Função para criar uma seta estilizada
local function CreateArrow()
    local arrow = {
        line1 = Drawing.new("Line"),  -- Linha da seta
        line2 = Drawing.new("Line"),  -- Linha da seta (outro lado)
        distanceText = Drawing.new("Text"),  -- Texto para mostrar a distância
        toolText = Drawing.new("Text"),  -- Texto para mostrar a ferramenta
        color = GetRainbowColor()  -- Cor arco-íris fixa
    }

    -- Configuração das linhas da seta
    arrow.line1.Thickness = 16  -- Aumenta a espessura da linha
    arrow.line1.Transparency = 0.5
    arrow.line1.Color = arrow.color

    arrow.line2.Thickness = 16  -- Aumenta a espessura da linha
    arrow.line2.Transparency = 0.5
    arrow.line2.Color = arrow.color

    -- Configuração do texto de distância
    arrow.distanceText.Size = 16  -- Diminui o tamanho do texto
    arrow.distanceText.Center = true
    arrow.distanceText.Outline = true
    arrow.distanceText.Color = Color3.new(1, 1, 1)  -- Branco
    arrow.distanceText.OutlineColor = Color3.new(0, 0, 0)  -- Preto

    -- Configuração do texto da ferramenta
    arrow.toolText.Size = 14  -- Tamanho do texto da ferramenta
    arrow.toolText.Center = true
    arrow.toolText.Outline = true
    arrow.toolText.Color = Color3.new(1, 1, 1)  -- Branco
    arrow.toolText.OutlineColor = Color3.new(0, 0, 0)  -- Preto

    return arrow
end

-- Função para calcular a direção relativa e posição na tela
local function GetRelativeDirection(pos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
    
    if not onScreen then
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local direction = (center - Vector2.new(screenPos.X, screenPos.Y)).unit -- Aponta na direção correta
        return direction
    end
    return nil
end

-- Função para atualizar a posição e visual das setas e mostrar a distância
local function UpdateArrow(arrow, direction, player)
    if direction then
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local position = center + direction * DistFromCenter

        -- Base da seta
        local headBase = position - direction * 20
        local side1 = Vector2.new(-direction.Y, direction.X) * 10
        local side2 = Vector2.new(direction.Y, -direction.X) * 10

        -- Atualiza as linhas da seta
        arrow.line1.From = headBase + side1
        arrow.line1.To = position

        arrow.line2.From = headBase + side2
        arrow.line2.To = position

        -- Mostra a distância do jogador
        local distance = GetDistanceFromPlayer(player)
        if distance then
            local distanceText = distance >= 1000 and string.format("%.1f km", distance / 1000) or string.format("%.1f metros", distance)  -- Exibe a distância
            arrow.distanceText.Text = distanceText
            arrow.distanceText.Position = Vector2.new(position.X, position.Y + 30)  -- Posição abaixo da seta
        end

        -- Mostra a ferramenta que o jogador está segurando
        local heldTool = GetHeldWeapon(player)
        arrow.toolText.Text = " " .. heldTool
        arrow.toolText.Position = Vector2.new(position.X, position.Y + 50)  -- Posição abaixo do texto de distância

        -- Torna a seta visível
        arrow.line1.Visible = true
        arrow.line2.Visible = true
        arrow.distanceText.Visible = true
        arrow.toolText.Visible = true
    else
        -- Esconde a seta se o jogador não estiver visível
        arrow.line1.Visible = false
        arrow.line2.Visible = false
        arrow.distanceText.Visible = false
        arrow.toolText.Visible = false
    end
end

-- Função para criar e atualizar a seta de cada jogador
local function ShowArrow(player)
    local arrow = CreateArrow()
    activePlayers[player] = arrow  -- Armazena a seta para referência futura

    -- Atualiza a posição da seta a cada frame
    RS.RenderStepped:Connect(function()
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local direction = GetRelativeDirection(player.Character.HumanoidRootPart.Position)
            UpdateArrow(arrow, direction, player)
        else
            -- Esconde a seta se o jogador não estiver visível
            arrow.line1.Visible = false
            arrow.line2.Visible = false
            arrow.distanceText.Visible = false
            arrow.toolText.Visible = false
        end
    end)
end

-- Mostrar setas para todos os jogadores
for _, v in pairs(Players:GetPlayers()) do
    if v ~= Player then
        ShowArrow(v)
    end
end

-- Mostrar setas para jogadores que entrarem no jogo
Players.PlayerAdded:Connect(function(v)
    if v ~= Player then
        ShowArrow(v)
    end
end)

end)

tab.newButton("Esp Vida", "mostra a vida dos playes", function()
  
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();

--// Master switch
ESP.Enabled = true;
  
--// Enable Healhbar
ESP.ShowHealth = true;


--[[
    Enable skeletons: (currently broken)
    ESP.ShowSkeletons = true;
]]



--[[
    These are all the settings
    local ESP_SETTINGS = {
        BoxOutlineColor = Color3.new(0, 0, 0),
        BoxColor = Color3.new(1, 1, 1),
        NameColor = Color3.new(1, 1, 1),
        HealthOutlineColor = Color3.new(0, 0, 0),
        HealthHighColor = Color3.new(0, 1, 0),
        HealthLowColor = Color3.new(1, 0, 0),
        CharSize = Vector2.new(4, 6),
        Teamcheck = false,
        WallCheck = false,
        Enabled = false,
        ShowBox = false,
        BoxType = "2D",
        ShowName = false,
        ShowHealth = false,
        ShowDistance = false,
        ShowSkeletons = false,
        ShowTracer = false,
        TracerColor = Color3.new(1, 1, 1), 
        TracerThickness = 2,
        SkeletonsColor = Color3.new(1, 1, 1),
        TracerPosition = "Bottom",
    }
    ermm yep thats about it
]]
  
end)

tab.newButton("Esp distancia", "mostra a distancia dos playes", function()
  
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();

--// Master switch
ESP.Enabled = true;
  
--// Enable Distance
ESP.ShowDistance = true;

--[[
    Enable skeletons: (currently broken)
    ESP.ShowSkeletons = true;
]]



--[[
    These are all the settings
    local ESP_SETTINGS = {
        BoxOutlineColor = Color3.new(0, 0, 0),
        BoxColor = Color3.new(1, 1, 1),
        NameColor = Color3.new(1, 1, 1),
        HealthOutlineColor = Color3.new(0, 0, 0),
        HealthHighColor = Color3.new(0, 1, 0),
        HealthLowColor = Color3.new(1, 0, 0),
        CharSize = Vector2.new(4, 6),
        Teamcheck = false,
        WallCheck = false,
        Enabled = false,
        ShowBox = false,
        BoxType = "2D",
        ShowName = false,
        ShowHealth = false,
        ShowDistance = false,
        ShowSkeletons = false,
        ShowTracer = false,
        TracerColor = Color3.new(1, 1, 1), 
        TracerThickness = 2,
        SkeletonsColor = Color3.new(1, 1, 1),
        TracerPosition = "Bottom",
    }
    ermm yep thats about it
]]
  
end)

tab.newButton("Esp Skeleton", "mostra o esqueleto dos playes" , function()
    
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local function DrawLine()
    local l = Drawing.new("Line")
    l.Visible = false
    l.From = Vector2.new(0, 0)
    l.To = Vector2.new(1, 1)
    l.Color = Color3.fromRGB(255, 0, 0)
    l.Thickness = 1
    l.Transparency = 1
    return l
end

local function DrawESP(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local limbs = {}
    local R15 = (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15) and true or false
    if R15 then 
        limbs = {
            -- Spine
            Head_UpperTorso = DrawLine(),
            UpperTorso_LowerTorso = DrawLine(),
            -- Left Arm
            UpperTorso_LeftUpperArm = DrawLine(),
            LeftUpperArm_LeftLowerArm = DrawLine(),
            LeftLowerArm_LeftHand = DrawLine(),
            -- Right Arm
            UpperTorso_RightUpperArm = DrawLine(),
            RightUpperArm_RightLowerArm = DrawLine(),
            RightLowerArm_RightHand = DrawLine(),
            -- Left Leg
            LowerTorso_LeftUpperLeg = DrawLine(),
            LeftUpperLeg_LeftLowerLeg = DrawLine(),
            LeftLowerLeg_LeftFoot = DrawLine(),
            -- Right Leg
            LowerTorso_RightUpperLeg = DrawLine(),
            RightUpperLeg_RightLowerLeg = DrawLine(),
            RightLowerLeg_RightFoot = DrawLine(),
        }
    else 
        limbs = {
            Head_Spine = DrawLine(),
            Spine = DrawLine(),
            LeftArm = DrawLine(),
            LeftArm_UpperTorso = DrawLine(),
            RightArm = DrawLine(),
            RightArm_UpperTorso = DrawLine(),
            LeftLeg = DrawLine(),
            LeftLeg_LowerTorso = DrawLine(),
            RightLeg = DrawLine(),
            RightLeg_LowerTorso = DrawLine()
        }
    end
    local function Visibility(state)
        for i, v in pairs(limbs) do
            v.Visible = state
        end
    end

    local function Colorize(color)
        for i, v in pairs(limbs) do
            v.Color = color
        end
    end

    local function UpdaterR15()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    -- Head
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_UpperTorso.From ~= Vector2.new(H.X, H.Y) then
                        --Spine
                        local UT = Camera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                        local LT = Camera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                        -- Left Arm
                        local LUA = Camera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                        local LLA = Camera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                        local LH = Camera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                        -- Right Arm
                        local RUA = Camera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                        local RLA = Camera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                        local RH = Camera:WorldToViewportPoint(plr.Character.RightHand.Position)
                        -- Left leg
                        local LUL = Camera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                        local LLL = Camera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                        local LF = Camera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                        -- Right leg
                        local RUL = Camera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                        local RLL = Camera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                        local RF = Camera:WorldToViewportPoint(plr.Character.RightFoot.Position)

                        --Head
                        limbs.Head_UpperTorso.From = Vector2.new(H.X, H.Y)
                        limbs.Head_UpperTorso.To = Vector2.new(UT.X, UT.Y)

                        --Spine
                        limbs.UpperTorso_LowerTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_LowerTorso.To = Vector2.new(LT.X, LT.Y)

                        -- Left Arm
                        limbs.UpperTorso_LeftUpperArm.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_LeftUpperArm.To = Vector2.new(LUA.X, LUA.Y)

                        limbs.LeftUpperArm_LeftLowerArm.From = Vector2.new(LUA.X, LUA.Y)
                        limbs.LeftUpperArm_LeftLowerArm.To = Vector2.new(LLA.X, LLA.Y)

                        limbs.LeftLowerArm_LeftHand.From = Vector2.new(LLA.X, LLA.Y)
                        limbs.LeftLowerArm_LeftHand.To = Vector2.new(LH.X, LH.Y)

                        -- Right Arm
                        limbs.UpperTorso_RightUpperArm.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_RightUpperArm.To = Vector2.new(RUA.X, RUA.Y)

                        limbs.RightUpperArm_RightLowerArm.From = Vector2.new(RUA.X, RUA.Y)
                        limbs.RightUpperArm_RightLowerArm.To = Vector2.new(RLA.X, RLA.Y)

                        limbs.RightLowerArm_RightHand.From = Vector2.new(RLA.X, RLA.Y)
                        limbs.RightLowerArm_RightHand.To = Vector2.new(RH.X, RH.Y)

                        -- Left Leg
                        limbs.LowerTorso_LeftUpperLeg.From = Vector2.new(LT.X, LT.Y)
                        limbs.LowerTorso_LeftUpperLeg.To = Vector2.new(LUL.X, LUL.Y)

                        limbs.LeftUpperLeg_LeftLowerLeg.From = Vector2.new(LUL.X, LUL.Y)
                        limbs.LeftUpperLeg_LeftLowerLeg.To = Vector2.new(LLL.X, LLL.Y)

                        limbs.LeftLowerLeg_LeftFoot.From = Vector2.new(LLL.X, LLL.Y)
                        limbs.LeftLowerLeg_LeftFoot.To = Vector2.new(LF.X, LF.Y)

                        -- Right Leg
                        limbs.LowerTorso_RightUpperLeg.From = Vector2.new(LT.X, LT.Y)
                        limbs.LowerTorso_RightUpperLeg.To = Vector2.new(RUL.X, RUL.Y)

                        limbs.RightUpperLeg_RightLowerLeg.From = Vector2.new(RUL.X, RUL.Y)
                        limbs.RightUpperLeg_RightLowerLeg.To = Vector2.new(RLL.X, RLL.Y)

                        limbs.RightLowerLeg_RightFoot.From = Vector2.new(RLL.X, RLL.Y)
                        limbs.RightLowerLeg_RightFoot.To = Vector2.new(RF.X, RF.Y)
                    end

                    if limbs.Head_UpperTorso.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_UpperTorso.Visible ~= false then
                        Visibility(false)
                    end
                end
            else 
                if limbs.Head_UpperTorso.Visible ~= false then
                    Visibility(false)
                end
                if game.Players:FindFirstChild(plr.Name) == nil then 
                    for i, v in pairs(limbs) do
                        v:Remove()
                    end
                    connection:Disconnect()
                end
            end
        end)
    end

    local function UpdaterR6()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_Spine.From ~= Vector2.new(H.X, H.Y) then
                        local T_Height = plr.Character.Torso.Size.Y/2 - 0.2
                        local UT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, T_Height, 0)).p)
                        local LT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, -T_Height, 0)).p)

                        local LA_Height = plr.Character["Left Arm"].Size.Y/2 - 0.2
                        local LUA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, LA_Height, 0)).p)
                        local LLA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, -LA_Height, 0)).p)

                        local RA_Height = plr.Character["Right Arm"].Size.Y/2 - 0.2
                        local RUA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, RA_Height, 0)).p)
                        local RLA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, -RA_Height, 0)).p)

                        local LL_Height = plr.Character["Left Leg"].Size.Y/2 - 0.2
                        local LUL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, LL_Height, 0)).p)
                        local LLL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, -LL_Height, 0)).p)

                        local RL_Height = plr.Character["Right Leg"].Size.Y/2 - 0.2
                        local RUL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, RL_Height, 0)).p)
                        local RLL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, -RL_Height, 0)).p)

                        -- Head
                        limbs.Head_Spine.From = Vector2.new(H.X, H.Y)
                        limbs.Head_Spine.To = Vector2.new(UT.X, UT.Y)

                        --Spine
                        limbs.Spine.From = Vector2.new(UT.X, UT.Y)
                        limbs.Spine.To = Vector2.new(LT.X, LT.Y)

                        --Left Arm
                        limbs.LeftArm.From = Vector2.new(LUA.X, LUA.Y)
                        limbs.LeftArm.To = Vector2.new(LLA.X, LLA.Y)

                        limbs.LeftArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.LeftArm_UpperTorso.To = Vector2.new(LUA.X, LUA.Y)

                        --Right Arm
                        limbs.RightArm.From = Vector2.new(RUA.X, RUA.Y)
                        limbs.RightArm.To = Vector2.new(RLA.X, RLA.Y)

                        limbs.RightArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.RightArm_UpperTorso.To = Vector2.new(RUA.X, RUA.Y)

                        --Left Leg
                        limbs.LeftLeg.From = Vector2.new(LUL.X, LUL.Y)
                        limbs.LeftLeg.To = Vector2.new(LLL.X, LLL.Y)

                        limbs.LeftLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.LeftLeg_LowerTorso.To = Vector2.new(LUL.X, LUL.Y)

                        --Right Leg
                        limbs.RightLeg.From = Vector2.new(RUL.X, RUL.Y)
                        limbs.RightLeg.To = Vector2.new(RLL.X, RLL.Y)

                        limbs.RightLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.RightLeg_LowerTorso.To = Vector2.new(RUL.X, RUL.Y)
                    end

                    if limbs.Head_Spine.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_Spine.Visible ~= false then
                        Visibility(false)
                    end
                end
            else 
                if limbs.Head_Spine.Visible ~= false then
                    Visibility(false)
                end
                if game.Players:FindFirstChild(plr.Name) == nil then 
                    for i, v in pairs(limbs) do
                        v:Remove()
                    end
                    connection:Disconnect()
                end
            end
        end)
    end

    if R15 then
        coroutine.wrap(UpdaterR15)()
    else 
        coroutine.wrap(UpdaterR6)()
    end
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= Player.Name then
        DrawESP(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= Player.Name then
        DrawESP(newplr)
    end
end)

end)


tab.newButton("Esp Head", "cria um circulo vermlho na cabeça" , function()
    
loadstring(game:HttpGet("https://pastebin.com/raw/BHECBJbR"))()

end)

tab.newButton("Esp look", "Mostra onde os playes estão olhando" , function()
    
local Settings = {
    Color = Color3.fromRGB(255, 203, 138), -- Color of the line
    Thickness = 1, -- Thickness of the line (Overruled by AutoThickness if activated)
    Transparency = 1, -- 1 Visible - 0 Not Visible
    AutoThickness = true, -- Makes Thickness above futile, scales according to distance, good for less encumbered screen
    Length = 15, -- In studs of the line
    Smoothness = 0.2 -- 0.01 - Less Smooth(Faster), 1 - Smoother (Slower)
}

local toggle = true -- use this variable if you wanna integrate into a GUI

local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

local function ESP(plr) --//Main function handling specific plr loop esp for line etc
    local line = Drawing.new("Line") --// Parse and Set the line for tracer
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = Settings.Color
    line.Thickness = Settings.Thickness
    line.Transparency = Settings.Transparency

    local function Updater() --// Function to update the ESP therefore, line destinations etc every /render/
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function() -- Putting function in a connection var in order to disconnect if needed, to save performance
            if toggle and plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local headpos, OnScreen = camera:WorldToViewportPoint(plr.Character.Head.Position)
                if OnScreen then -- checks if player is on screen or not
                    local offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                    local check = false
                    line.From = Vector2.new(headpos.X, headpos.Y)
                    if Settings.AutoThickness then
                        local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude --//AutoThickness
                        local value = math.clamp(1/distance*100, 0.1, 3) --0.1 is min thickness, 4 is max
                        line.Thickness = value
                    end
                    repeat
                        local dir = plr.Character.Head.CFrame:ToWorldSpace(offsetCFrame)
                        offsetCFrame = offsetCFrame * CFrame.new(0, 0, Settings.Smoothness)
                        local dirpos, vis = camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
                        if vis then
                            check = true
                            line.To = Vector2.new(dirpos.X, dirpos.Y)
                            line.Visible = true
                            offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                        end
                    until check == true
                else 
                    line.Visible = false
                end
            else 
                line.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= player.Name then
        coroutine.wrap(ESP)(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= player.Name then
        coroutine.wrap(ESP)(newplr)
    end
end)

end)


tab.newButton("Esp Linha", "Cria uma linha ate o jogar" , function()
    
local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = camera.worldToViewportPoint

_G.TeamCheck = false -- Toggle TeamCheck to True or False

local function createTracerForPlayer(player)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1, 1, 1) -- Tracer color
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    local function updateTracer()
        game:GetService("RunService").RenderStepped:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and player ~= lplr and player.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(player.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y) -- From center of screen
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and player.TeamColor == lplr.TeamColor then
                        Tracer.Visible = false -- Hide tracer for teammates
                    else
                        Tracer.Visible = true -- Show tracer for enemies
                    end
                else
                    Tracer.Visible = false -- Hide if not on screen
                end
            else
                Tracer.Visible = false -- Hide if player is dead or not valid
            end
        end)
    end

    coroutine.wrap(updateTracer)() -- Start the tracer update coroutine
end

-- Create tracers for existing players
for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= lplr then
        createTracerForPlayer(player)
    end
end

-- Create tracers for new players
game.Players.PlayerAdded:Connect(function(player)
    if player ~= lplr then
        createTracerForPlayer(player)
    end
end)

end)

tab.newButton("Esp Radar", "Cria um menu que mostra onde os player estão" , function()
    
local Players = game:service("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Camera = game:service("Workspace").CurrentCamera
local RS = game:service("RunService")
local UIS = game:service("UserInputService")

repeat wait() until Player.Character ~= nil and Player.Character.PrimaryPart ~= nil

local LerpColorModule = loadstring(game:HttpGet("https://pastebin.com/raw/wRnsJeid"))()
local HealthBarLerp = LerpColorModule:Lerp(Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0))

local function NewCircle(Transparency, Color, Radius, Filled, Thickness)
    local c = Drawing.new("Circle")
    c.Transparency = Transparency
    c.Color = Color
    c.Visible = false
    c.Thickness = Thickness
    c.Position = Vector2.new(0, 0)
    c.Radius = Radius
    c.NumSides = math.clamp(Radius * 55 / 100, 10, 75)
    c.Filled = Filled
    return c
end

local RadarInfo = {
    Position = Vector2.new(200, 50), -- Mover para o topo
    Radius = 60, -- Diminuir o tamanho
    Scale = 1,
    RadarBack = Color3.fromRGB(10, 10, 10),
    RadarBorder = Color3.fromRGB(75, 75, 75),
    LocalPlayerDot = Color3.fromRGB(255, 255, 255),
    PlayerDot = Color3.fromRGB(60, 170, 255),
    Team = Color3.fromRGB(0, 255, 0),
    Enemy = Color3.fromRGB(255, 0, 0),
    Health_Color = true,
    Team_Check = true
}

local RadarBackground = NewCircle(0.9, RadarInfo.RadarBack, RadarInfo.Radius, true, 1)
RadarBackground.Visible = true
RadarBackground.Position = RadarInfo.Position

local RadarBorder = NewCircle(0.75, RadarInfo.RadarBorder, RadarInfo.Radius, false, 3)
RadarBorder.Visible = true
RadarBorder.Position = RadarInfo.Position

local function GetRelative(pos)
    local char = Player.Character
    if char ~= nil and char.PrimaryPart ~= nil then
        local pmpart = char.PrimaryPart
        local camerapos = Vector3.new(Camera.CFrame.Position.X, pmpart.Position.Y, Camera.CFrame.Position.Z)
        local newcf = CFrame.new(pmpart.Position, camerapos)
        local r = newcf:PointToObjectSpace(pos)
        return r.X, r.Z
    else
        return 0, 0
    end
end

local function PlaceDot(plr)
    local PlayerDot = NewCircle(1, RadarInfo.PlayerDot, 3, true, 1)

    local function Update()
        local c 
        c = game:service("RunService").RenderStepped:Connect(function()
            local char = plr.Character
            if char and char:FindFirstChildOfClass("Humanoid") and char.PrimaryPart ~= nil and char:FindFirstChildOfClass("Humanoid").Health > 0 then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local scale = RadarInfo.Scale
                local relx, rely = GetRelative(char.PrimaryPart.Position)
                local newpos = RadarInfo.Position - Vector2.new(relx * scale, rely * scale)
                
                if (newpos - RadarInfo.Position).magnitude < RadarInfo.Radius - 2 then 
                    PlayerDot.Radius = 3   
                    PlayerDot.Position = newpos
                    PlayerDot.Visible = true
                else 
                    local dist = (RadarInfo.Position - newpos).magnitude
                    local calc = (RadarInfo.Position - newpos).unit * (dist - RadarInfo.Radius)
                    local inside = Vector2.new(newpos.X + calc.X, newpos.Y + calc.Y)
                    PlayerDot.Radius = 2
                    PlayerDot.Position = inside
                    PlayerDot.Visible = true
                end

                PlayerDot.Color = RadarInfo.PlayerDot
                if RadarInfo.Team_Check then
                    if plr.TeamColor == Player.TeamColor then
                        PlayerDot.Color = RadarInfo.Team
                    else
                        PlayerDot.Color = RadarInfo.Enemy
                    end
                end

                if RadarInfo.Health_Color then
                    PlayerDot.Color = HealthBarLerp(hum.Health / hum.MaxHealth)
                end
            else 
                PlayerDot.Visible = false
                if Players:FindFirstChild(plr.Name) == nil then
                    PlayerDot:Remove()
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

for _, v in pairs(Players:GetChildren()) do
    if v.Name ~= Player.Name then
        PlaceDot(v)
    end
end

local function NewLocalDot()
    local d = Drawing.new("Triangle")
    d.Visible = true
    d.Thickness = 1
    d.Filled = true
    d.Color = RadarInfo.LocalPlayerDot
    d.PointA = RadarInfo.Position + Vector2.new(0, -6)
    d.PointB = RadarInfo.Position + Vector2.new(-3, 6)
    d.PointC = RadarInfo.Position + Vector2.new(3, 6)
    return d
end

local LocalPlayerDot = NewLocalDot()

Players.PlayerAdded:Connect(function(v)
    if v.Name ~= Player.Name then
        PlaceDot(v)
    end
    LocalPlayerDot:Remove()
    LocalPlayerDot = NewLocalDot()
end)

-- Loop
coroutine.wrap(function()
    local c 
    c = game:service("RunService").RenderStepped:Connect(function()
        if LocalPlayerDot ~= nil then
            LocalPlayerDot.Color = RadarInfo.LocalPlayerDot
            LocalPlayerDot.PointA = RadarInfo.Position + Vector2.new(0, -6)
            LocalPlayerDot.PointB = RadarInfo.Position + Vector2.new(-3, 6)
            LocalPlayerDot.PointC = RadarInfo.Position + Vector2.new(3, 6)
        end
        RadarBackground.Position = RadarInfo.Position
        RadarBackground.Radius = RadarInfo.Radius
        RadarBackground.Color = RadarInfo.RadarBack

        RadarBorder.Position = RadarInfo.Position
        RadarBorder.Radius = RadarInfo.Radius
        RadarBorder.Color = RadarInfo.RadarBorder
    end)
end)()

-- Draggable
local inset = game:service("GuiService"):GetGuiInset()

local dragging = false
local offset = Vector2.new(0, 0)
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and (Vector2.new(Mouse.X, Mouse.Y + inset.Y) - RadarInfo.Position).magnitude < RadarInfo.Radius then
        offset = RadarInfo.Position - Vector2.new(Mouse.X, Mouse.Y + inset.Y)
        dragging = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

RS.RenderStepped:Connect(function()
    if dragging then
        RadarInfo.Position = Vector2.new(Mouse.X, Mouse.Y + inset.Y) + offset
    end
end)

--[[ Example:
wait(3)
RadarInfo.Position = Vector2.new(300, 300)
RadarInfo.Radius = 150
RadarInfo.RadarBack = Color3.fromRGB(50, 0, 0)
]]
    
end)

local tab = DrRayLibrary.newTab("AimBot", "rbxassetid://11734940424")
    
-- Variáveis globais para fov e hexágono
local fov = 0 -- FOV começa em 0
local sides = 10 -- Número de lados do hexágono
local hexLines = {} -- Tabela para armazenar as linhas do hexágono
local scriptEnabled = false -- Controla se o script está ligado ou desligado

-- Serviços do jogo
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera
local Workspace = game:GetService("Workspace")
local lplr = Players.LocalPlayer

-- FOV Circle
local SilentAimFOVCircle = Drawing.new("Circle")
SilentAimFOVCircle.Position = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
SilentAimFOVCircle.Radius = fov
SilentAimFOVCircle.Color = Color3.new(1, 1, 1) -- Cor branca
SilentAimFOVCircle.Visible = false -- Começa invisível
SilentAimFOVCircle.Filled = false
SilentAimFOVCircle.Outline = true -- Ativa o contorno do círculo

-- Função para limpar o hexágono anterior
local function clearPreviousFOV()
    for _, line in pairs(hexLines) do
        line:Remove()
    end
    hexLines = {}
end

-- Função para obter ponto do hexágono
local function getHexPoint(center, angle, radius)
    local rad = math.rad(angle)
    return Vector2.new(center.X + math.cos(rad) * radius, center.Y + math.sin(rad) * radius)
end

-- Função para criar o hexágono
local function createHexFOV()
    clearPreviousFOV()
    local center = SilentAimFOVCircle.Position
    local step = 360 / sides

    for i = 0, sides - 1 do
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Color = Color3.new(1, 1, 1) -- Cor branca
        line.Transparency = 0 -- Totalmente opaco
        line.Outline = true -- Ativa o contorno da linha
        table.insert(hexLines, line)
    end
end

-- Função para atualizar o hexágono
local function updateHexFOV()
    local center = SilentAimFOVCircle.Position
    local step = 360 / sides

    for i = 0, sides - 1 do
        local startPoint = getHexPoint(center, step * i, fov)
        local endPoint = getHexPoint(center, step * (i + 1), fov)

        hexLines[i + 1].From = startPoint
        hexLines[i + 1].To = endPoint
    end
end

-- Função para verificar se o jogador está dentro do FOV
local function isPlayerInFOV(player)
    local screenPosition, onScreen = Cam:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
    local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - SilentAimFOVCircle.Position).Magnitude
    return onScreen and distance <= fov -- Atualizado para usar o valor dinâmico de fov
end

-- Função para verificar se o jogador está visível
local function isPlayerVisible(player)
    if not player.Character or not player.Character:FindFirstChild("Head") then
        return false
    end

    local origin = Cam.CFrame.Position
    local target = player.Character.Head.Position

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {lplr.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = Workspace:Raycast(origin, (target - origin).Unit * (target - origin).Magnitude, raycastParams)

    if raycastResult then
        return raycastResult.Instance:IsDescendantOf(player.Character)
    else
        return true
    end
end

-- Função para alternar o estado do script (liga/desliga)
local function toggleScript(toggleState)
    scriptEnabled = toggleState
    if scriptEnabled then
        print("Script ligado")
        SilentAimFOVCircle.Visible = true -- Torna o círculo visível
        createHexFOV() -- Cria o hexágono
    else
        print("Script desligado")
        SilentAimFOVCircle.Visible = false -- Oculta o círculo
        clearPreviousFOV() -- Limpa o hexágono
    end
end

-- Criação inicial do hexágono
createHexFOV()

-- Função callback do slider
tab.newSlider("Ajustar FOV " , "Ajusta o FOV do aim", 360, false, function(num)
    if scriptEnabled then
        fov = num -- Atualiza o valor do fov com o valor do slider
        SilentAimFOVCircle.Radius = fov -- Atualiza o raio do círculo
        updateHexFOV() -- Atualiza o hexágono com o novo valor de fov
    end
end)

-- Botão Toggle para ligar/desligar o script
tab.newToggle("Aimbot", "Botão para ativar o aimbot", true, function(toggleState)
    toggleScript(toggleState)
end)

local tracer -- Variável para armazenar o tracer do jogador mais próximo

-- Conexão com RenderStepped
RunService.RenderStepped:Connect(function()
    if scriptEnabled then
        updateHexFOV()

        local closestPlayer = nil
        local closestDistance = math.huge
        local center = SilentAimFOVCircle.Position

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= lplr and isPlayerInFOV(player) and isPlayerVisible(player) then
                local screenPosition, onScreen = Cam:WorldToViewportPoint(player.Character.Head.Position)
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - center).Magnitude

                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end

        -- Atualiza o tracer para o jogador mais próximo
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
            if not tracer then
                tracer = Drawing.new("Line")
                tracer.Thickness = 2
                tracer.Color = Color3.new(1, 0, 0)
                tracer.Outline = true
            end

            local vector, onScreen = Cam:WorldToViewportPoint(closestPlayer.Character.Head.Position)

            tracer.From = SilentAimFOVCircle.Position
            tracer.To = Vector2.new(vector.X, vector.Y)
            tracer.Visible = true

            local targetPos = closestPlayer.Character.Head.Position
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, targetPos)
        else
            if tracer then
                tracer.Visible = false
            end
        end
    end
end)

tab.newButton("Silent aim", "Aperte para desbloquear", function()
    
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local fovRadius = 0 -- Raio do FOV visual na tela começa em 0
local transparency = 0.2 -- Transparência do FOV
local scriptEnabled = false -- Controla o estado do script (ligado/desligado)

-- Criando o círculo que representa o FOV
local fovCircle = Drawing.new("Circle")
fovCircle.Transparency = transparency
fovCircle.Thickness = 1
fovCircle.Color = Color3.new(0.5, 0.5, 0.5) -- Cor cinza
fovCircle.Filled = true
fovCircle.Visible = false -- Começa invisível

-- Criando o rótulo para a cabeça
local headLabel = Drawing.new("Text")
headLabel.Text = " "
headLabel.Size = 20
headLabel.Color = Color3.new(1, 0, 0) -- Cor vermelha
headLabel.Visible = false -- Inicialmente invisível

-- Criando a linha (tracer)
local line = Drawing.new("Line")
line.Thickness = 5
line.Color = Color3.new(1, 0, 0) -- Cor vermelha
line.Visible = false -- Começa invisível

-- Função para verificar se o jogador está dentro do FOV
local function isInFOV(character)
    local characterPosition = character.PrimaryPart.Position
    local screenPoint, onScreen = camera:WorldToViewportPoint(characterPosition)

    if onScreen then
        local screenPosition = Vector2.new(screenPoint.X, screenPoint.Y)
        local fovCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        local distanceFromCenter = (screenPosition - fovCenter).Magnitude

        return distanceFromCenter <= fovRadius
    end
    return false
end

-- Função para alterar o tamanho da hitbox da cabeça
local function changeHeadHitbox(character, size)
    local head = character:FindFirstChild("Head")
    if head then
        head.Size = Vector3.new(size, size, size) -- Ajusta o tamanho da cabeça
        head.Transparency = 1 -- Deixa a hitbox invisível
        head.CanCollide = false -- Garante que a hitbox seja invisível, mas funcional
        headLabel.Visible = true -- Torna o rótulo visível
    end
end

-- Função para atualizar a posição e tamanho do círculo de FOV
local function updateFOVCircle()
    fovCircle.Radius = fovRadius
    fovCircle.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2) -- Centraliza na tela
end

-- Função para ligar/desligar o script
local function toggleScript(state)
    scriptEnabled = state
    if scriptEnabled then
        print("Script ligado")
        fovCircle.Visible = true
    else
        print("Script desligado")
        fovCircle.Visible = false
        headLabel.Visible = false
        line.Visible = false -- Esconde a linha quando o script é desligado
    end
end

-- Botão Toggle para ligar/desligar o script
tab.newToggle("Silent Aim", "Ativa o Silent Aim", false, function(toggleState)
    toggleScript(toggleState)
end)

-- Slider para aumentar e diminuir o FOV
tab.newSlider("Ajustar FOV", "Ajusta o FOV entre 0 e 360", 360, false, function(num)
    fovRadius = num
    print("FOV ajustado para: " .. fovRadius)
end)

-- Função para atualizar a linha (tracer) para o jogador mais próximo dentro do FOV
local function updateLine()
    local closestPlayer = nil
    local closestDistance = math.huge
    local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)

    for _, targetPlayer in pairs(game.Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if isInFOV(targetPlayer.Character) then
                local screenPosition, onScreen = camera:WorldToViewportPoint(targetPlayer.Character.HumanoidRootPart.Position)
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - center).Magnitude

                -- Verifica se o jogador está visível (não atrás de paredes)
                local ray = Ray.new(camera.CFrame.p, (targetPlayer.Character.HumanoidRootPart.Position - camera.CFrame.p).unit * 100)
                local hit, position = workspace:FindPartOnRay(ray, player.Character)

                if onScreen and distance < closestDistance and not hit then
                    closestDistance = distance
                    closestPlayer = targetPlayer
                end
            end
        end
    end

    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition, onScreen = camera:WorldToViewportPoint(closestPlayer.Character.HumanoidRootPart.Position)

        line.From = center
        line.To = Vector2.new(targetPosition.X, targetPosition.Y)
        line.Visible = true
    else
        line.Visible = false
    end
end

-- Checa constantemente os jogadores dentro do FOV e ajusta suas hitboxes
game:GetService("RunService").RenderStepped:Connect(function()
    if scriptEnabled then
        updateFOVCircle() -- Atualiza a posição e o tamanho do círculo de FOV a cada frame
        updateLine() -- Atualiza a linha (tracer) para o jogador mais próximo

        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= player then
                local character = targetPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    if isInFOV(character) then
                        -- Verifica se o jogador está visível
                        local screenPoint, onScreen = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
                        -- Verifica se não está atrás de paredes
                        local ray = Ray.new(camera.CFrame.p, (targetPlayer.Character.HumanoidRootPart.Position - camera.CFrame.p).unit * 100)
                        local hit, position = workspace:FindPartOnRay(ray, player.Character)

                        if onScreen and not hit then
                            -- Define o tamanho da hitbox da cabeça baseado no FOV
                            local newSize = math.max(10, fovRadius / 7) -- Proporcional ao FOV
                            changeHeadHitbox(character, newSize)
                            -- Atualiza a posição do rótulo
                            local head = character:FindFirstChild("Head")
                            if head then
                                local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)
                                if onScreen then
                                    headLabel.Position = Vector2.new(screenPoint.X, screenPoint.Y)
                                    headLabel.Visible = true -- Torna o rótulo visível
                                end
                            end
                        else
                            line.Visible = false -- Esconde a linha se o jogador não estiver visível
                        end
                    else
                        -- Reseta o tamanho da hitbox da cabeça e torna o rótulo invisível
                        local head = character:FindFirstChild("Head")
                        if head then
                            head.Size = Vector3.new(2, 1, 1) -- Tamanho original da cabeça
                            head.Transparency = 0 -- Torna a hitbox visível novamente
                            head.CanCollide = true -- Restabelece colisão
                        end
                        headLabel.Visible = false -- Torna o rótulo invisível
                    end
                end
            end
        end
    end
end)

-- Atualiza a posição do rótulo da cabeça
game:GetService("RunService").RenderStepped:Connect(function()
    if scriptEnabled and headLabel.Visible then
        local head = player.Character and player.Character:FindFirstChild("Head")
        if head then
            local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)
            if onScreen then
                headLabel.Position = Vector2.new(screenPoint.X, screenPoint.Y)
            end
        end
    end
end)
    
end)


local tab = DrRayLibrary.newTab("exploit", "rbxassetid://12438907427")

tab.newButton("Fly", "Te faz voar" , function()
    
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton") 
 
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 
 
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57) 
 
up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000 
 
down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000 
 
onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000 
 
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true 
 
plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true 
 
speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true 
 
mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true 
 
closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27) 
 
mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27) 
 
mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false 
 
speeds = 1 
 
local speaker = game:GetService("Players").LocalPlayer 
 
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") 
 
nowe = false 
 
game:GetService("StarterGui"):SetCore("SendNotification", { 
Title = "Fly";
Text = "Kovizim";
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5; 
 
Frame.Active = true -- main = gui
Frame.Draggable = true 
 
onof.MouseButton1Down:connect(function() 
 
if nowe == true then
nowe = false 
 
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else 
nowe = true
 
 
 
for i = 1, speeds do
spawn(function() 
 
local hb = game:GetService("RunService").Heartbeat
 
 
tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 
 
end)
end
game.Players.LocalPlayer.Character.Animate.Disabled = true
local Char = game.Players.LocalPlayer.Character
local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController") 
 
for i,v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
 
 
 
 
if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
 
 
 
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0
 
 
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
plr.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
game:GetService("RunService").RenderStepped:Wait() 
 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end
--game.Players.LocalPlayer.Character.Animate.Disabled = true
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false
tpwalking = false
 
 
 
 
else
local plr = game.Players.LocalPlayer
local UpperTorso = plr.Character.UpperTorso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0
 
 
local bg = Instance.new("BodyGyro", UpperTorso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
plr.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
wait() 
 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end 
 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false
tpwalking = false
 
 
 
end
 
 
 
 
 
end) 
 
local tis 
 
up.MouseButton1Down:connect(function()
tis = up.MouseEnter:connect(function()
while tis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end
end)
end) 
 
up.MouseLeave:connect(function()
if tis then
tis:Disconnect()
tis = nil
end
end) 
 
local dis 
 
down.MouseButton1Down:connect(function()
dis = down.MouseEnter:connect(function()
while dis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end
end)
end) 
 
down.MouseLeave:connect(function()
if dis then
dis:Disconnect()
dis = nil
end
end)
 
 
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
wait(0.7)
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false 
 
end)
 
 
plus.MouseButton1Down:connect(function()
speeds = speeds + 1
speed.Text = speeds
if nowe == true then
 
 
tpwalking = false
for i = 1, speeds do
spawn(function() 
 
local hb = game:GetService("RunService").Heartbeat
 
 
tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 
 
end)
end
end
end)
mine.MouseButton1Down:connect(function()
if speeds == 1 then
speed.Text = 'cannot be less than 1'
wait(1)
speed.Text = speeds
else
speeds = speeds - 1
speed.Text = speeds
if nowe == true then
tpwalking = false
for i = 1, speeds do
spawn(function() 
 
local hb = game:GetService("RunService").Heartbeat
 
 
tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 
 
end)
end
end
end
end) 
 
closebutton.MouseButton1Click:Connect(function()
main:Destroy()
end) 
 
mini.MouseButton1Click:Connect(function()
up.Visible = false
down.Visible = false
onof.Visible = false
plus.Visible = false
speed.Visible = false
mine.Visible = false
mini.Visible = false
mini2.Visible = true
main.Frame.BackgroundTransparency = 1
closebutton.Position = UDim2.new(0, 0, -1, 57)
end) 
 
mini2.MouseButton1Click:Connect(function()
up.Visible = true
down.Visible = true
onof.Visible = true
plus.Visible = true
speed.Visible = true
mine.Visible = true
mini.Visible = true
mini2.Visible = false
main.Frame.BackgroundTransparency = 0 
closebutton.Position = UDim2.new(0, 0, -1, 27)
end)
    
end)

tab.newButton("Objetos universal", "mostra aproximadamente todos os itens do jogo" , function()
    
-- Função para traduzir o nome do objeto para português do Brasil
local function translateToPortuguese(objectName)
    local translations = {
        ["Collectible"] = "Coletável",
        ["Item"] = "Item",
        ["PowerUp"] = "Potencializador",
        ["HealthPack"] = "Kit de Saúde",
        ["Ammo"] = "Munição",
        ["Weapon"] = "Arma",
        ["Armor"] = "Armadura",
        ["Coin"] = "Moeda",
        ["Gem"] = "Gema",
        ["Key"] = "Chave",
        ["Treasure"] = "Tesouro",
        ["Potion"] = "Poção",
        ["Boost"] = "Impulso",
        ["Shield"] = "Escudo",
        ["Food"] = "Comida",
        ["Drink"] = "Bebida",
        ["Experience"] = "Experiência",
        ["Upgrade"] = "Atualização",
        ["CraftingMaterial"] = "Material de Fabricação",
        ["Token"] = "Ficha",
        ["Scroll"] = "Pergaminho",
        ["Artifact"] = "Artefato",
        ["Chest"] = "Baú",
        ["Ring"] = "Anel",
        ["Necklace"] = "Colar",
        ["Bracelet"] = "Pulseira",
        ["Boots"] = "Botas",
        ["Gloves"] = "Luvas",
        ["Helmet"] = "Capacete",
        ["Belt"] = "Cinto",
        ["ScrollOfWisdom"] = "Pergaminho da Sabedoria",
        ["MagicStone"] = "Pedra Mágica",
        ["SoulGem"] = "Gema da Alma",
        ["Rune"] = "Runa",
        ["Feather"] = "Pena",
        ["Bone"] = "Osso",
        ["Gemstone"] = "Pedra Preciosa",
        ["Herb"] = "Erva",
        ["Ingot"] = "Lingote",
        ["Fragment"] = "Fragmento",
        ["Cloth"] = "Tecido",
        ["Wood"] = "Madeira",
        ["Stone"] = "Pedra",
        ["Metal"] = "Metal",
        ["Crystal"] = "Cristal",
        ["Fuel"] = "Combustível",
        ["Fish"] = "Peixe",
        ["Fruit"] = "Fruta",
        ["Vegetable"] = "Legume",
        ["Seed"] = "Semente",
        ["Dust"] = "Pó",
        ["Powder"] = "Pó",
        ["Thread"] = "Fio",
        ["Canvas"] = "Tela",
        ["Flask"] = "Frasco",
        ["Jar"] = "Pote",
        ["Bucket"] = "Balde",
        ["Torch"] = "Tocha",
        ["Lantern"] = "Lanterna",
        ["Map"] = "Mapa",
        ["Guide"] = "Guia",
        ["Rifle"] = "Fuzil",
        ["Shotgun"] = "Espingarda",
        ["Pistol"] = "Pistola",
        ["Sniper"] = "Fuzil de Precisão",
        ["Grenade"] = "Granada",
        ["RocketLauncher"] = "Lançador de Foguetes",
        ["MeleeWeapon"] = "Arma Corpo a Corpo",
        ["SniperRifle"] = "Fuzil de Precisão",
        ["SubmachineGun"] = "Metralhadora",
        ["Explosive"] = "Explosivo",
        ["CombatKnife"] = "Faca de Combate",
        ["AssaultRifle"] = "Fuzil de Assalto",
        ["ShotgunShells"] = "Cartuchos de Espingarda",
        ["Bullet"] = "Bala",
        ["Magazine"] = "Carregador",
        ["Scope"] = "Mira",
        ["Suppressor"] = "Silenciador",
        ["Choke"] = "Choke",
        ["LaserSight"] = "Mira Laser",
        ["Camouflage"] = "Camuflagem",
        ["SurvivalKit"] = "Kit de Sobrevivência",
        ["Stealth"] = "Furtividade",
        ["Flashlight"] = "Lanterna",
        ["NightVisionGoggles"] = "Óculos de Visão Noturna",
        ["Hitbox"] = "Porta" -- Adicionada a tradução de Hitbox
    }
    return translations[objectName] or objectName -- Retorna a tradução ou o nome original se não houver tradução
end

-- Função para criar texto acima dos objetos pegáveis
local function createLabelForObject(object)
    -- Criando o BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = object -- O objeto que o texto seguirá
    billboardGui.Size = UDim2.new(0, 100, 0, 20) -- Tamanho do BillboardGui (ajustado para ser menor)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Desloca o texto para cima do objeto
    billboardGui.AlwaysOnTop = true -- Garante que o texto esteja sempre visível
    billboardGui.Parent = object -- Faz parte do objeto

    -- Criando o TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Preenche o BillboardGui
    textLabel.BackgroundTransparency = 1 -- Fundo transparente
    textLabel.Text = translateToPortuguese(object.Name) -- Nome do objeto traduzido
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- Texto branco
    textLabel.TextStrokeTransparency = 0 -- Contorno do texto visível
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- Cor do contorno preta
    textLabel.TextSize = 10 -- Tamanho fixo do texto (menor)
    textLabel.Font = Enum.Font.SourceSans -- Escolha da fonte
end

-- Função para desenhar uma linha RGB do topo da tela até o nome do objeto
local function drawGradientLine(startPos, endPos)
    local line = Drawing.new("Line")
    line.From = startPos
    line.To = endPos
    line.Color = Color3.fromRGB(255, 0, 0) -- Cor inicial da linha
    line.Thickness = 2
    line.Transparency = 0

    local gradientSpeed = 0.005
    local hue = 0

    game:GetService("RunService").RenderStepped:Connect(function()
        hue = (hue + gradientSpeed) % 1
        line.Color = Color3.fromHSV(hue, 1, 1) -- Atualiza a cor da linha para criar um efeito de gradiente
    end)

    return line
end

-- Função para verificar se o objeto é pegável
local function isCollectible(object)
    return object:IsA("BasePart") and object:FindFirstChild("TouchInterest") -- Exemplo de objetos tocáveis
end

-- Aplica o texto em todos os objetos pegáveis
local function labelCollectibleObjects()
    for _, object in pairs(workspace:GetDescendants()) do
        if isCollectible(object) then
            createLabelForObject(object)

            -- Desenha a linha do topo da tela até o nome do objeto
            local camera = workspace.CurrentCamera
            local partPos, onscreen = camera:WorldToViewportPoint(object.Position + Vector3.new(0, 2, 0))
            local startPos = Vector2.new(camera.ViewportSize.X / 2, 0)
            local endPos = Vector2.new(partPos.X, partPos.Y)

            drawGradientLine(startPos, endPos)
        end
    end
end

-- Detecta novos objetos adicionados ao jogo e aplica o rótulo neles
workspace.DescendantAdded:Connect(function(object)
    if isCollectible(object) then
        createLabelForObject(object)

        -- Desenha a linha do topo da tela até o nome do objeto
        local camera = workspace.CurrentCamera
        local partPos, onscreen = camera:WorldToViewportPoint(object.Position + Vector3.new(0, 2, 0))
        local startPos = Vector2.new(camera.ViewportSize.X / 2, 0)
        local endPos = Vector2.new(partPos.X, partPos.Y)

        drawGradientLine(startPos, endPos)
    end
end)

-- Executa a função inicialmente para marcar os objetos existentes
labelCollectibleObjects()

end)



tab.newButton("Admin Menu", "opções de admistrador nativo" , function()
    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    
end)


----Speed Hack

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Variável para armazenar o estado do toggle e a velocidade escolhida
local speedEnabled = false
local defaultSpeed = 16 -- Velocidade padrão
local selectedSpeed = defaultSpeed -- Armazena a velocidade selecionada no slider

-- Função para aplicar a velocidade atual no humanoide
local function applySpeed()
    if speedEnabled then
        humanoid.WalkSpeed = selectedSpeed
        print("Velocidade ajustada para: " .. humanoid.WalkSpeed)
    else
        humanoid.WalkSpeed = defaultSpeed
    end
end

-- Botão para ligar e desligar o controle de velocidade
tab.newToggle("Speed Hack", "Ativar/desativar Speed Hack", true, function(toggleState)
    speedEnabled = toggleState
    applySpeed() -- Aplica a velocidade com base no estado atual
    print(toggleState and "Velocidade ativada" or "Velocidade desativada")
end)

-- Slider para controlar a velocidade (de 16 até 500)
tab.newSlider("Speed", "Controle a velocidade (de 16 até 500)", 500, false, function(num)
    selectedSpeed = math.max(num, 16) -- Garante que a velocidade nunca seja menor que 16
    applySpeed() -- Aplica a nova velocidade se o controle estiver ativado
end, 16) -- Define o valor inicial do slider como 16

-- Listener para reaplicar a velocidade após a morte do personagem
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = newCharacter:WaitForChild("Humanoid")
    applySpeed() -- Reaplica a velocidade quando o personagem renascer
end)

----User 

local tab = DrRayLibrary.newTab("User", "rbxassetid://6022668945")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Variável para controlar o estado do ESP
local espEnabled = false
local lines = {}  -- Tabela para armazenar as linhas

-- Função para desenhar as linhas brancas
local function DrawLine()
    local line = Drawing.new("Line")
    line.Color = Color3.fromRGB(255, 255, 255) -- Branco
    line.Thickness = 1
    line.Transparency = 1
    line.Visible = true
    return line
end

-- Função para atualizar o ESP
local function UpdateESP()
    if not espEnabled then
        for _, line in pairs(lines) do
            line.Visible = false  -- Torna as linhas invisíveis se o ESP estiver desativado
        end
        return
    end

    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        -- Obtendo as posições de cada parte do corpo
        local headPos = Camera:WorldToViewportPoint(character.Head.Position)
        local torsoPos = Camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
        local rightArmPos = Camera:WorldToViewportPoint(character:FindFirstChild("RightHand").Position)
        local leftArmPos = Camera:WorldToViewportPoint(character:FindFirstChild("LeftHand").Position)
        local rightLegPos = Camera:WorldToViewportPoint(character:FindFirstChild("RightFoot").Position)
        local leftLegPos = Camera:WorldToViewportPoint(character:FindFirstChild("LeftFoot").Position)

        -- Atualizando as linhas entre as partes do corpo
        if headPos and torsoPos then
            lines["TorsoToHead"].From = Vector2.new(torsoPos.X, torsoPos.Y)
            lines["TorsoToHead"].To = Vector2.new(headPos.X, headPos.Y)
            lines["TorsoToHead"].Visible = true
        end

        if rightArmPos and torsoPos then
            lines["TorsoToRightArm"].From = Vector2.new(torsoPos.X, torsoPos.Y)
            lines["TorsoToRightArm"].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
            lines["TorsoToRightArm"].Visible = true
        end

        if leftArmPos and torsoPos then
            lines["TorsoToLeftArm"].From = Vector2.new(torsoPos.X, torsoPos.Y)
            lines["TorsoToLeftArm"].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
            lines["TorsoToLeftArm"].Visible = true
        end

        if rightLegPos and torsoPos then
            lines["TorsoToRightLeg"].From = Vector2.new(torsoPos.X, torsoPos.Y)
            lines["TorsoToRightLeg"].To = Vector2.new(rightLegPos.X, rightLegPos.Y)
            lines["TorsoToRightLeg"].Visible = true
        end

        if leftLegPos and torsoPos then
            lines["TorsoToLeftLeg"].From = Vector2.new(torsoPos.X, torsoPos.Y)
            lines["TorsoToLeftLeg"].To = Vector2.new(leftLegPos.X, leftLegPos.Y)
            lines["TorsoToLeftLeg"].Visible = true
        end
    end
end

-- Função para desenhar o ESP
local function DrawESP()
    if espEnabled then
        -- Cria as linhas se ainda não existirem
        if next(lines) == nil then
            lines["TorsoToHead"] = DrawLine()
            lines["TorsoToRightArm"] = DrawLine()
            lines["TorsoToLeftArm"] = DrawLine()
            lines["TorsoToRightLeg"] = DrawLine()
            lines["TorsoToLeftLeg"] = DrawLine()
        end

        -- Conecta a função de atualização ao RenderStepped
        RunService.RenderStepped:Connect(UpdateESP)
    end
end

-- Função para ativar/desativar o ESP
local function ToggleESP(state)
    espEnabled = state
    if espEnabled then
        print("ESP On")
        DrawESP()  -- Ativa o ESP novamente
    else
        print("ESP Off")
        -- Torna as linhas invisíveis quando o ESP é desativado
        for _, line in pairs(lines) do
            line.Visible = false
        end
    end
end

-- Adiciona o botão de toggle na interface DrRay
tab.newToggle("Esp Skeleton", "Ativa ou desativa o esqueleto ( indio ) do user", false, function(toggleState)
    ToggleESP(toggleState)  -- Chama a função de toggle quando o botão é clicado
end)

-- Preview: https://cdn.discordapp.com/attachments/807887111667056680/820258191224340490/chams.png
-- Made by Blissful#4992
local Settings = {
    TeamCheck = true, -- Overrules Color
    LightRed = Color3.fromRGB(255, 100, 100),
    DarkRed = Color3.fromRGB(150, 0, 0),
    Color = Color3.fromRGB(255, 0, 0),
    TeamColor = false
}

--// Locals
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()
local espOutlineEnabled = false -- Variável para controlar o estado do ESP Outline

local function NewQuad(color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = true
    quad.Thickness = 1
    quad.Transparency = 0.25
    return quad
end

local function Colorize(color, lib)
    for i, v in pairs(lib) do
        v.Color = color
    end
end

local function ESP(object, plr)
    local part = object
    --// Quads for 3D box (6)
    local quads = {
        quad1 = NewQuad(Settings.Color),
        quad2 = NewQuad(Settings.Color),
        quad3 = NewQuad(Settings.Color),
        quad4 = NewQuad(Settings.Color),
        quad5 = NewQuad(Settings.Color),
        quad6 = NewQuad(Settings.Color)
    }

    --// Updates ESP in render loop
    local function Updater()
        local connection
        local toggle = true
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            wait(2) -- Atraso de 2 segundos entre cada atualização
            toggle = not toggle -- Alterna entre verdadeiro e falso a cada ciclo

            if plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild(object.Name) ~= nil then
                local partpos, onscreen = camera:WorldToViewportPoint(part.Position)
                if onscreen then
                    local size_X = part.Size.X / 2
                    local size_Y = part.Size.Y / 2
                    local size_Z = part.Size.Z / 2
                    
                    local Top1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, -size_Z)).p)
                    local Top2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, size_Z)).p)
                    local Top3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, size_Z)).p)
                    local Top4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, -size_Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, -size_Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, size_Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, size_Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, -size_Z)).p)

                    --// Top:
                    quads.quad1.PointA = Vector2.new(Top1.X, Top1.Y)
                    quads.quad1.PointB = Vector2.new(Top2.X, Top2.Y)
                    quads.quad1.PointC = Vector2.new(Top3.X, Top3.Y)
                    quads.quad1.PointD = Vector2.new(Top4.X, Top4.Y)

                    --//Bottom:
                    quads.quad2.PointA = Vector2.new(Bottom1.X, Bottom1.Y)
                    quads.quad2.PointB = Vector2.new(Bottom2.X, Bottom2.Y)
                    quads.quad2.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                    quads.quad2.PointD = Vector2.new(Bottom4.X, Bottom4.Y)

                    --//Sides:
                    quads.quad3.PointA = Vector2.new(Top1.X, Top1.Y)
                    quads.quad3.PointB = Vector2.new(Top2.X, Top2.Y)
                    quads.quad3.PointC = Vector2.new(Bottom2.X, Bottom2.Y)
                    quads.quad3.PointD = Vector2.new(Bottom1.X, Bottom1.Y)
                    
                    quads.quad4.PointA = Vector2.new(Top2.X, Top2.Y)
                    quads.quad4.PointB = Vector2.new(Top3.X, Top3.Y)
                    quads.quad4.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                    quads.quad4.PointD = Vector2.new(Bottom2.X, Bottom2.Y)
                    
                    quads.quad5.PointA = Vector2.new(Top3.X, Top3.Y)
                    quads.quad5.PointB = Vector2.new(Top4.X, Top4.Y)
                    quads.quad5.PointC = Vector2.new(Bottom4.X, Bottom4.Y)
                    quads.quad5.PointD = Vector2.new(Bottom3.X, Bottom3.Y)

                    quads.quad6.PointA = Vector2.new(Top4.X, Top4.Y)
                    quads.quad6.PointB = Vector2.new(Top1.X, Top1.Y)
                    quads.quad6.PointC = Vector2.new(Bottom1.X, Bottom1.Y)
                    quads.quad6.PointD = Vector2.new(Bottom4.X, Bottom4.Y)

                    -- Alterna entre vermelho claro e vermelho escuro a cada ciclo
                    if toggle then
                        Colorize(Settings.LightRed, quads)
                    else
                        Colorize(Settings.DarkRed, quads)
                    end

                    for u, x in pairs(quads) do
                        x.Visible = espOutlineEnabled -- Aplica a visibilidade do ESP Outline
                    end
                else 
                    for u, x in pairs(quads) do
                        x.Visible = false
                    end
                end
            else 
                for u, x in pairs(quads) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

-- Atualiza apenas para o próprio jogador
if player.Character then
    for u, x in pairs(player.Character:GetChildren()) do
        if x:IsA("MeshPart") or x.Name == "Head" or x.Name == "Left Arm" or x.Name == "Right Arm" or x.Name == "Right Leg" or x.Name == "Left Leg" or x.Name == "Torso" then
            coroutine.wrap(ESP)(x, player)
        end
    end
end

-- Botão para ativar/desativar a outline do ESP
tab.newToggle("Esp Outline", "Mostra a outline do user", false, function(toggleState) -- false para começar desligado
    espOutlineEnabled = toggleState -- Atualiza a variável de controle do ESP Outline
    if toggleState then
        print("ESP Outline On")
    else
        print("ESP Outline Off")
    end
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local runService = game:GetService("RunService")

-- Variável para controlar a ESP
local espEnabled = false
local espOutline

-- Função para criar a ESP
local function createESP()
    if espEnabled then return end

    espEnabled = true

    espOutline = Instance.new("Highlight") -- Cria um novo objeto de destaque (Highlight)
    espOutline.Parent = character
    espOutline.FillColor = Color3.fromRGB(128, 0, 128) -- Cor roxa
    espOutline.OutlineColor = Color3.fromRGB(255, 255, 255) -- Cor do contorno (branco)
    espOutline.OutlineTransparency = 0.5 -- Transparência do contorno
    espOutline.Enabled = true -- Ativa a ESP

    -- Atualiza a posição da ESP a cada 0.5 segundos
    while espEnabled do
        espOutline.Adornee = character -- Atualiza a parte que o destaque deve seguir
        wait(0.5) -- Aguardar 0.5 segundos antes da próxima atualização
    end
end

-- Função para remover a ESP
local function removeESP()
    if espOutline then
        espOutline:Destroy() -- Remove o Highlight
        espOutline = nil
    end
    espEnabled = false
end

-- Criação do toggle no menu para ativar/desativar a ESP
tab.newToggle("Esp Chams", "Cria uma chams no user", false, function(toggleState)
    if toggleState then
        createESP()
    else
        removeESP()
    end
end)


local function ESP(object, plr)
    local part = object
    --// Quads for 3D box (6)
    local quads = {
        quad1 = NewQuad(Settings.Color),
        quad2 = NewQuad(Settings.Color),
        quad3 = NewQuad(Settings.Color),
        quad4 = NewQuad(Settings.Color),
        quad5 = NewQuad(Settings.Color),
        quad6 = NewQuad(Settings.Color)
    }

    --// Updates ESP in render loop
    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if ESPEnabled and plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild(object.Name) ~= nil then
                local partpos, onscreen = camera:WorldToViewportPoint(part.Position)
                if onscreen then
                    local size_X = part.Size.X / 2
                    local size_Y = part.Size.Y / 2
                    local size_Z = part.Size.Z / 2

                    local Top1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, -size_Z)).p)
                    local Top2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, size_Z)).p)
                    local Top3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, size_Z)).p)
                    local Top4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, -size_Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, -size_Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, size_Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, size_Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, -size_Z)).p)

                    --// Top:
                    quads.quad1.PointA = Vector2.new(Top1.X, Top1.Y)
                    quads.quad1.PointB = Vector2.new(Top2.X, Top2.Y)
                    quads.quad1.PointC = Vector2.new(Top3.X, Top3.Y)
                    quads.quad1.PointD = Vector2.new(Top4.X, Top4.Y)

                    --// Bottom:
                    quads.quad2.PointA = Vector2.new(Bottom1.X, Bottom1.Y)
                    quads.quad2.PointB = Vector2.new(Bottom2.X, Bottom2.Y)
                    quads.quad2.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                    quads.quad2.PointD = Vector2.new(Bottom4.X, Bottom4.Y)

                    --// Sides:
                    quads.quad3.PointA = Vector2.new(Top1.X, Top1.Y)
                    quads.quad3.PointB = Vector2.new(Top2.X, Top2.Y)
                    quads.quad3.PointC = Vector2.new(Bottom2.X, Bottom2.Y)
                    quads.quad3.PointD = Vector2.new(Bottom1.X, Bottom1.Y)

                    quads.quad4.PointA = Vector2.new(Top2.X, Top2.Y)
                    quads.quad4.PointB = Vector2.new(Top3.X, Top3.Y)
                    quads.quad4.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                    quads.quad4.PointD = Vector2.new(Bottom2.X, Bottom2.Y)

                    quads.quad5.PointA = Vector2.new(Top3.X, Top3.Y)
                    quads.quad5.PointB = Vector2.new(Top4.X, Top4.Y)
                    quads.quad5.PointC = Vector2.new(Bottom4.X, Bottom4.Y)
                    quads.quad5.PointD = Vector2.new(Bottom3.X, Bottom3.Y)

                    quads.quad6.PointA = Vector2.new(Top4.X, Top4.Y)
                    quads.quad6.PointB = Vector2.new(Top1.X, Top1.Y)
                    quads.quad6.PointC = Vector2.new(Bottom1.X, Bottom1.Y)
                    quads.quad6.PointD = Vector2.new(Bottom4.X, Bottom4.Y)

                    if Settings.TeamCheck then
                        if plr.TeamColor == player.TeamColor then
                            local group_color = Settings.Green
                            Colorize(group_color, quads)
                        else
                            local group_color = Settings.Red
                            Colorize(group_color, quads)
                        end
                    else
                        local group_color = Settings.Color
                        Colorize(group_color, quads)
                    end

                    if Settings.TeamColor then
                        Colorize(plr.TeamColor.Color, quads)
                    end

                    for u, x in pairs(quads) do
                        x.Visible = true
                    end
                else
                    for u, x in pairs(quads) do
                        x.Visible = false
                    end
                end
            else
                for u, x in pairs(quads) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    spawn(function()
        if v.Name == player.Name then return end
        repeat wait() until v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil
        for u, x in pairs(v.Character:GetChildren()) do
            if x:IsA("MeshPart") or x.Name == "Head" or x.Name == "Left Arm" or x.Name == "Right Arm" or x.Name == "Right Leg" or x.Name == "Left Leg" or x.Name == "Torso" then
                coroutine.wrap(ESP)(x, v)
            end
        end
    end)
end

game.Players.PlayerAdded:Connect(function(newplr)
    spawn(function()
        if newplr.Name == player.Name then return end
        repeat wait() until newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil
        for u, x in pairs(newplr.Character:GetChildren()) do
            if x:IsA("MeshPart") or x.Name == "Head" or x.Name == "Left Arm" or x.Name == "Right Arm" or x.Name == "Right Leg" or x.Name == "Left Leg" or x.Name == "Torso" then
                coroutine.wrap(ESP)(x, newplr)
            end
        end
    end)
end)
    
-- Test
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")

-- Variáveis para o contador de FPS
local fpsCounter = 0
local lastTime = tick()

-- Variáveis para toggles (começando desativados)
local showBox = false
local showFPS = false
local showHealth = false
local showSpeed = false

-- Funções de Toggle
tab.newToggle("Esp Box", "Esp Box user", false, function(toggleState)
    showBox = toggleState
end)

tab.newToggle("Status FPS", "Liga/desliga o contador de FPS", false, function(toggleState)
    showFPS = toggleState
end)

tab.newToggle("Status Vida", "Liga/desliga o contador de Vida", false, function(toggleState)
    showHealth = toggleState
end)

tab.newToggle("Status Velocidade", "Liga/desliga o contador de Velocidade", false, function(toggleState)
    showSpeed = toggleState
end)

local function DrawESP(plr)
    local Box = Drawing.new("Quad")
    Box.Visible = false
    Box.PointA = Vector2.new(0, 0)
    Box.PointB = Vector2.new(0, 0)
    Box.PointC = Vector2.new(0, 0)
    Box.PointD = Vector2.new(0, 0)
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 1
    Box.Transparency = 1

    -- Adicionando o texto para o contador de FPS
    local FPSText = Drawing.new("Text")
    FPSText.Visible = false
    FPSText.Color = Color3.fromRGB(255, 255, 255)
    FPSText.Size = 16
    FPSText.Center = true
    FPSText.Outline = true
    FPSText.OutlineColor = Color3.fromRGB(0, 0, 0)

    -- Adicionando o texto para a quantidade de vida
    local HealthText = Drawing.new("Text")
    HealthText.Visible = false
    HealthText.Color = Color3.fromRGB(255, 255, 255)
    HealthText.Size = 16
    HealthText.Center = true
    HealthText.Outline = true
    HealthText.OutlineColor = Color3.fromRGB(0, 0, 0)

    -- Adicionando o texto para a velocidade
    local SpeedText = Drawing.new("Text")
    SpeedText.Visible = false
    SpeedText.Color = Color3.fromRGB(255, 255, 255)
    SpeedText.Size = 16
    SpeedText.Center = true
    SpeedText.Outline = true
    SpeedText.OutlineColor = Color3.fromRGB(0, 0, 0)

    local function Update()
        local c
        c = RunService.RenderStepped:Connect(function()
            -- Atualizar FPS
            fpsCounter = fpsCounter + 1
            local currentTime = tick()
            if currentTime - lastTime >= 1 then
                FPSText.Text = "FPS: " .. tostring(fpsCounter)
                fpsCounter = 0
                lastTime = currentTime
            end

            -- Atualizar Vida
            if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
                local health = plr.Character:FindFirstChildOfClass("Humanoid").Health
                HealthText.Text = "Vida: " .. math.floor(health)
            end

            -- Atualizar Velocidade
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local velocity = plr.Character.HumanoidRootPart.Velocity
                local speed = math.floor(velocity.Magnitude)
                SpeedText.Text = "Speed: " .. speed
            end

            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local pos, vis = Camera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    for _,v in pairs(plr.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p, vis = Camera:WorldToViewportPoint(v.Position)
                            if v == plr.Character.PrimaryPart then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = {p, vis}
                        end
                    end

                    local TopY = math.huge
                    local DownY = -math.huge
                    local LeftX = math.huge
                    local RightX = -math.huge

                    local Left
                    local Right
                    local Top
                    local Bottom

                    for _,v in pairs(points) do
                        if v[2] == true then
                            local p = v[1]
                            if p.Y < TopY then
                                Top = p
                                TopY = p.Y
                            end
                            if p.Y > DownY then
                                Bottom = p
                                DownY = p.Y
                            end
                            if p.X > RightX then
                                Right = p
                                RightX = p.X
                            end
                            if p.X < LeftX then
                                Left = p
                                LeftX = p.X
                            end
                        end
                    end

                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        -- Controla a visibilidade da Box
                        if showBox then
                            Box.PointA = Vector2.new(Right.X, Top.Y)
                            Box.PointB = Vector2.new(Left.X, Top.Y)
                            Box.PointC = Vector2.new(Left.X, Bottom.Y)
                            Box.PointD = Vector2.new(Right.X, Bottom.Y)
                            Box.Visible = true
                        else
                            Box.Visible = false
                        end

                        -- Controla a visibilidade do contador de FPS
                        if showFPS then
                            FPSText.Position = Vector2.new(Right.X + 30, Top.Y + 10)
                            FPSText.Visible = true
                        else
                            FPSText.Visible = false
                        end

                        -- Controla a visibilidade do contador de Vida
                        if showHealth then
                            HealthText.Position = Vector2.new(Right.X + 30, Top.Y + 30)
                            HealthText.Visible = true
                        else
                            HealthText.Visible = false
                        end

                        -- Controla a visibilidade do contador de Velocidade
                        if showSpeed then
                            SpeedText.Position = Vector2.new(Right.X + 30, Top.Y + 50)
                            SpeedText.Visible = true
                        else
                            SpeedText.Visible = false
                        end
                    else 
                        Box.Visible = false
                        FPSText.Visible = false
                        HealthText.Visible = false
                        SpeedText.Visible = false
                    end
                else 
                    Box.Visible = false
                    FPSText.Visible = false
                    HealthText.Visible = false
                    SpeedText.Visible = false
                end
            else
                Box.Visible = false
                FPSText.Visible = false
                HealthText.Visible = false
                SpeedText.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

-- Desenha ESP apenas para o próprio jogador
DrawESP(Player)
        
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

-- Variáveis para controlar o Anti Aim
local antiAimEnabled = false -- Estado inicial do Anti Aim
local walkingRotationSpeed = 170 -- Velocidade de rotação ao andar
local baseRotationSpeed = walkingRotationSpeed / 2 -- Velocidade de rotação quando parado

-- Função para rotação aleatória do personagem
local function randomizeRotation(rotationSpeed)
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(math.random(-rotationSpeed, rotationSpeed)), 0)
end

-- Função principal para aplicar o Anti Aim
local function antiAimMovement()
    while antiAimEnabled do
        local isMoving = humanoidRootPart.Velocity.magnitude > 1 -- Verifica se o jogador está se movendo
        
        -- Aumenta a rotação com base no movimento
        local rotationSpeed = isMoving and walkingRotationSpeed or baseRotationSpeed
        randomizeRotation(rotationSpeed)

        task.wait(0.05) -- Pequeno intervalo para suavizar as rotações
    end
end

-- Função para iniciar ou parar o Anti Aim
local function toggleAntiAim(toggleState)
    antiAimEnabled = toggleState
    if toggleState then
        print("Anti Aim On")
        antiAimMovement() -- Inicia a função de movimento
    else
        print("Anti Aim Off")
    end
end

-- Criação do toggle no menu para ativar/desativar o Anti Aim
tab.newToggle("Anti Aim", "ativo ou desativo o Anti Aim", false, toggleAntiAim)

-- Garantir que a rotação do personagem não afete a câmera
userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        humanoid.AutoRotate = true -- Permite ao jogador mover a câmera
    end
end)

-- Define a velocidade de caminhada do personagem normalmente
runService.Stepped:Connect(function()
    humanoid.WalkSpeed = 16 -- Velocidade normal de caminhada
end)
    
    -- LocalScript para forçar a iluminação noturna com botão de toggle
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Variável para controlar o estado do toggle
local isNightEnabled = false

-- Função para definir a iluminação noturna
local function setNight()
    Lighting.TimeOfDay = "00:00:00"  -- Define o horário como meia-noite
    Lighting.Brightness = 1.0          -- Aumenta o brilho da iluminação
    Lighting.Ambient = Color3.fromRGB(30, 30, 50)  -- Cor do ambiente para um tom mais escuro
    Lighting.FogColor = Color3.fromRGB(0, 0, 50)    -- Cor da neblina para um efeito noturno
    Lighting.FogEnd = 500               -- Distância do fim da neblina
end

-- Função para restaurar o horário padrão
local function restoreDay()
    Lighting.TimeOfDay = "14:00:00"  -- Define o horário como 14:00 (ou outro horário desejado)
    Lighting.Brightness = 2.0          -- Ajusta o brilho da iluminação para o dia
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)  -- Cor do ambiente para um tom claro
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)  -- Cor da neblina para um efeito diurno
    Lighting.FogEnd = 1000              -- Distância do fim da neblina
end

-- Criação do botão toggle
tab.newToggle("Night", "Forçar ciclo entre dia e noite", false, function(toggleState)
    if toggleState then
        isNightEnabled = true
        setNight()  -- Ativa a iluminação noturna
        print("Noite ativada")
    else
        isNightEnabled = false
        restoreDay()  -- Restaura o horário padrão
        print("Dia ativado")
    end
end)

-- Loop para manter a iluminação
while true do
    wait(10)  -- Espera um intervalo para evitar sobrecarga
    if isNightEnabled then
        setNight()  -- Reaplica as configurações de noite
    end
end
            
            
            
            else
            Key:SetLabel("Key errada!") -- Mostrando que a key está errada
        end
    end,
})
