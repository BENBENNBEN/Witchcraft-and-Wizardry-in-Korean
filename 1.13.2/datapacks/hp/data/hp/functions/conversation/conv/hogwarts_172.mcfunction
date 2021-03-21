# Style:
# (_____Normal_____)
# (_____Quest_____)
# (_____Return_____)

# Sound
# (_____click_____)
# (_____paper_____)

# On first execution used to set convOverride
execute as @s[scores={delayConvTellraw=2,playerID=1}] run scoreboard players operation @s convState = hogwarts172 p1convOverride
execute as @s[scores={delayConvTellraw=2,playerID=2}] run scoreboard players operation @s convState = hogwarts172 p2convOverride
execute as @s[scores={delayConvTellraw=2,playerID=3}] run scoreboard players operation @s convState = hogwarts172 p3convOverride
execute as @s[scores={delayConvTellraw=2,playerID=4}] run scoreboard players operation @s convState = hogwarts172 p4convOverride
execute as @s[scores={delayConvTellraw=2}] run scoreboard players set @s oldConvState -2
execute as @s[scores={delayConvTellraw=1..}] run scoreboard players remove @s delayConvTellraw 1

scoreboard players set @s npcVoice 1

################################################################################################
##################################### Conversation State 0 #####################################
################################################################################################

tag @s[scores={convState=0},tag=drawOptions] add use
tag @s[scores={convState=0},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 애들이 개구리 합창단 연습에 자꾸 빠져서 일정을 게시판에 붙여두려고. 그러면 제시간에 올지도 모르잖아.\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"ⁿ 내가 도와줄까? (보상: 200 ≈)\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
# Add quest
#####
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set frogChoirQuarrel sharedQuests 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set frogChoirQuarrel p1Quests 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set frogChoirQuarrel p2Quests 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set frogChoirQuarrel p3Quests 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set frogChoirQuarrel p4Quests 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set hogwarts172 p1convOverride 2
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set hogwarts172 p2convOverride 2
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set hogwarts172 p3convOverride 2
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set hogwarts172 p4convOverride 2
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set @a[tag=play] questQueueID 65
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set @a[tag=play] questQueue 52
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set @a[tag=play,tag=!lockTrackedQuest] trackedQuestID 0
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @a[tag=play] add startQueingQuest

execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] as @a[tag=play] at @s run playsound minecraft:custom.ui.quest.accept_quest master @s ~ ~ ~ 1 1 1


execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] unless entity @p[tag=queingQuest] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≥ 행운을 빌어\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------
#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 정말? 고마워! 그냥 성에 있는 게시판 4곳에 붙이기만 하면 돼.\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 그럴게\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 2 #####################################
################################################################################################

tag @s[scores={convState=2},tag=drawOptions] add use
tag @s[scores={convState=2},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 이제 사람들이 제시간에 왔으면 좋겠다.\\n\\n\\n\\n\\n\"}"}
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

################################################################################################
##################################### Conversation State 3 #####################################
################################################################################################

tag @s[scores={convState=3},tag=drawOptions] add use
tag @s[scores={convState=3},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 이제 사람들이 제시간에 왔으면 좋겠다.\\n\\n\\n\\n\\n\"}"}
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

################################################################################################
##################################### Conversation State 4 #####################################
################################################################################################

tag @s[scores={convState=4},tag=drawOptions] add use
tag @s[scores={convState=4},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 일정표 다 붙였어? 정말 고마워. 여기, 이거 받아.\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ±ˈˈ 고마워! (수락: 200 ≈) \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @s add hasCompletedFrogChoirQuarrel
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run scoreboard players set @s trackedQuestID 65
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
##################################### Conversation State 5 #####################################
################################################################################################

tag @s[scores={convState=5},tag=drawOptions] add use
tag @s[scores={convState=5},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 일정표 붙이는 거 도와줘서 고마워!\\n\\n\\n\\n\\n\"}"}
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
