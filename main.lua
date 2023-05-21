local player = game.Players.LocalPlayer
local roblox_mouse = player:GetMouse()
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera

roblox_mouse.TargetFilter = workspace

local Mouse = {raycastParams = RaycastParams.new(), Hit = CFrame.new(0, 0, 0), Target = nil, Button1Down = roblox_mouse.Button1Down, Button2Down = roblox_mouse.Button2Down, Button1Up = roblox_mouse.Button1Up, Button2Up = roblox_mouse.Button2Up}; do
	function Mouse:SetRaycastParams(raycastParams: RaycastParams)
		Mouse.raycastParams = raycastParams
	end

	task.spawn(function()
		while true do
			task.wait()
			pcall(function()
				local hit = roblox_mouse.Hit.Position
				local ray = workspace:Raycast(camera.CFrame.Position, (hit - camera.CFrame.Position).Unit * 500, Mouse.raycastParams)
				local rayPos = (ray and ray.Position) or hit
				Mouse.Hit = CFrame.new(ray.Position)
				Mouse.Target = (ray and ray.Instance) or nil
			end)
		end
	end)
end

return Mouse
