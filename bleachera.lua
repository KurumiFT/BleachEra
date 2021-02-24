local VirtualUser = game:GetService("VirtualUser")
local plr = game.Players.LocalPlayer
plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
local plr_data = plr.data
local plr_stats = plr_data.stats
local plr_race = plr_stats.race.value
local mouse = plr:GetMouse()
local mob_folder = workspace["mоbs"]
local admin_table = {"unknown1roblox","Aburtz","luna_chxn","ZHasAmnesia","tmeoutz","Zenokei","akimpvperpro42","Infercity","Razuko","Sosakuu","Noclypso","Emkyrie","SkyKurr","DieLitAKIRA","PenguinDevo","TheNotDave","Mxstified","JovahnBigMan","Moyuto"}
local farm = false
local console_log = true
local counter = 0
local live_time = 0

function checkOnAdmin(name)
    for i,v in pairs(admin_table) do
        if v == name then
            plr:Kick("Admin!")   
            break
        end
    end
end
function hide()
    spawn(function()
        if plr_race ~= "Hollow" and plr_race ~= "Adjuchas" then
            plr.Character:WaitForChild("HumanoidRootPart")
            plr.Character.HumanoidRootPart:WaitForChild("overhead"):Destroy()
            plr.Character:WaitForChild("Head"):WaitForChild("face"):Destroy()
            plr.Character.Head.face:Destroy()
            
            for i,v in pairs(plr.Character:GetChildren()) do
                if v.ClassName == "Accessory" or v.ClassName == "Model" or v.ClassName == "Shirt" or v.ClassName == "Pants" then
                    game.RunService.Heartbeat:Wait()
                    v:Destroy()                    
                end        
            end
            
            plr.Character.ChildAdded:Connect(function(v)
                if v.ClassName == "Accessory" or v.ClassName == "Model" or v.ClassName == "Shirt" or v.ClassName == "Pants" then
                    game.RunService.Heartbeat:Wait()    
                    v:Destroy()                    
                end
            end)
        else
            while plr.Character do
                if plr.Character:FindFirstChild("RootPart") then
                        plr.Character.RootPart:Destroy()
                        break
                end
                game.RunService.Heartbeat:Wait()
            end
        end
    end)
end
function writeConsole(text,color)
    rconsoleprint(color)
    rconsoleprint(text)
    rconsoleprint("\n")
end

