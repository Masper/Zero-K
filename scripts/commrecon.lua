include "constants.lua"

local base = piece 'base' 
local pelvis = piece 'pelvis' 
local turret = piece 'turret' 
local torso = piece 'torso' 
local head = piece 'head' 
local armhold = piece 'armhold' 
local ruparm = piece 'ruparm' 
local rarm = piece 'rarm' 
local rloarm = piece 'rloarm' 
local luparm = piece 'luparm' 
local larm = piece 'larm' 
local lloarm = piece 'lloarm' 
local rupleg = piece 'rupleg' 
local lupleg = piece 'lupleg' 
local lloleg = piece 'lloleg' 
local rloleg = piece 'rloleg' 
local rfoot = piece 'rfoot' 
local lfoot = piece 'lfoot' 
local gun = piece 'gun' 
local flare = piece 'flare' 
local rsword = piece 'rsword' 
local lsword = piece 'lsword' 
local jet1 = piece 'jet1' 
local jet2 = piece 'jet2' 
local jx1 = piece 'jx1' 
local jx2 = piece 'jx2' 
local stab = piece 'stab' 
local nanospray = piece 'nanospray' 
local grenade = piece 'grenade' 


--variables
local dead = false
local bMoving = false
local bAiming = false
local armsFree = true
bJumping = false

local SIG_AIM = 2
local SIG_AIM_2 = 4
--local SIG_AIM_3 = 8 --step on

local function RestoreAfterDelay()
	Sleep(6000)
	if not dead then
		Turn( turret , x_axis, 0, math.rad(150) )
		Turn( turret , y_axis, 0, math.rad(150) )
		--torso	
		Turn( torso , x_axis, 0, math.rad(250) )
		Turn( torso , y_axis, 0, math.rad(250) )
		Turn( torso , z_axis, 0, math.rad(250) )	
		--head	
		Turn( head , x_axis, 0, math.rad(250) )
		Turn( head , y_axis, 0, math.rad(250) )
		Turn( head , z_axis, 0, math.rad(250) )
		
		-- at ease pose
		Turn( armhold , x_axis, math.rad(-45), math.rad(250) ) --upspring at -45
		Turn( ruparm , x_axis, 0, math.rad(250) ) 
		Turn( ruparm , y_axis, 0, math.rad(250) ) 
		Turn( ruparm , z_axis, 0, math.rad(250) ) 
		Turn( rarm , x_axis, math.rad(2), math.rad(250) )      --up 2
		Turn( rarm , y_axis, 0, math.rad(250) )  
		Turn( rarm , z_axis, math.rad(-(-12)), math.rad(250) )    --up -12
		Turn( rloarm , x_axis, math.rad(47), math.rad(250) )   --up 47
		Turn( rloarm , y_axis, math.rad(76), math.rad(250) )   --up 76
		Turn( rloarm , z_axis, math.rad(-(-47)), math.rad(250) )   --up -47
		Turn( luparm , x_axis, math.rad(-9), math.rad(250) )       --up -9
		Turn( luparm , y_axis, 0, math.rad(250) )  
		Turn( luparm , z_axis, 0, math.rad(250) )  
		Turn( larm , x_axis, math.rad(5), math.rad(250) )       --up 5
		Turn( larm , y_axis, math.rad(-3), math.rad(250) )       --up -3
		Turn( larm , z_axis, math.rad(-(22)), math.rad(250) )       --up 22
		Turn( lloarm , x_axis, math.rad(92), math.rad(250) )    -- up 82
		Turn( lloarm , y_axis, 0, math.rad(250) )  
		Turn( lloarm , z_axis, math.rad(-(94)), math.rad(250) )  --upspring 94
		-- done at ease
		Sleep(100)
		bAiming = false
	end
end

