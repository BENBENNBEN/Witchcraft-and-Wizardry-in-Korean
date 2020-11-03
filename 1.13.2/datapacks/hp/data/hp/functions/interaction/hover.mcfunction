# Splitting hover up into 3 functions like this allows me to insert the hover commands per quest and make some things interactable only if you have a certain quest. It was done sort of late, so it's a quite janky implementation.

# Slow punching looks cooler and feels less minecraft. Haste prevents punching at all.
execute as @s[tag=preventPunching,tag=play] run effect give @s minecraft:haste 10 5 true
execute as @s[tag=preventPunching,tag=play] run effect clear @s minecraft:mining_fatigue
execute as @s[tag=!preventPunching,tag=play] run effect give @s minecraft:mining_fatigue 10 5 true
execute as @s[tag=!preventPunching,tag=play] run effect clear @s minecraft:haste

##############
### Select ###
##############
scoreboard players set @s tmp 0
execute store result score @s tmp run tag @e[type=!item_frame,tag=questHover,limit=1] add hover
execute at @s[tag=!hoverLocked] positioned ^ ^-.25 ^1 run tag @e[type=!item_frame,distance=..2,limit=1,sort=nearest,tag=interactable] add potentialHover

# Hacky way to prevent Diagon Alley and potion stands, etc. until it is unlocked
execute as @s[tag=diagonAlleyNotUnlocked] run tag @e[tag=potentialHover,limit=1,tag=diagonAlleyBrick] remove potentialHover
execute as @s[tag=potionStandLocked] run tag @e[tag=potentialHover,limit=1,tag=brewer] remove potentialHover
execute as @s[tag=earmuffsLocked] run tag @e[tag=potentialHover,limit=1,tag=earmuffs] remove potentialHover
execute as @s[tag=pensiveLocked] run tag @e[tag=potentialHover,limit=1,tag=pensive] remove potentialHover



# Edit
execute at @s[tag=!play] positioned ^ ^-.25 ^1 run tag @e[type=!item_frame,distance=..2,limit=1,sort=nearest,tag=interactable] add potentialHover
execute at @s[tag=!play] positioned ^ ^-.25 ^1 run tag @e[type=!item_frame,distance=..2,limit=1,sort=nearest,tag=editInteractable] add potentialHover

execute at @s[tag=!inConversation,tag=!inInventory,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!inMap,tag=!inBrewer,tag=!inPensive,tag=!inWingardium,tag=!inAppiration,tag=!inLetter,tag=!inQuestBook,tag=!inProperCutScene,tag=!inResetPoint] unless entity @e[type=!item_frame,tag=hover,limit=1] positioned ^ ^-.25 ^1 run tag @e[type=!item_frame,distance=..2,limit=1,sort=nearest,tag=potentialHover] add hover

# Ray trace to see if there is something blocking the selection. if score @s tmp matches 0 is to stop it from testing if testing has already been done in the questhover
execute if score @s tmp matches 0 as @e[type=!item_frame,tag=hover,limit=1,tag=!doNotCheckHover] at @s run function hp:interaction/hover_block_check_launch

# Cleanup
tag @e[type=!item_frame,tag=potentialHover] remove potentialHover
# tag @e[type=!item_frame,tag=questHover] remove questHover

############
### Edit ###
############
execute as @s[tag=!play] run function hp:interaction/hover_edit


##############
### Titles ###
##############
# If tmp is not 0 tests are skipped, and each succesful test overrides it
# If hover actionbar is done in the quest tmp is set to 1 from the start
scoreboard players set @s[tag=!questActionbarTitle] tmp 0
scoreboard players set @s[tag=questActionbarTitle] tmp 1
tag @s[tag=questActionbarTitle] remove questActionbarTitle

execute if entity @s[tag=!inConversation,tag=!inBrewer,tag=!inPensive,tag=!inLetter,tag=!inWingardium,tag=!inAppiration,tag=!inMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!inProperCutScene,tag=!inResetPoint,tag=!waitingToReliveMemory,tag=play] as @e[tag=hover,limit=1] run function hp:interaction/hover_actionbar

