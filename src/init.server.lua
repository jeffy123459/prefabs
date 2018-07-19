local resources = script:FindFirstChild("resources")

local Constants = require(resources:FindFirstChild("Constants"))
local prefabs = require(script.prefabs)(plugin)

local mouse = plugin:GetMouse()
local toolbar = plugin:CreateToolbar(Constants.Names.TOOLBAR)
local button = toolbar:CreateButton(
  Constants.Names.TOGGLE_BUTTON_TITLE,
  Constants.Names.TOGGLE_BUTTON_TOOLTIP,
  Constants.Images.TOOGLE_BUTTON_ICON
)

button.Click:Connect(prefabs.refresh)
mouse.Move:Connect(prefabs.onMouseMove)
mouse.Button1Up:Connect(prefabs.onMouseClick)

-- Expose the prefab API to _G for easy command line access.
_G.prefabs = prefabs
