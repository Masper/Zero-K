unitDef = {
  unitname               = [[spherepole]],
  name                   = [[Scythe]],
  description            = [[Stealth Raider Bot]],
  acceleration           = 0.36,
  bmcode                 = [[1]],
  brakeRate              = 0.205,
  buildCostEnergy        = 250,
  buildCostMetal         = 250,
  builder                = false,
  buildPic               = [[spherepole.png]],
  buildTime              = 250,
  canAttack              = true,
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  canstop                = [[1]],
  category               = [[LAND]],
  cloakCost              = 0.2,
  cloakCostMoving        = 1,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[36 46 36]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[ellipsoid]],
  corpse                 = [[DEAD]],

  customParams           = {
    description_bp = [[Robô agressor]],
    description_es = [[Robot de invasi?n]],
    description_fi = [[Hy?kk??j?robotti]],
    description_fr = [[Robot Pilleur]],
    description_it = [[Robot d'invasione]],
    description_pl = [[Bot Naje?d?ca]],
    helptext       = [[The Scythe isn't particularly tough in a stand-up fight, but its cloaking device lets it slip past enemy defenses to stab at the enemy's economy.]],
  },

  defaultmissiontype     = [[Standby]],
  explodeAs              = [[SMALL_UNITEX]],
  footprintX             = 2,
  footprintZ             = 2,
  iconType               = [[stealth]],
  idleAutoHeal           = 20,
  idleTime               = 300,
  initCloaked            = true,
  leaveTracks            = true,
  maneuverleashlength    = [[640]],
  mass                   = 169,
  maxDamage              = 800,
  maxSlope               = 36,
  maxVelocity            = 3,
  maxWaterDepth          = 22,
  minCloakDistance       = 75,
  movementClass          = [[KBOT2]],
  moveState              = 0,
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM FIXEDWING SATELLITE SUB]],
  objectName             = [[spherepole.s3o]],
  seismicSignature       = 4,
  selfDestructAs         = [[SMALL_UNITEX]],

  sfxtypes               = {

    explosiongenerators = {
      [[custom:emg_shells_l]],
      [[custom:flashmuzzle1]],
    },

  },

  side                   = [[ARM]],
  sightDistance          = 425,
  smoothAnim             = true,
  stealth                = true,
  steeringmode           = [[2]],
  TEDClass               = [[KBOT]],
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[ComTrack]],
  trackWidth             = 18,
  turninplace            = 0,
  turnRate               = 1250,
  upright                = true,
  workerTime             = 0,

  weapons                = {

    {
      def                = [[Blade]],
      onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER GUNSHIP FIXEDWING]],
    },

  },


  weaponDefs             = {

    Blade = {
      name                    = [[Blade]],
      areaOfEffect            = 8,
      beamTime                = 0.13,
      beamWeapon              = true,
      canattackground         = true,
      cegTag                  = [[orangelaser]],
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 200,
        planes  = 200,
        subs    = 15,
      },

      explosionGenerator      = [[custom:BEAMWEAPON_HIT_ORANGE]],
      fireStarter             = 90,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 0,
      lineOfSight             = true,
      lodDistance             = 10000,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 100,
      reloadtime              = 1.4,
      renderType              = 0,
      rgbColor                = [[1 0.25 0]],
      soundHit                = [[explosion/ex_large7]],
      targetborder            = 1,
      targetMoveError         = 0.2,
      thickness               = 0,
      tolerance               = 10000,
      turret                  = true,
      waterweapon             = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 2000,
    },

  },


  featureDefs            = {

    DEAD  = {
      description      = [[Wreckage - Scythe]],
      blocking         = false,
      category         = [[corpses]],
      damage           = 800,
      energy           = 0,
      featureDead      = [[DEAD2]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[40]],
      hitdensity       = [[100]],
      metal            = 100,
      object           = [[spherebot_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 100,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Scythe]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 800,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 100,
      object           = [[debris2x2b.s3o]],
      reclaimable      = true,
      reclaimTime      = 100,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Scythe]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 800,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 50,
      object           = [[debris2x2b.s3o]],
      reclaimable      = true,
      reclaimTime      = 50,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ spherepole = unitDef })