local function Walk()
	Turn( torso , x_axis, math.rad(12) ) --tilt forward
	Move( pelvis , y_axis, 0  )
	Turn( rupleg , x_axis, math.rad(5.670330) )
	Turn( lupleg , x_axis, math.rad(-26.467033) )
	Turn( torso , y_axis, math.rad(3.335165) )
	Turn( lloleg , x_axis, math.rad(26.967033) )
	Turn( rloleg , x_axis, math.rad(26.967033) )
	Turn( rfoot , x_axis, math.rad(-19.824176) )
	Sleep(90) --had to + 20 to all sleeps in walk
	
	Turn( rupleg , x_axis, math.rad(-5.269231) )
	Turn( lupleg , x_axis, math.rad(-20.989011) )
	Turn( torso , y_axis, math.rad(1.681319) )
	Turn( lloleg , x_axis, math.rad(20.945055) )
	Turn( rloleg , x_axis, math.rad(41.368132) )
	Turn( rfoot , x_axis, math.rad(-15.747253) )
	Sleep(70)
	
	Turn( rupleg , x_axis, math.rad(-9.071429) )
	Turn( lupleg , x_axis, math.rad(-12.670330) )
	Turn( torso , y_axis, 0 )
	Turn( lloleg , x_axis, math.rad(12.670330) )
	Turn( rloleg , x_axis, math.rad(43.571429) )
	Turn( rfoot , x_axis, math.rad(-12.016484) )
	Sleep(50)
	
	Turn( rupleg , x_axis, math.rad(-21.357143) )
	Turn( lupleg , x_axis, math.rad(2.824176) )
	Turn( torso , y_axis, math.rad(-1.769231) )
	Turn( lloleg , x_axis, math.rad(3.560440) )
	Turn( lfoot , x_axis, math.rad(-4.527473) )
	Turn( rloleg , x_axis, math.rad(52.505495) )
	Turn( rfoot , x_axis, 0 )
	Sleep(40)
	
	Turn( rupleg , x_axis, math.rad(-35.923077) )
	Turn( lupleg , x_axis, math.rad(7.780220) )
	Turn( torso , y_axis, math.rad(-3.148352) )
	Turn( lloleg , x_axis, math.rad(8.203297) )
	Turn( lfoot , x_axis, math.rad(-12.571429) )
	Turn( rloleg , x_axis, math.rad(54.390110) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(-37.780220) )
	Turn( lupleg , x_axis, math.rad(10.137363) )
	Turn( torso , y_axis, math.rad(-4.203297) )
	Turn( lloleg , x_axis, math.rad(13.302198) )
	Turn( lfoot , x_axis, math.rad(-16.714286) )
	Turn( rloleg , x_axis, math.rad(32.582418) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(-28.758242) )
	Turn( lupleg , x_axis, math.rad(12.247253) )
	Turn( torso , y_axis, math.rad(-3.148352) )
	Turn( lloleg , x_axis, math.rad(19.659341) )
	Turn( lfoot , x_axis, math.rad(-19.659341) )
	Turn( rloleg , x_axis, math.rad(28.758242) )
	Sleep(90)

	Turn( rupleg , x_axis, math.rad(-22.824176) )
	Turn( lupleg , x_axis, math.rad(2.824176) )
	Turn( torso , y_axis, math.rad(-1.879121) )
	Turn( lloleg , x_axis, math.rad(34.060440) )
	Turn( rfoot , x_axis, math.rad(-6.313187) )
	Sleep(70)

	Turn( rupleg , x_axis, math.rad(-11.604396) )
	Turn( lupleg , x_axis, math.rad(-6.725275) )
	Turn( torso , y_axis, 0 )
	Turn( lloleg , x_axis, math.rad(39.401099) )
	Turn( lfoot , x_axis, math.rad(-13.956044) )
	Turn( rloleg , x_axis, math.rad(19.005495) )
	Turn( rfoot , x_axis, math.rad(-7.615385) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(1.857143) )
	Turn( lupleg , x_axis, math.rad(-24.357143) )
	Turn( torso , y_axis, math.rad(1.879121) )
	Turn( lloleg , x_axis, math.rad(45.093407) )
	Turn( lfoot , x_axis, math.rad(-7.703297) )
	Turn( rloleg , x_axis, math.rad(3.560440) )
	Turn( rfoot , x_axis, math.rad(-4.934066) )
	Sleep(40)

	Turn( rupleg , x_axis, math.rad(7.148352) )
	Turn( lupleg , x_axis, math.rad(-28.181319) )
	Turn( torso , y_axis, math.rad(3.148352) )
	Turn( rfoot , x_axis, math.rad(-9.813187) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(8.423077) )
	Turn( lupleg , x_axis, math.rad(-32.060440) )
	Turn( torso , y_axis, math.rad(4.203297) )
	Turn( lloleg , x_axis, math.rad(27.527473) )
	Turn( lfoot , x_axis, math.rad(-2.857143) )
	Turn( rloleg , x_axis, math.rad(24.670330) )
	Turn( rfoot , x_axis, math.rad(-33.313187) )
	Sleep(70)
end

