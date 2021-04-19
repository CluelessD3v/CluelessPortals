-- Components
local PointsLinkSetter = require(script.PointsLinkSetter)

local PortalService = {
	OnTouch = "OnTouch"
} 
PortalService.__index = PortalService

local Portals = {}

function PortalService.new(pointA, pointB, type)
	local self = setmetatable({}, PortalService)
	
	self.Name = pointA.Name.."_"..pointB.Name.."_Portal"
	self.EntryPoint = pointA
	self.ExitPoint = pointB
	return self
end

function PortalService:LinkPointsOnTouch()
	PointsLinkSetter.LinkPoints(self.EntryPoint, self.ExitPoint )
	Portals[self.Name] = self 
end


function PortalService:SetPointsOffset(entryOffset, exitOffset)
	PointsLinkSetter.LinkPoints(self.EntryPoint, self.ExitPoint, entryOffset, exitOffset )
end



return PortalService