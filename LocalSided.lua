local player = game:GetService("Players").LocalPlayer or owner or game:GetService("Players"):WaitForChild("Player")
player.Character:WaitForChild("Humanoid")

local folder = Instance.new("Folder", game:GetService("Workspace"))
folder.Name = "Orb"
 
 -- Commands soon to add more :D
 
local config={}
config.OrbCmds={}
config.OrbCmds.Prefix=';'
config.OrbCmds.UseEndingPrefix=false
config.OrbCmds.EndingPrefix='-'
config.OrbCmds.BSUDType='Ban'
config.OrbCmds.Storage={}
config.Cmd=function(name,func)
    table.insert(config.OrbCmds.Storage,{name,func})
end
config.getCmd=function(str)
        for b,c in pairs(config.OrbCmds.Storage) do
                if (c[1]==str) then
                        c[2]()
                end
        end
end





config.Cmd("lol",function()
        local hm=Instance.new('Message',workspace)
        hm.Text='LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOL'
        local h=hm.Text
        local chrs={}
        hm.Text=""
        for i=0,string.len(h) do
                table.insert(chrs,h:sub(i,1))
        end
        for lool=1,#chrs do
                hm.Text=hm.Text..chrs[lool]
        end
        wait(1.25)
        hm:remove()
end)

local part = Instance.new("Part")
 
local function res()
part.Parent = folder
part.Shape = "Ball"
part.Material = "Neon" 
part.FormFactor = "Custom"
part.Size = Vector3.new(1,1,1)
part.Name = "Orb"
part.Anchored = true
part.Locked = true
part.CanCollide = false
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"      
part.BrickColor = BrickColor.White()
end

-- Banned people

local bannedlist = {"WhiteCodeLua","iLeFancy","Nexure","BuilderMan","tusKORs666"} --These are the nubs we add em here   

-- Some scripting
 
player.Chatted:connect(function(t)
        if (t:sub(0,string.len(config.OrbCmds.Prefix))==config.OrbCmds.Prefix) then
                if (string.len(t)>=string.len(config.OrbCmds.EndingPrefix)) then
                        print(t:sub(string.len(t)-string.len(config.OrbCmds.EndingPrefix)+1))
                        print(t:sub(string.len(config.OrbCmds.Prefix)+1):sub(0,string.len(t)-string.len(config.OrbCmds.EndingPrefix)+1))
                        if (t:sub(string.len(t)-string.len(config.OrbCmds.EndingPrefix))==config.OrbCmds.EndingPrefix) then
                                config.getCmd(t:sub(string.len(config.OrbCmds.Prefix)+1):sub(0,string.len(t)-string.len(config.OrbCmds.EndingPrefix)))
                        end
                end
        end
end)
function bsud(p)
    
end

res()
 
game:GetService("Workspace").DescendantRemoving:connect(function(v)
if v == folder then
folder = Instance.new("Folder")
folder.Name = "Orb"
part = Instance.new("Part")
folder.Parent = game:GetService("Workspace")
res()   
end
end)
 
local point
 
local loop = coroutine.create(function()
while true do
for i=1,360,4 do
if player.Character and not point then
point = player.Character:FindFirstChild("Torso")        
end
if point.Parent.Name == player.Character.Name then
point = player.Character:FindFirstChild("Torso")        
end
if part then
--[[part.CFrame =  CFrame.new(point.CFrame.p)
    *CFrame.fromEulerAnglesXYZ(
-math.sin(math.rad(i)),math.rad(i),0)
  *CFrame.new(0,7,-2)]]
part.CFrame = CFrame.new(point.CFrame.p)      
                         * CFrame.fromEulerAnglesXYZ(math.rad(i), 0, 0)
                 * CFrame.new(0, 7, -2)
end
wait()
end
end
end)
 
 -- Trailes and Effects are down here
 
local function trailPar()
local pos = part.CFrame.p
wait()
local pos2 = part.CFrame.p
local dist = (pos - pos2).magnitude
local trail = Instance.new("Part")
trail.Anchored = true
trail.Locked = true
trail.Material = "Neon"
trail.CanCollide = false
trail.BottomSurface = "Smooth"
trail.TopSurface = "Smooth"
trail.Shape = "Block"
trail.FormFactor = "Custom"
trail.Size = Vector3.new(0.1,0.1,dist)
trail.CFrame = CFrame.new(pos,pos2) *CFrame.new(0,0,-dist/2)
trail.Parent = folder
game:GetService("Debris"):AddItem(trail,2)
return trail    
end
 
local trail = coroutine.create(function()
while true do 
for i=1,20,1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/20,i/20,0)
trail.Transparency = i/20
trail.BrickColor = BrickColor.Random()
end
for i=20,1,-1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/20,i/20,0)
trail.Transparency = i/20
trail.BrickColor = BrickColor.Random()
end
for i=1,10,1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/10,i/10,0)
trail.Transparency = i/10
trail.BrickColor = BrickColor.Random()  
end
for i=10,1,-1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/10,i/10,0)
trail.Transparency = i/10
trail.BrickColor = BrickColor.Random()  
end
end
end)
 
 
coroutine.resume(loop)
coroutine.resume(trail)