local function WalkLegs()
	Move( pelvis , y_axis, 0  )
	Turn( rupleg , x_axis, math.rad(5.670330) )
	Turn( lupleg , x_axis, math.rad(-26.467033) )
	Turn( lloleg , x_axis, math.rad(26.967033) )
	Turn( rloleg , x_axis, math.rad(26.967033) )
	Turn( rfoot , x_axis, math.rad(-19.824176) )
	Sleep(90)

	Turn( rupleg , x_axis, math.rad(-5.269231) )
	Turn( lupleg , x_axis, math.rad(-20.989011) )
	Turn( lloleg , x_axis, math.rad(20.945055) )
	Turn( rloleg , x_axis, math.rad(41.368132) )
	Turn( rfoot , x_axis, math.rad(-15.747253) )
	Sleep(70)

	Turn( rupleg , x_axis, math.rad(-9.071429) )
	Turn( lupleg , x_axis, math.rad(-12.670330) )
	Turn( lloleg , x_axis, math.rad(12.670330) )
	Turn( rloleg , x_axis, math.rad(43.571429) )
	Turn( rfoot , x_axis, math.rad(-12.016484) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(-21.357143) )
	Turn( lupleg , x_axis, math.rad(2.824176) )
	Turn( lloleg , x_axis, math.rad(3.560440) )
	Turn( lfoot , x_axis, math.rad(-4.527473) )
	Turn( rloleg , x_axis, math.rad(52.505495) )
	Turn( rfoot , x_axis, 0 )
	Sleep(40)

	Turn( rupleg , x_axis, math.rad(-35.923077) )
	Turn( lupleg , x_axis, math.rad(7.780220) )
	Turn( lloleg , x_axis, math.rad(8.203297) )
	Turn( lfoot , x_axis, math.rad(-12.571429) )
	Turn( rloleg , x_axis, math.rad(54.390110) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(-37.780220) )
	Turn( lupleg , x_axis, math.rad(10.137363) )
	Turn( lloleg , x_axis, math.rad(13.302198) )
	Turn( lfoot , x_axis, math.rad(-16.714286) )
	Turn( rloleg , x_axis, math.rad(32.582418) )
	Sleep(70)

	Turn( rupleg , x_axis, math.rad(-28.758242) )
	Turn( lupleg , x_axis, math.rad(12.247253) )
	Turn( lloleg , x_axis, math.rad(19.659341) )
	Turn( lfoot , x_axis, math.rad(-19.659341) )
	Turn( rloleg , x_axis, math.rad(28.758242) )
	Sleep(90)

	Turn( rupleg , x_axis, math.rad(-22.824176) )
	Turn( lupleg , x_axis, math.rad(2.824176) )
	Turn( lloleg , x_axis, math.rad(34.060440) )
	Turn( rfoot , x_axis, math.rad(-6.313187) )
	Sleep(70)

	Turn( rupleg , x_axis, math.rad(-11.604396) )
	Turn( lupleg , x_axis, math.rad(-6.725275) )
	Turn( lloleg , x_axis, math.rad(39.401099) )
	Turn( lfoot , x_axis, math.rad(-13.956044) )
	Turn( rloleg , x_axis, math.rad(19.005495) )
	Turn( rfoot , x_axis, math.rad(-7.615385) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(1.857143) )
	Turn( lupleg , x_axis, math.rad(-24.357143) )
	Turn( lloleg , x_axis, math.rad(45.093407) )
	Turn( lfoot , x_axis, math.rad(-7.703297) )
	Turn( rloleg , x_axis, math.rad(3.560440) )
	Turn( rfoot , x_axis, math.rad(-4.934066) )
	Sleep(40)

	Turn( rupleg , x_axis, math.rad(7.148352) )
	Turn( lupleg , x_axis, math.rad(-28.181319) )
	Turn( rfoot , x_axis, math.rad(-9.813187) )
	Sleep(50)

	Turn( rupleg , x_axis, math.rad(8.423077) )
	Turn( lupleg , x_axis, math.rad(-32.060440) )
	Turn( lloleg , x_axis, math.rad(27.527473) )
	Turn( lfoot , x_axis, math.rad(-2.857143) )
	Turn( rloleg , x_axis, math.rad(24.670330) )
	Turn( rfoot , x_axis, math.rad(-33.313187) )
	Sleep(70)
end


local function MotionControl(moving, aiming, justmoved)
	justmoved = true
	while true  do
		moving = bMoving
		aiming = bAiming
		if moving  then
			if aiming  then
				armsFree = true
				WalkLegs()
			else
				armsFree = false
				Walk()
			end
			justmoved = true
		else
			armsFree = true
			if justmoved  then
				Turn( rupleg , x_axis, 0, math.rad(200.071429) )
				Turn( rloleg , x_axis, 0, math.rad(200.071429) )
				Turn( rfoot , x_axis, 0, math.rad(200.071429) )
				Turn( lupleg , x_axis, 0, math.rad(200.071429) )
				Turn( lloleg , x_axis, 0, math.rad(200.071429) )
				Turn( lfoot , x_axis, 0, math.rad(200.071429) )
				if  not aiming  then
					Turn( torso , x_axis, 0 ) --untilt forward
					Turn( torso , y_axis, 0, math.rad(90.027473) )
					Turn( ruparm , x_axis, 0, math.rad(200.071429) )
