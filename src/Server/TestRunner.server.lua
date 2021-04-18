local PortalService = require(game.ReplicatedStorage.PortalService)

local pA = workspace.PA
local pB = workspace.PB
local pC = workspace.PC

local points = {pB, pC}

-- Test Runner
local new = PortalService.new(pA, pB)
local new2 = PortalService.new(pA,pC)
new:LinkPointsOnTouch()
new2:LinkPointsOnTouch()