# Title "Spell uses:"
# Lumos
execute if entity @s[scores={pickUpTimer=0},tag=inLumosArea,tag=!showSpellSelection,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!flyingBroom,tag=!inLumos,tag=!inInventory,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!inTravelPoint,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"! ","bold":true,"color":"aqua"},{"text":"루모스 마법 주문으로 빛을 비출 수 있습니다"},{"text":" !","bold":true,"color":"aqua"}]

# Drowning
execute if entity @s[scores={pickUpTimer=0},tag=!showSpellSelection,tag=isDrowning,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!flyingBroom,tag=!inLumos,tag=!inInventory,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"! ","bold":true,"color":"blue"},{"text":"길리위드 용액으로 물속에서 숨 쉴 수 있습니다."},{"text":" !","bold":true,"color":"blue"}]

# Alohomora
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=play] if entity @e[tag=hover,tag=interactable,tag=alohomora_lock,limit=1] store success score @s tmp run title @s actionbar  ["",{"text":"!","bold":true,"color":"gold"},{"text":" ","bold":true,"color":"dark_gray"},{"text":"알로호모라 마법 주문으로 열 수 있습니다"},{"text":" ","bold":true,"color":"dark_gray"},{"text":"!","bold":true,"color":"gold"}]
execute if entity @s[scores={pickUpTimer=0},tag=castAlohomora] if entity @e[tag=doorOpened] store success score @s tmp run title @s actionbar ["",{"text":"! ","bold":true,"color":"gold"},{"text":"잠금 해제..."},{"text":" !","bold":true,"color":"gold"}]

# Vera Verto
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=play] if entity @e[tag=hover,tag=interactable,tag=veraVerto,limit=1] store success score @s tmp run title @s actionbar  ["",{"text":"!","bold":true,"color":"blue"},{"text":" ","bold":true,"color":"dark_gray"},{"text":"베라 베르토 마법 주문으로 변화할 수 있습니다"},{"text":" ","bold":true,"color":"dark_gray"},{"text":"!","bold":true,"color":"blue"}]

# Wingardium
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!invisCape,tag=!stunnedByMandrake,tag=!earmuffs,tag=play] if entity @e[tag=hover,tag=interactable,tag=wingardium,limit=1] store success score @s tmp run title @s actionbar  ["",{"text":"!","bold":true,"color":"dark_purple"},{"text":" ","bold":true,"color":"dark_gray"},{"text":"윙가르디움 레비오우사 마법 주문으로 들어 올릴 수 있습니다."},{"text":" ","bold":true,"color":"dark_gray"},{"text":"!","bold":true,"color":"dark_purple"}]
execute if entity @s[scores={pickUpTimer=0},tag=inWingardium,tag=hoveringOnWingardiumBox,tag=!isLiftingWingardiumBox,tag=!hoveringOnWingardiumBoxInSwitch,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"들어 올리려면  ","color":"dark_purple"},{"text":"⌡","bold":false,"color":"white"},{"text":" 를 누르세요","color":"dark_purple"}]
execute if entity @s[scores={pickUpTimer=0},tag=inWingardium,tag=hoveringOnWingardiumBox,tag=isLiftingWingardiumBox,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"내려놓으려면  ","color":"dark_purple"},{"text":"⌡","bold":false,"color":"white"},{"text":" 를 누르세요","color":"dark_purple"}]
execute if entity @s[scores={pickUpTimer=0},tag=inWingardium,tag=hoveringOnWingardiumBox,tag=!isLiftingWingardiumBox,tag=hoveringOnWingardiumBoxInSwitch,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"스위치에서 들어 올리려면  ","color":"dark_purple"},{"text":"⌡","bold":false,"color":"white"},{"text":" 를 누르세요","color":"dark_purple"}]
execute if entity @s[scores={pickUpTimer=0},tag=inWingardium,tag=isLiftingWingardiumBox,tag=hoveringWingardiumBoxOverSwitch,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"스위치에 내려놓으려면  ","color":"dark_purple"},{"text":"⌡","bold":false,"color":"white"},{"text":" 를 누르세요","color":"dark_purple"}]