--					Turn( luparm , x_axis, 0, math.rad(200.071429) )
				end
				justmoved = false
			end
			Sleep(100)
		end
	end
end

function script.Create()
	--alert to dirt
	Turn( armhold , x_axis, math.rad(-45), math.rad(250) ) --upspring at -45
	Turn( ruparm , x_axis, 0, math.rad(250) ) 
	Turn( ruparm , y_axis, 0, math.rad(250) ) 
	Turn( ruparm , z_axis, 0, math.rad(250) ) 
	Turn( rarm , x_axis, math.rad(2), math.rad(250) )      --up 2
	Turn( rarm , y_axis, 0, math.rad(250) )  
	Turn( rarm , z_axis, math.rad(-(-12)), math.rad(250) )    --up -12
	Turn( rloarm , x_axis, math.rad(47), math.rad(250) )   --up 47
	Turn( rloarm , y_axis, math.rad(76), math.rad(250) )   --up 76
	Turn( rloarm , z_axis, math.rad(-(-47)), math.rad(250) )   --up -47
	Turn( luparm , x_axis, math.rad(-9), math.rad(250) )       --up -9
	Turn( luparm , y_axis, 0, math.rad(250) )  
	Turn( luparm , z_axis, 0, math.rad(250) )  
	Turn( larm , x_axis, math.rad(5), math.rad(250) )       --up 5
	Turn( larm , y_axis, math.rad(-3), math.rad(250) )       --up -3
	Turn( larm , z_axis, math.rad(-(22)), math.rad(250) )       --up 22
	Turn( lloarm , x_axis, math.rad(92), math.rad(250) )    -- up 82
	Turn( lloarm , y_axis, 0, math.rad(250) )  
	Turn( lloarm , z_axis, math.rad(-(94)), math.rad(250) )  --upspring 94

	Hide( flare)
	Hide( jx1)
	Hide( jx2)
	Hide( grenade)

	StartThread(MotionControl)
	StartThread(RestoreAfterDelay)
end

function script.StartMoving()
	bMoving = true
end

function script.StopMoving()
	bMoving = false
end

function script.AimFromWeapon(num)
	return armhold
end

