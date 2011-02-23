unitDef = {
  unitname               = [[shieldarty]],
  name                   = [[Racketeer]],
  description            = [[EMP Artillery]],
  acceleration           = 0.12,
  bmcode                 = [[1]],
  brakeRate              = 0.2,
  buildCostEnergy        = 400,
  buildCostMetal         = 400,
  builder                = false,
  buildPic               = [[SHIELDARTY.png]],
  buildTime              = 400,
  canAttack              = true,
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  canstop                = [[1]],
  category               = [[LAND]],
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[40 56 40]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[ellipsoid]],
  corpse                 = [[DEAD]],

  customParams           = {
  },

  defaultmissiontype     = [[Standby]],
  explodeAs              = [[BIG_UNITEX]],
  footprintX             = 2,
  footprintZ             = 2,
  iconType               = [[walkerlrarty]],
  idleAutoHeal           = 5,
  idleTime               = 1800,
  leaveTracks            = true,
  maneuverleashlength    = [[640]],
  mass                   = 248,
  maxDamage              = 950,
  maxSlope               = 36,
  maxVelocity            = 1.8,
  maxWaterDepth          = 22,
  minCloakDistance       = 75,
  modelCenterOffset      = [[0 0 0]],
  movementClass          = [[KBOT2]],
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM FIXEDWING SATELLITE SUB GUNSHIP ]],
  objectName             = [[dominator.s3o]],
  script                 = [[shieldarty.lua]],
  seismicSignature       = 4,
  selfDestructAs         = [[BIG_UNITEX]],

  sfxtypes               = {

    explosiongenerators = {
      [[custom:STORMMUZZLE]],
      [[custom:STORMBACK]],
    },

  },

  side                   = [[ARM]],
  sightDistance          = 325,
  smoothAnim             = true,
  steeringmode           = [[2]],
  TEDClass               = [[KBOT]],
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[ComTrack]],
  trackWidth             = 22,
  turninplace            = 0,
  turnRate               = 800,
  upright                = true,
  workerTime             = 0,

  weapons                = {

    {
      def                = [[EMP_ROCKET]],
      badTargetCategory  = [[SWIM LAND SHIP HOVER]],
      onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER]],
    },

  },


  weaponDefs             = {
	EMP_ROCKET = {
      name                    = [[EMP Cruise Missile]],
      areaOfEffect            = 16,
      cegTag                  = [[raventrail]],
      collideFriendly         = false,
      craterBoost             = 1,
      craterMult              = 2,

      damage                  = {
        default        = 1200,
        commanders     = 120,
        empresistant75 = 300,
        empresistant99 = 12,
        planes         = 1200,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:YELLOW_LIGHTNINGPLOSION]],
      fireStarter             = 100,
      flighttime              = 10,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      lineOfSight             = true,
      metalpershot            = 0,
      model                   = [[wep_merl.s3o]],
      noautorange             = [[1]],
      noSelfDamage            = true,
	  paralyzer               = true,
      paralyzeTime            = 8,
      range                   = 940,
      reloadtime              = 5,
      renderType              = 1,
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = false,
      soundHit                = [[weapon/missile/vlaunch_emp_hit]],
      soundStart              = [[weapon/missile/missile_launch_high]],
      startsmoke              = [[1]],
      tolerance               = 4000,
      twoPhase                = true,
      vlaunch                 = true,
      weaponAcceleration      = 300,
      weaponTimer             = 1.6,
      weaponType              = [[StarburstLauncher]],
      weaponVelocity          = 7000,
    },
  },


  featureDefs            = {

    DEAD  = {
      description      = [[Wreckage - Racketeeer]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 950,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 160,
      object           = [[wreck2x2b.s3o]],
      reclaimable      = true,
      reclaimTime      = 160,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

    HEAP  = {
      description      = [[Debris - Racketeeer]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 950,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 80,
      object           = [[debris2x2c.s3o]],
      reclaimable      = true,
      reclaimTime      = 80,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ shieldarty = unitDef })
