local plr = game.Players.LocalPlayer
local plr_data = plr.data
local plr_stats = plr_data.stats
local plr_race = plr_stats.race.value
local mouse = plr:GetMouse()
local mob_folder = workspace["mоbs"]
local admin_table = {"unknown1roblox","Aburtz","luna_chxn","ZHasAmnesia","tmeoutz","Zenokei","akimpvperpro42","Infercity","Razuko","Sosakuu","Noclypso","Emkyrie","SkyKurr","DieLitAKIRA","PenguinDevo","TheNotDave","Mxstified","JovahnBigMan","Moyuto"}
local farm = true
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
    if plr_race ~= "Hollow" and plr_race ~= "Adjuchas" then
        plr.Character:WaitForChild("HumanoidRootPart")
        plr.Character.HumanoidRootPart:WaitForChild("overhead")
        plr.Character.HumanoidRootPart.overhead:Destroy()
        plr.Character.Head.face:Destroy()
        for i,v in pairs(plr.Character:GetChildren()) do
            if v.ClassName == "Accessory" or v.ClassName == "Model" then
                v:Destroy()        
            end
        end
    end
end
function writeConsole(text,color)
    rconsoleprint(color)
    rconsoleprint(text)
    rconsoleprint("\n")
end
function farm()
    local target = nil
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
            writeConsole("Finding hollow...","@@WHITE@@")
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
            -- toggle tp on 
            while target.Humanoid.Health > 0 do
                if not plr.Character then break end
                plr.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0,0,7)
                game.RunService.Heartbeat:Wait()
            end
            counter = counter + 1
            writeConsole("Script was killed "..counter.." hollows. You are live: "..tick()-live_time,"@@CYAN@@")
        end
    end
end


for i,v in pairs(game.Players:GetChildren()) do
    checkOnAdmin(v.Name)
end
game.Players.PlayerAdded:Connect(function(p)
    checkOnAdmin(p.Name)
end)

plr.CharacterAdded:Connect(function(character)
    hide()
    live_time = tick()
    writeConsole("Character was hiden.","@@GREEN@@")
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
hide()
live_time = tick()
writeConsole("Character was hiden.","@@GREEN@@")
wait(.1)
writeConsole("Autofarm ON!.","@@LIGHT_RED@@")
spawn(farm)
