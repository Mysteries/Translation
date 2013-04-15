local resultDesInfos = {}
setmetatable(resultDesInfos, {__mode = "v"})
function GetTimeLimitInfo(EFST_ID)
   local key = EFST_ID .. "-haveTimeLimit"
   local timeInfo = resultDesInfos[key]
   if timeInfo == nil then
      timeInfo = {0, 0}
      if StateIconList ~= nil then
         obj = StateIconList[EFST_ID]
         if obj ~= nil then
            haveTimeLimit = obj.haveTimeLimit
            if haveTimeLimit == nil then
               haveTimeLimit = 0
            end
            posTimeLimitStr = obj.posTimeLimitStr
            if posTimeLimitStr == nil then
               posTimeLimitStr = 0
            end
            timeInfo = {haveTimeLimit, posTimeLimitStr}
            resultDesInfos[key] = timeInfo
         end
      end
   end
   return timeInfo[1], timeInfo[2]
end
function SetDefaultDesInfo(des, r, g, b)
   if des == nil then
      des = ""
   end
   if r == nil then
      r = 255
   end
   if g == nil then
      g = 255
   end
   if b == nil then
      b = 255
   end
  return {
    des,
    r,
    g,
    b
  }
end
local defaultInfo = SetDefaultDesInfo
function GetStateIconDescript(EFST_ID, idx)
   local key = EFST_ID .. "-" .. idx
   local desInfo = resultDesInfos[key]
   if desInfo == nil then
    desInfo = {
      "",
      255,
      255,
      255
    }
      if StateIconList ~= nil and StateIconList[EFST_ID] ~= nil then
         v = StateIconList[EFST_ID].descript
         if v ~= nil and v[idx] ~= nil then
            if v[idx][2] ~= nil then
               desInfo = defaultInfo(v[idx][1], v[idx][2][1], v[idx][2][2], v[idx][2][3])
            else
               desInfo = defaultInfo(v[idx][1], nil, nil, nil)
            end
            resultDesInfos[key] = desInfo
         end
      end
   end
   return desInfo[1], desInfo[2], desInfo[3], desInfo[4]
end
function MakeBuffIconInfoFile()
   makeFile = io.open("data\\StateIconInfo_n.lua", "w")
   if makeFile ~= nil then
    makeFile:write([[
StateIconList = {}

]])
      for k, v in pairs(EFST_IDs) do
      filename, msg = c_GetEFSTMsg(v)
         if filename ~= "" and filename ~= nil then
            makeFile:write(string.format("-- %d, %s\n", v, filename))
            makeFile:write(string.format("StateIconList[EFST_IDs.%s] =\n", k))
            makeFile:write("{\n")
            makeFile:write("\tdescript = \n")
            makeFile:write("\t{\n")
            if msg ~= "" and msg ~= nil then
               makeFile:write(string.format("\t\t{ \"%s\", },\n", msg))
            end
            makeFile:write("\t}\n")
        makeFile:write([[
}

]])
         end
      end
   end
   io.close(makeFile)
end
function GetStrEFSTID(EFSTID)
   for j, k in pairs(EFST_IDs) do
      if k == EFSTID then
         return j
      end
   end
   return ""
end
function GetEFSTID(EFSTID)
   if EFSTID ~= 0 then
      local efst = EFST_IDs[EFSTID]
      if efst ~= nil then
         return efst
      end
   end
   return 0
end
function GetEFSTImgFileName(EFSTID, priority)
   if StateIconImgList ~= nil then
      local obj = StateIconImgList[priority]
      if obj ~= nil then
         local fileName = obj[EFSTID]
         if fileName ~= nil then
            return "effect\\" .. fileName
         end
      end
   end
   return ""