# Bombarda
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!invisCape,tag=!stunnedByMandrake,tag=!earmuffs,tag=play] if entity @e[tag=hover,tag=interactable,tag=bombarda_blockade,tag=!explodedBlockade,limit=1] store success score @s tmp run title @s actionbar  ["",{"text":"!","bold":true,"color":"gold"},{"text":" ","bold":true,"color":"gold"},{"text":"봄바르다 막시마 마법 주문으로 폭파시킬 수 있습니다"},{"text":" ","bold":true,"color":"gold"},{"text":"!","bold":true,"color":"gold"}]

# Apparate
execute if entity @s[scores={pickUpTimer=0},tag=inAppiration,tag=cantApparateHere] store success score @s tmp run title @s actionbar ["",{"text":"여기서 순간이동할 수 없습니다","color":"red"}]

# Invisibility cape
execute if entity @s[scores={pickUpTimer=0,invisCapeAnim=..0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=invisCape,tag=play,tag=!usingInvisibilityPotion] store success score @s tmp run title @s actionbar ["",{"text":"당신은 보이지 않습니다. 투명망토를 벗으려면 버튼을 누르세요"},{"keybind":"key.sneak"},"'."]
execute if entity @s[scores={pickUpTimer=0,invisCapeAnim=..0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=invisCape,tag=play,tag=usingInvisibilityPotion] store success score @s tmp run title @s actionbar ["",{"text":"당신은 보이지 않습니다. 투명 효과는 곧 사라집니다."}]

# You are wearing earmuffs
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=earmuffs,tag=!isHoveringOnMandrake,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"귀마개를 착용하고 있습니다. 'shift'를 눌러 귀마개를 벗을 수 있습니다."}]

# Replant mandrake
execute if entity @s[scores={pickUpTimer=0},tag=!inWingardium,tag=!showMaraudersMap,tag=!inQuestBook,tag=!inSettings,tag=!showSpellSelection,tag=!inInventory,tag=!castAlohomora,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=earmuffs,tag=isHoveringOnMandrake,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"맨드레이크를 심으려면  ","color":"gold"},{"text":"⌡","color":"white"},{"text":" 를 누르세요. ","color":"gold"}]
tag @s remove isHoveringOnMandrake

# Pickup (Placed here because the title overrides the hover titles below)
execute as @s[scores={pickUpTimer=1..}] run function hp:inventory/pick_up

# Leaving playable area
execute if entity @s[scores={pickUpTimer=0},tag=leavingPlayableArea,tag=!showSpellSelection,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!flyingBroom,tag=!inLumos,tag=!inInventory,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!inTravelPoint,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"돌아가세요! 너무 멀리 갔습니다","color":"red"}]
execute if entity @s[scores={pickUpTimer=0},tag=leavingPlayableArea,tag=!showSpellSelection,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=flyingBroom,tag=!inLumos,tag=!inInventory,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!inTravelPoint,tag=play] store success score @s tmp run title @s actionbar ["",{"text":"돌아가세요! 너무 멀리 날아갔습니다","color":"red"}]


# Waiting for everyone to interact with the pensive
execute if entity @s[scores={pickUpTimer=0},tag=waitingToReliveMemory,tag=!showSpellSelection,tag=!invisCape,tag=!omnioculars,tag=!stunnedByMandrake,tag=!earmuffs,tag=!flyingBroom,tag=!inLumos,tag=!inInventory,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=!inTravelPoint,tag=play] run function hp:pensive/waiting_to_relive_memory

# At end to prevent flicker
title @s[tag=!showSpellSelection,tag=!adjustGUI,tag=!inProperCutScene,tag=!inResetPoint,tag=!cutsceneOverrideActionbar,tag=play,scores={tmp=0}] actionbar ["",{"text":""}]