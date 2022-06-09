-- Components
local PointsLinkSetter = require(script.PointsLinkSetter)

local PortalService = {
	OnTouch = "OnTouch"
} 
PortalService.__index = PortalService

local Portals = {}

function PortalService.new(pointA, pointB)
	local self = setmetatable({}, PortalService)
	
	self.Name = pointA.Name.."_"..pointB.Name.."_Portal"
	self.EntryPoint = pointA
	self.ExitPoint = pointB
	return self
end

function PortalService:LinkPointsOnTouch()
	PointsLinkSetter.LinkPoints(self.EntryPoint, self.ExitPoint )
end


function PortalService:LinkPointsOnTouchWithOffset(entryOffset, exitOffset)
	PointsLinkSetter.LinkPoints(self.EntryPoint, self.ExitPoint, entryOffset, exitOffset )
end

return PortalService