local function AimRifle(heading, pitch)
	while not armsFree do
		Sleep(33)  --smooth animation?
	end
	--torso	
	Turn( torso , x_axis, math.rad(15), math.rad(250) )
	Turn( torso , y_axis, math.rad(-25), math.rad(250) )
	Turn( torso , z_axis, 0, math.rad(250) )	
	--head	
	Turn( head , x_axis, math.rad(-15), math.rad(250) )
	Turn( head , y_axis, math.rad(25), math.rad(250) )
	Turn( head , z_axis, 0, math.rad(250) )	
	--rarm	
	Turn( ruparm , x_axis, math.rad(-83), math.rad(250) )
	Turn( ruparm , y_axis, math.rad(30), math.rad(250) )
	Turn( ruparm , z_axis, math.rad(-(10)), math.rad(250) )
	
	Turn( rarm , x_axis, math.rad(41), math.rad(250) )
	Turn( rarm , y_axis, math.rad(19), math.rad(250) )
	Turn( rarm , z_axis, math.rad(-(-3)), math.rad(250) )
	
	Turn( rloarm , x_axis, math.rad(18), math.rad(250) )
	Turn( rloarm , y_axis, math.rad(19), math.rad(250) )
	Turn( rloarm , z_axis, math.rad(-(14)), math.rad(250) )
	
	Turn( gun , x_axis, math.rad(15.0), math.rad(250) )
	Turn( gun , y_axis, math.rad(-15.0), math.rad(250) )
	Turn( gun , z_axis, math.rad(31), math.rad(250) )
	--larm
	Turn( luparm , x_axis, math.rad(-80), math.rad(250) )
	Turn( luparm , y_axis, math.rad(-15), math.rad(250) )
	Turn( luparm , z_axis, math.rad(-10), math.rad(250) )
	
	Turn( larm , x_axis, math.rad(5), math.rad(250) )
	Turn( larm , y_axis, math.rad(-77), math.rad(250) )
	Turn( larm , z_axis, math.rad(-(-26)), math.rad(250) )
	
	Turn( lloarm , x_axis, math.rad(65), math.rad(250) )
	Turn( lloarm , y_axis, math.rad(-37), math.rad(250) )
	Turn( lloarm , z_axis, math.rad(-152), math.rad(450) )
	WaitForTurn(ruparm, x_axis)
	
	Turn( turret , y_axis, heading, math.rad(350) )
	Turn( armhold , x_axis, - pitch, math.rad(250) )
	WaitForTurn(turret, y_axis)
	WaitForTurn(armhold, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.AimWeapon(num, heading, pitch)
	if num >= 4 then
		Signal( SIG_AIM)
		SetSignalMask( SIG_AIM)
		bAiming = true
		return AimRifle(heading, pitch)
	elseif num == 3 then
		Signal( SIG_AIM)
		Signal( SIG_AIM_2)
		SetSignalMask( SIG_AIM_2)
		bAiming = true
		return AimRifle(heading, pitch)
	end
end

function script.QueryWeapon(num)
	if num == 3 then return grenade end
	return flare
end

function script.FireWeapon(num)
	if num == 3 then
		EmitSfx( grenade, 1026 )
		EmitSfx( grenade, 1027 )
	elseif num == 5 then
		EmitSfx( flare, 1024)
		EmitSfx( flare, 1025)
	end
end

local function JumpExhaust()
	while bJumping do 
		EmitSfx( jx1,  1028 )
		EmitSfx( jx2,  1028 )
		Sleep(33)
	end
end

function preJump(turn, distance)
end

function beginJump() 
	bJumping = true
	StartThread(JumpExhaust)
end

function jumping()
end

function halfJump()
end

function endJump() 
	bJumping = false
	EmitSfx( base,  1029 )
end

function script.StopBuilding()
	SetUnitValue(COB.INBUILDSTANCE, 0)
	if not bAiming then
		StartThread(RestoreAfterDelay)
	end
end

function script.StartBuilding(heading, pitch) 
	--larm
	Turn( luparm , x_axis, math.rad(-60), math.rad(250) )
	Turn( luparm , y_axis, math.rad(-15), math.rad(250) )
	Turn( luparm , z_axis, math.rad(-(10)), math.rad(250) )
	
	Turn( larm , x_axis, math.rad(5), math.rad(250) )
	Turn( larm , y_axis, math.rad(-30), math.rad(250) )
	Turn( larm , z_axis, math.rad(-(-26)), math.rad(250) )
	
	Turn( lloarm , y_axis, math.rad(-37), math.rad(250) )
	Turn( lloarm , z_axis, math.rad(-(152)), math.rad(450) )

	Turn( turret , y_axis, math.rad(heading ), math.rad(350) )
	Turn( lloarm , x_axis, -pitch, math.rad(250) )
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.QueryNanoPiece()
	GG.LUPS.QueryNanoPiece(unitID,unitDefID,Spring.GetUnitTeam(unitID),nanospray)
	return nanospray
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	dead = true
--	Turn( turret , y_axis, 0, math.rad(500) )
	if  severity <= .5  then
		Turn( base , x_axis, math.rad(80), math.rad(80) )
		Turn( turret , x_axis, math.rad(-16), math.rad(50) )
		Turn( turret , y_axis, 0, math.rad(90) )
		Turn( rloleg , x_axis, math.rad(9), math.rad(250) )	
		Turn( rloleg , y_axis, math.rad(-73), math.rad(250) )	
		Turn( rloleg , z_axis, math.rad(-(3)), math.rad(250) )	
		Turn( lupleg , x_axis, math.rad(7), math.rad(250) )	
		Turn( lloleg , y_axis, math.rad(21), math.rad(250) )	
		Turn( lfoot , x_axis, math.rad(24), math.rad(250) )	
		Sleep(200) --give time to fall
		Turn( ruparm , x_axis, math.rad(-48), math.rad(350) )	
		Turn( ruparm , y_axis, math.rad(32), math.rad(350) )  --was -32
		Turn( luparm , x_axis, math.rad(-50), math.rad(350) )	
		Turn( luparm , y_axis, math.rad(47), math.rad(350) )	
		Turn( luparm , z_axis, math.rad(-(50)), math.rad(350) )
		Sleep(600)
		EmitSfx( turret,  1027 ) --impact
		--StartThread(burn)
    	--Sleep((1000 * rand (2 , 5))) 
		Sleep(100)
		return 1
	else
		Explode(gun, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(head, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(pelvis, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(lloarm, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(luparm, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(lloleg, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(lupleg, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(rloarm, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(rloleg, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(ruparm, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(rupleg, sfxFall + sfxFire  + sfxSmoke  + sfxExplode )
		Explode(torso, sfxShatter + sfxExplode )
		return 2
	end
end

