local PortalService = require(game.ReplicatedStorage.PortalService)

local pA = workspace.PA
local pB = workspace.PB


-- Test Runner
local new = PortalService.new(pA, pB)
new:LinkPointsOnTouch()

wait(10)
new:UnlinkPoints()
