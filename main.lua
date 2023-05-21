local player = game.Players.LocalPlayer
local roblox_mouse = player:GetMouse()
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera

roblox_mouse.TargetFilter = workspace

local Mouse = {raycastParams = RaycastParams, Hit = CFrame.new(0, 0, 0), Target = nil}; do
	function Mouse:SetRaycastParams(raycastParams: RaycastParams)
		Mouse.raycastParams = raycastParams
	end

	task.spawn(function()
		while true do
			runService.RenderStepped:Wait()
			local hit = roblox_mouse.Hit.Position
			local ray = workspace:Raycast(camera.CFrame.Position, (hit - camera.CFrame.Position).Unit * 500, Mouse.raycastParams)
			local rayPos = (ray and ray.Position) or hit
			Mouse.Hit = CFrame.new(ray.Position)
			Mouse.Target = (ray and ray.Instance) or nil
		end
	end)
end

return Mouse