end
HaveEfstImgTable = {
	EFST_IDs.EFST_ADORAMUS,
	EFST_IDs.EFST_DEC_AGI,
	EFST_IDs.EFST_BROKENARMOR,
	EFST_IDs.EFST_ILLUSION,
	EFST_IDs.EFST_QUAGMIRE,
	EFST_IDs.EFST_BROKENWEAPON,
	EFST_IDs.EFST_WEIGHTOVER50,
	EFST_IDs.EFST_WEIGHTOVER90,
	EFST_IDs.EFST_NOEQUIPWEAPON,
	EFST_IDs.EFST_NOEQUIPSHIELD,
	EFST_IDs.EFST_NOEQUIPARMOR,
	EFST_IDs.EFST_NOEQUIPHELM,
	EFST_IDs.EFST_PROPERTYFIRE,
	EFST_IDs.EFST_STATUSONE,
	EFST_IDs.EFST_PARTYFLEE,
	EFST_IDs.EFST_TARGET_ASPD,
	EFST_IDs.EFST_FOOD_INT,
	EFST_IDs.EFST_FOOD_INT_CASH,
	EFST_IDs.EFST_COCKTAIL_WARG_BLOOD,
	EFST_IDs.EFST_FOOD_STR,
	EFST_IDs.EFST_FOOD_STR_CASH,
	EFST_IDs.EFST_SAVAGE_STEAK,
	EFST_IDs.EFST_FOOD_AGI,
	EFST_IDs.EFST_FOOD_AGI_CASH,
	EFST_IDs.EFST_DROCERA_HERB_STEAMED,
	EFST_IDs.EFST_FOOD_VIT,
	EFST_IDs.EFST_FOOD_VIT_CASH,
	EFST_IDs.EFST_MINOR_BBQ,
	EFST_IDs.EFST_FOOD_DEX,
	EFST_IDs.EFST_FOOD_DEX_CASH,
	EFST_IDs.EFST_SIROMA_ICE_TEA,
	EFST_IDs.EFST_FOOD_LUK,
	EFST_IDs.EFST_FOOD_LUK_CASH,
	EFST_IDs.EFST_PUTTI_TAILS_NOODLES,
	EFST_IDs.EFST_FOOD_BASICAVOIDANCE,
	EFST_IDs.EFST_FOOD_BASICHIT,
	EFST_IDs.EFST_FOOD_CRITICALSUCCESSVALUE,
	EFST_IDs.EFST_STOMACHACHE,
	EFST_IDs.EFST_CASH_PLUSEXP,
	EFST_IDs.EFST_CASH_DEATHPENALTY,
	EFST_IDs.EFST_CASH_RECEIVEITEM,
	EFST_IDs.EFST_CASH_PLUSONLYJOBEXP,
	EFST_IDs.EFST_REWARD_PLUSONLYJOBEXP,
	EFST_IDs.EFST_MACRO_POSTDELAY,
	EFST_IDs.EFST_MONSTER_TRANSFORM,
	EFST_IDs.EFST_HANDICAPSTATE_NORECOVER,
	EFST_IDs.EFST_ENDURE,
	EFST_IDs.EFST_ENCHANTPOISON,
	EFST_IDs.EFST_CLOAKING,
	EFST_IDs.EFST_TWOHANDQUICKEN,
	EFST_IDs.EFST_MAXIMIZE,
	EFST_IDs.EFST_ADRENALINE,
	EFST_IDs.EFST_ADRENALINE2,
	EFST_IDs.EFST_POISONREACT,
	EFST_IDs.EFST_AUTOGUARD,
	EFST_IDs.EFST_AUTOSPELL,
	EFST_IDs.EFST_PROVOKE,
	EFST_IDs.EFST_OVERTHRUST,
	EFST_IDs.EFST_WEAPONPERFECT,
	EFST_IDs.EFST_HIDING,
	EFST_IDs.EFST_SPEARQUICKEN,
	EFST_IDs.EFST_DEFENDER,
	EFST_IDs.EFST_REFLECTSHIELD,
	EFST_IDs.EFST_PROPERTYWATER,
	EFST_IDs.EFST_PROPERTYWIND,
	EFST_IDs.EFST_BLOODING,
	EFST_IDs.EFST_JOINTBEAT,
	EFST_IDs.EFST_PROTECTEXP,
	EFST_IDs.EFST_ANGEL_PROTECT,
	EFST_IDs.EFST_PARRYING,
	EFST_IDs.EFST_TENSIONRELAX,
	EFST_IDs.EFST_SKF_CAST,
	EFST_IDs.EFST_SKF_ASPD,
	EFST_IDs.EFST_SKF_ATK,
	EFST_IDs.EFST_SKF_MATK,
	EFST_IDs.EFST_ASSUMPTIO,
	EFST_IDs.EFST_ASSUMPTIO2,
	EFST_IDs.EFST_POPECOOKIE,
	EFST_IDs.EFST_VITALIZE_POTION,
	EFST_IDs.EFST_TRUESIGHT,
	EFST_IDs.EFST_WINDWALK,
	EFST_IDs.EFST_CARTBOOST,
	EFST_IDs.EFST_MELTDOWN,
	EFST_IDs.EFST_SWORDREJECT,
	EFST_IDs.EFST_MARIONETTE_MASTER,
	EFST_IDs.EFST_MARIONETTE,
	EFST_IDs.EFST_AUTOBERSERK,
	EFST_IDs.EFST_STORMKICK_ON,
	EFST_IDs.EFST_DOWNKICK_ON,
	EFST_IDs.EFST_TURNKICK_ON,
	EFST_IDs.EFST_COUNTER_ON,
	EFST_IDs.EFST_DODGE_ON,
	EFST_IDs.EFST_STRUP,
	EFST_IDs.EFST_PROPERTYDARK,
	EFST_IDs.EFST_PROPERTYTELEKINESIS,
	EFST_IDs.EFST_EDP,
	EFST_IDs.EFST_PRESERVE,
	EFST_IDs.EFST_CHASEWALK2,
	EFST_IDs.EFST_GROUNDMAGIC,
	EFST_IDs.EFST_DOUBLECASTING,
	EFST_IDs.EFST_MAGIC_CANDY,
	EFST_IDs.EFST_OVERTHRUSTMAX,
	EFST_IDs.EFST_TAROTCARD,
	EFST_IDs.EFST_MORA_BUFF,
	EFST_IDs.EFST_ODINS_POWER,
	EFST_IDs.EFST_MOON_COMFORT,
	EFST_IDs.EFST_STAR_COMFORT,
	EFST_IDs.EFST_KAIZEL,
	EFST_IDs.EFST_KAAHI,
	EFST_IDs.EFST_KAUPE,
	EFST_IDs.EFST_ONEHANDQUICKEN,
	EFST_IDs.EFST_CR_SHRINK,
	EFST_IDs.EFST_WZ_SIGHTBLASTER,
	EFST_IDs.EFST_RG_CCONFINE_M,
	EFST_IDs.EFST_EARTHSCROLL,
	EFST_IDs.EFST_NJ_BUNSINJYUTSU,
	EFST_IDs.EFST_NJ_UTSUSEMI,
	EFST_IDs.EFST_NJ_NEN,
	EFST_IDs.EFST_GS_ADJUSTMENT,
	EFST_IDs.EFST_GS_ACCURACY,
	EFST_IDs.EFST_GS_MADNESSCANCEL,
	EFST_IDs.EFST_GS_GATLINGFEVER,
	EFST_IDs.EFST_ATKER_BLOOD,
	EFST_IDs.EFST_TARGET_BLOOD,
	EFST_IDs.EFST_PET,
	EFST_IDs.EFST_MENTAL,
	EFST_IDs.EFST_EXPMEMORY,
	EFST_IDs.EFST_PERFORMANCE,
	EFST_IDs.EFST_GAIN,
	EFST_IDs.EFST_GRIFFON,
	EFST_IDs.EFST_DRIFT,
	EFST_IDs.EFST_PROPERTYUNDEAD,
	EFST_IDs.EFST_WALLSHIFT,
	EFST_IDs.EFST_REINCARNATION,
	EFST_IDs.EFST_PATTACK,
	EFST_IDs.EFST_PSPEED,
	EFST_IDs.EFST_PDEFENSE,
	EFST_IDs.EFST_PCRITICAL,
	EFST_IDs.EFST_RANKING,
	EFST_IDs.EFST_PTRIPLE,
	EFST_IDs.EFST_DENERGY,
	EFST_IDs.EFST_WAVE1,
	EFST_IDs.EFST_WAVE2,
	EFST_IDs.EFST_WAVE3,
	EFST_IDs.EFST_WAVE4,
	EFST_IDs.EFST_DAURA,
	EFST_IDs.EFST_DFREEZER,
	EFST_IDs.EFST_DPUNISH,
	EFST_IDs.EFST_DBARRIER,
	EFST_IDs.EFST_DWARNING,
	EFST_IDs.EFST_DACCEL,
	EFST_IDs.EFST_DBLOCK,
	EFST_IDs.EFST_DA_ENERGY,
	EFST_IDs.EFST_DA_BLACK,
	EFST_IDs.EFST_DA_MAGICCART,
	EFST_IDs.EFST_CRYSTAL,
	EFST_IDs.EFST_DA_FIRSTSLOT,
	EFST_IDs.EFST_DA_HEADDEF,
	EFST_IDs.EFST_DA_SPACE,
	EFST_IDs.EFST_DA_TRANSFORM,
	EFST_IDs.EFST_DA_ITEMREBUILD,
	EFST_IDs.EFST_DA_ILLUSION,
	EFST_IDs.EFST_DA_DARKPOWER,
	EFST_IDs.EFST_DA_EARPLUG,
	EFST_IDs.EFST_DA_REBUILD,
	EFST_IDs.EFST_DA_EDARKNESS,
	EFST_IDs.EFST_DA_EGUARDIAN,
	EFST_IDs.EFST_DA_TIMEOUT,
	EFST_IDs.EFST_NEUTRALBARRIER,
	EFST_IDs.EFST_SHAPESHIFT,
	EFST_IDs.EFST_STEALTHFIELD,
	EFST_IDs.EFST_ANALYZE,
	EFST_IDs.EFST_ACCELERATION,
	EFST_IDs.EFST_RENOVATIO,
	EFST_IDs.EFST_AB_SECRAMENT,
	EFST_IDs.EFST_DEADLYINFECT,
	EFST_IDs.EFST_REPRODUCE,
	EFST_IDs.EFST_ENERVATION,
	EFST_IDs.EFST_GROOMY,
	EFST_IDs.EFST_IGNORANCE,
	EFST_IDs.EFST_LAZINESS,
	EFST_IDs.EFST_UNLUCKY,
	EFST_IDs.EFST_WEAKNESS,
	EFST_IDs.EFST_BODYPAINT,
	EFST_IDs.EFST_SHADOWFORM,
	EFST_IDs.EFST_STRIPACCESSARY,
	EFST_IDs.EFST_AUTOSHADOWSPELL,
	EFST_IDs.EFST_INVISIBILITY,
	EFST_IDs.EFST_OVERHEAT,
	EFST_IDs.EFST_INFRAREDSCAN,
	EFST_IDs.EFST_COLD,
	EFST_IDs.EFST_HOVERING,
	EFST_IDs.EFST_DA_CONTRACT,
	EFST_IDs.EFST_SLOWCAST,
	EFST_IDs.EFST_CRITICALWOUND,
	EFST_IDs.EFST_HELLPOWER,
	EFST_IDs.EFST_CRITICALPERCENT,
	EFST_IDs.EFST_HEALPLUS,
	EFST_IDs.EFST_S_LIFEPOTION,
	EFST_IDs.EFST_L_LIFEPOTION,
	EFST_IDs.EFST_G_LIFEPOTION,
	EFST_IDs.EFST_PLUSAVOIDVALUE,
	EFST_IDs.EFST_PROTECT_DEF,
	EFST_IDs.EFST_PROTECT_MDEF,
	EFST_IDs.EFST_ARMOR_PROPERTY,
	EFST_IDs.EFST_MANU_ATK,
	EFST_IDs.EFST_ENCHANTBLADE,
	EFST_IDs.EFST_MANU_DEF,
	EFST_IDs.EFST_SPL_ATK,
	EFST_IDs.EFST_SPL_DEF,
	EFST_IDs.EFST_REFRESH,
	EFST_IDs.EFST_VITALITYACTIVATION,
	EFST_IDs.EFST_FIGHTINGSPIRIT,
	EFST_IDs.EFST_ABUNDANCE,
	EFST_IDs.EFST_GIANTGROWTH,
	EFST_IDs.EFST_STONEHARDSKIN,
	EFST_IDs.EFST_MANU_MATK,
	EFST_IDs.EFST_SPL_MATK,
	EFST_IDs.EFST_STR_SCROLL,
	EFST_IDs.EFST_INT_SCROLL,
	EFST_IDs.EFST_ACARAJE,
	EFST_IDs.EFST_MARSHOFABYSS,
	EFST_IDs.EFST_FROSTMISTY,
	EFST_IDs.EFST_RECOGNIZEDSPELL,
	EFST_IDs.EFST_FEARBREEZE,
	EFST_IDs.EFST_PARALYSE,
	EFST_IDs.EFST_LEECHESEND,
	EFST_IDs.EFST_OBLIVIONCURSE,
	EFST_IDs.EFST_DEATHHURT,
	EFST_IDs.EFST_VENOMBLEED,
	EFST_IDs.EFST_TOXIN,
	EFST_IDs.EFST_PYREXIA,
	EFST_IDs.EFST_MAGICMUSHROOM,
	EFST_IDs.EFST_WEAPONBLOCKING,
	EFST_IDs.EFST_CLOAKINGEXCEED,
	EFST_IDs.EFST_POISONINGWEAPON,
	EFST_IDs.EFST_HALLUCINATIONWALK,
	EFST_IDs.EFST_MOONLIT_SERENADE,
	EFST_IDs.EFST_LERADS_DEW,
	EFST_IDs.EFST_SONG_OF_MANA,
	EFST_IDs.EFST_ECHOSONG,
	EFST_IDs.EFST_MELODYOFSINK,
	EFST_IDs.EFST_BEYOND_OF_WARCRY,
	EFST_IDs.EFST_SATURDAY_NIGHT_FEVER,
	EFST_IDs.EFST_GLOOMYDAY,
	EFST_IDs.EFST_SIRCLEOFNATURE,
	EFST_IDs.EFST_SWING,
	EFST_IDs.EFST_HANDICAPSTATE_DEEP_SLEEP,
	EFST_IDs.EFST_DEEP_SLEEP,
	EFST_IDs.EFST_UNLIMITED_HUMMING_VOICE,
	EFST_IDs.EFST_SYMPHONY_LOVE,
	EFST_IDs.EFST_DANCE_WITH_WUG,
	EFST_IDs.EFST_RUSH_WINDMILL,
	EFST_IDs.EFST_HARMONIZE,
	EFST_IDs.EFST_CLOUD_KILL,
	EFST_IDs.EFST_WARMER,
	EFST_IDs.EFST_STRIKING,
	EFST_IDs.EFST_CRESCENTELBOW,
	EFST_IDs.EFST_LIGHTNINGWALK,
	EFST_IDs.EFST_RAISINGDRAGON,
	EFST_IDs.EFST_GENTLETOUCH_ENERGYGAIN,
	EFST_IDs.EFST_GENTLETOUCH_CHANGE,
	EFST_IDs.EFST_GENTLETOUCH_REVITALIZE,
	EFST_IDs.EFST_LG_REFLECTDAMAGE,
	EFST_IDs.EFST_SHIELDSPELL_DEF,
	EFST_IDs.EFST_SHIELDSPELL_MDEF,
	EFST_IDs.EFST_SHIELDSPELL_REF,
	EFST_IDs.EFST_PRESTIGE,
	EFST_IDs.EFST_BANDING,
	EFST_IDs.EFST_INSPIRATION,
	EFST_IDs.EFST_THORNS_TRAP,
	EFST_IDs.EFST_GN_CARTBOOST,
	EFST_IDs.EFST_FORCEOFVANGUARD,
	EFST_IDs.EFST_MACRO,
	EFST_IDs.EFST_MACRO_PERMIT,
	EFST_IDs.EFST_ATKER_ASPD,
	EFST_IDs.EFST_ATKER_MOVESPEED,
	EFST_IDs.EFST_PLUSATTACKPOWER,
	EFST_IDs.EFST_SIT,
	EFST_IDs.EFST_MVPCARD_ORCHERO,
	EFST_IDs.EFST_MVPCARD_ORCLORD,
	EFST_IDs.EFST_MVPCARD_TAOGUNKA,
	EFST_IDs.EFST_MVPCARD_MISTRESS,
	EFST_IDs.EFST_SET_NUM_DEF,
	EFST_IDs.EFST_SET_PER_DEF,
	EFST_IDs.EFST_CONCENTRATION,
	EFST_IDs.EFST_TRICKDEAD,
	EFST_IDs.EFST_FALCON,
	EFST_IDs.EFST_RIDING,
	EFST_IDs.EFST_SHOUT,
	EFST_IDs.EFST_ENERGYCOAT,
	EFST_IDs.EFST_ATTHASTE_INFINITY,
	EFST_IDs.EFST_ATTHASTE_POTION1,
	EFST_IDs.EFST_ATTHASTE_POTION2,
	EFST_IDs.EFST_ATTHASTE_POTION3,
	EFST_IDs.EFST_PROTECTWEAPON,
	EFST_IDs.EFST_PROTECTSHIELD,
	EFST_IDs.EFST_PROTECTARMOR,
	EFST_IDs.EFST_PROTECTHELM,
	EFST_IDs.EFST_PROPERTYGROUND,
	EFST_IDs.EFST_WUGRIDER,
	EFST_IDs.EFST_PLUSMAGICPOWER,
	EFST_IDs.EFST_ALL_RIDING,
	EFST_IDs.EFST_SET_NUM_MDEF,
	EFST_IDs.EFST_SET_PER_MDEF,
	EFST_IDs.EFST_ATTHASTE_CASH,
	EFST_IDs.EFST_2011RWC,
	EFST_IDs.EFST_GLORIA,
	EFST_IDs.EFST_KYRIE,
	EFST_IDs.EFST_LEXAETERNA,
	EFST_IDs.EFST_CRUCIS,
	EFST_IDs.EFST_MAGNIFICAT,
	EFST_IDs.EFST_MOVHASTE_INFINITY,
	EFST_IDs.EFST_MOVHASTE_POTION,
	EFST_IDs.EFST_INC_AGI,
	EFST_IDs.EFST_MOVHASTE_HORSE,
	EFST_IDs.EFST_BLESSING,
	EFST_IDs.EFST_PAIN_KILLER,
	EFST_IDs.EFST_LIGHT_OF_REGENE,
	EFST_IDs.EFST_OVERED_BOOST,
	EFST_IDs.EFST_STYLE_CHANGE,
	EFST_IDs.EFST_MAGMA_FLOW,
	EFST_IDs.EFST_GRANITIC_ARMOR,
	EFST_IDs.EFST_PYROCLASTIC,
	EFST_IDs.EFST_VOLCANIC_ASH,
	EFST_IDs.EFST_BENEDICTIO,
	EFST_IDs.EFST_SUFFRAGIUM,
	EFST_IDs.EFST_SLOWPOISON,
	EFST_IDs.EFST_ASPERSIO,
	EFST_IDs.EFST_WEAPONPROPERTY,
	EFST_IDs.EFST_ANGELUS,
	EFST_IDs.EFST_IMPOSITIO,
	EFST_IDs.EFST_PROVIDENCE,
	EFST_IDs.EFST_OVERLAPEXPUP,
	EFST_IDs.EFST_STEELBODY,
	EFST_IDs.EFST_GM_BATTLE,
	EFST_IDs.EFST_GM_BATTLE2
}
function HaveEfstImg(EFSTID)
	if HaveEfstImgTable[EFSTID] ~= nil then
		return true
	end
	return false
end