function farming()
    --autoattack
    spawn(function()
        while farm do
            wait(.05)
            if plr.Character then
                if plr.Character:FindFirstChild("Weapon") then if plr.Character.Weapon:FindFirstChild("UnEquipped") then game.ReplicatedStorage["evеnts"]["re"]:FireServer("imagine \208\181xpl\208\190iting on leg\208\190 gam\208\181\240\159\140\146 \240\159\144\129 \240\159\152\134 \208\176\208\176\208\176\208\176 \240\159\152\146 \208\190\208\190\208\190 \240\159\152\170 \209\139\209\139\209\139\209\139\209\139 \240\159\153\138 xdddd \226\129\137\twhy y\208\190u re\208\176ding this tho \240\159\145\139 k bye <3 \240\159\145\160\t\240\159\145\160", "InputBegan", "One") end end
                game.ReplicatedStorage["evеnts"]["re"]:FireServer("imagine \208\181xpl\208\190iting on leg\208\190 gam\208\181\240\159\140\146 \240\159\144\129 \240\159\152\134 \208\176\208\176\208\176\208\176 \240\159\152\146 \208\190\208\190\208\190 \240\159\152\170 \209\139\209\139\209\139\209\139\209\139 \240\159\153\138 xdddd \226\129\137\twhy y\208\190u re\208\176ding this tho \240\159\145\139 k bye <3 \240\159\145\160\t\240\159\145\160", "InputBegan", "MouseButton1Down")
            end
        end
    end)
    
    while farm do
        game.RunService.Heartbeat:Wait()
        if plr.Character then
            local picked = false
            local target = nil
            repeat
                local hollows = {}
                for i,v in pairs(mob_folder:GetChildren()) do
                    if v:FindFirstChild("Hollow") then
                        hollows[#hollows+1] = v            
                    end
                end
                --random pick
                if #hollows > 0 then
                    local picked_hollow = hollows[math.random(1,#hollows)]
                    target = picked_hollow
                end
                wait(1)
            until target
            picked = true
            -- toggle tp on 
            plr.Character:Destroy()
            
            while target.Humanoid.Health > 0 do
                if not farm then break end
                if not target then break end
                if not target:FindFirstChild("HumanoidRootPart") then break end
                if plr.Character then
                    if plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("HumanoidRootPart") then
                        plr.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0,0,7) 
                    end
                end
                game.RunService.Heartbeat:Wait()
            end
            if console_log then
                if picked and (not target or target.Humanoid.Health <= 0) then
                        counter = counter + 1
                        writeConsole("Script was killed "..counter.." hollows. You are live: "..tick()-live_time,"@@CYAN@@")
                end
            end
        end
    end
end
function bindCommand()
    while true do
        local command = rconsoleinput()
        if command == "/logs" then
            logs = not logs
            writeConsole("Done.","@@GREEN@@")
        end
        if command == "/farm" then
            farm = not farm
            if not farm then
                writeConsole("Autofarm OFF!","@@LIGHT_RED@@")
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:BreakJoints()                
                end
            else
                writeConsole("Autofarm ON!","@@LIGHT_RED@@")
                spawn(farming)
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:BreakJoints()                
                end
            end
        end
        if command == "/players" then
            writeConsole("Player list:","@@DARK_GRAY@@")
            for i,v in pairs(game.Players:GetChildren()) do
                if v:FindFirstChild("data") then
                    if v.data:FindFirstChild("stats") then
                        writeConsole(v.Name.." - "..v.data.stats.race.value,"@@LIGHT_GRAY@@")                    
                    end
                end
            end
            writeConsole("###","@@DARK_GRAY@@")
        end
        
        if command == "/bkill" then
            if workspace:FindFirstChild("Vasto Boss") then
                workspace["Vasto Boss"].Humanoid.Health = 0
                writeConsole("Vasto Boss HP setted to 0","@@GREEN@@")
            end
        end
        
        if #string.split(command," ") > 1 then
            if string.split(command," ")[1] == "/teleport" then
                if not game.Players:FindFirstChild(string.split(command," ")[2]) then
                    writeConsole("Player not found","@@RED@@")
                else
                    if game.Players[string.split(command," ")[2]].Character then
                        if game.Players[string.split(command," ")[2]].Character:FindFirstChild("HumanoidRootPart") then plr.Character.HumanoidRootPart.CFrame = game.Players[string.split(command," ")[2]].Character.HumanoidRootPart.CFrame * CFrame.new(0,50,0) 
                            writeConsole("You teleported to "..string.split(command," ")[2],"@@LIGHT_GREEN@@")    
                        end
                    end
                end
            end
        end
    end
end


local Response = syn.request({
    Url="http://kurumi.pythonanywhere.com/login?code=".._G.code,
    Method="Get"
})

if Response.Body == false then
    writeConsole("INVALID KEY","@@LIGHT_RED@@")
    script.Disabled = true
else
    writeConsole("Authorization successful","@@LIGHT_GREEN@@")
end

for i,v in pairs(game.Players:GetChildren()) do
    if farm then
        checkOnAdmin(v.Name)
    end
end
game.Players.PlayerAdded:Connect(function(p)
    if farm then
        checkOnAdmin(p.Name)
    end
end)
plr.CharacterAdded:Connect(function(character)
    if farm then
        hide()
        character:WaitForChild("Humanoid")
        character.Humanoid.Died:Connect(function()
            plr.Character:Destroy()
        end)
    end
    live_time = tick()
end)

--begin info
rconsoleclear()
writeConsole("*Script maded by Kurumi#1234.*","@@WHITE@@")
wait(.1)
writeConsole("Functions init.","@@LIGHT_GREEN@@")
wait(.1)
writeConsole("Checking race...","@@YELLOW@@")
wait(.1)
writeConsole("Race: "..plr_stats.race.value,"@@GREEN@@")
wait(.1)
live_time = tick()
rconsoleinfo("/logs - Enable/Disable logs")
rconsoleinfo("/farm - Enable/Disable Autofarm")
rconsoleinfo("/players - Player list with races")
rconsoleinfo("/teleport [Nickname] - Teleport to Player (Please full Nickname)")
rconsoleinfo("/bkill - Set resurrection boss HP to 0")

spawn(bindCommand)
