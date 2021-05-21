# Style:
# (_____Normal_____)
# (_____Quest_____)
# (_____Return_____)

# Sound
# (_____click_____)
# (_____paper_____)

# On first execution used to set convOverride
execute as @s[scores={delayConvTellraw=2,playerID=1}] run scoreboard players operation @s convState = sophieRoper p1convOverride
execute as @s[scores={delayConvTellraw=2,playerID=2}] run scoreboard players operation @s convState = sophieRoper p2convOverride
execute as @s[scores={delayConvTellraw=2,playerID=3}] run scoreboard players operation @s convState = sophieRoper p3convOverride
execute as @s[scores={delayConvTellraw=2,playerID=4}] run scoreboard players operation @s convState = sophieRoper p4convOverride
execute as @s[scores={delayConvTellraw=2}] run scoreboard players set @s oldConvState -2
execute as @s[scores={delayConvTellraw=1..}] run scoreboard players remove @s delayConvTellraw 1

################################################################################################
##################################### Conversation State 0 #####################################
################################################################################################

tag @s[scores={convState=0},tag=drawOptions] add use
tag @s[scores={convState=0},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 런던에 있는 친구한테 편지 보내야 하는데 내 부엉이가 아직 안 왔어. 여기 호그와트에 우체통이라도 있으면 편지 보내겠는데, 그런 게 없잖아! \\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState -1
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 1 #####################################
################################################################################################

tag @s[scores={convState=1},tag=drawOptions] add use
tag @s[scores={convState=1},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 혹시 대신 이 편지를 전해줄 수 있니? 친구가 편지를 받으면 너에게 보답을 해줄 거야.\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 할게\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------

execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≥ 난 부엉이가 아니야\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 0
tag @s remove use
tag @s remove trg
#===============================


################################################################################################
##################################### Conversation State 2 #############################################
################################################################################################

tag @s[scores={convState=2},tag=drawOptions] add use
tag @s[scores={convState=2},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 고마워! 런던 아이 옆에 있는 주빌리 가든에 자주 놀러 가. 아마 거기 근처에서 찾을 수 있을 거야. \\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" 편지를 대신 전해 줄게\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=1}] run scoreboard players set sophieRoper p1convOverride 3
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=2}] run scoreboard players set sophieRoper p2convOverride 3
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=3}] run scoreboard players set sophieRoper p3convOverride 3
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=4}] run scoreboard players set sophieRoper p4convOverride 3
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState -1
tag @s remove use
tag @s remove trg
#===============================


################################################################################################
##################################### Conversation State 3 #############################################
################################################################################################

tag @s[scores={convState=3},tag=drawOptions] add use
tag @s[scores={convState=3},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 도와줘서 고마워! \\n\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState -1
tag @s remove use
tag @s remove trg
#===============================
