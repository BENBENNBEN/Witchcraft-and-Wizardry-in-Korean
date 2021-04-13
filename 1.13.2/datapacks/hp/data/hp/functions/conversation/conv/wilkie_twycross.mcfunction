# Style:
# (_____Normal_____)
# (_____Quest_____)
# (_____Return_____)

# Sound
# (_____click_____)
# (_____paper_____)

# On first execution used to set convOverride
execute as @s[scores={delayConvTellraw=2,playerID=1}] run scoreboard players operation @s convState = willkieTwycross p1convOverride
execute as @s[scores={delayConvTellraw=2,playerID=2}] run scoreboard players operation @s convState = willkieTwycross p2convOverride
execute as @s[scores={delayConvTellraw=2,playerID=3}] run scoreboard players operation @s convState = willkieTwycross p3convOverride
execute as @s[scores={delayConvTellraw=2,playerID=4}] run scoreboard players operation @s convState = willkieTwycross p4convOverride
execute as @s[scores={delayConvTellraw=2}] run scoreboard players set @s oldConvState -2
execute as @s[scores={delayConvTellraw=1..}] run scoreboard players remove @s delayConvTellraw 1

scoreboard players set @s npcVoice 7

################################################################################################
##################################### Conversation State 0 #####################################
################################################################################################

tag @s[scores={convState=0},tag=drawOptions] add use
tag @s[scores={convState=0},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 좋은 아침이구나. 내가 마법 정부 소속 순간이동 교육 담당자란다. 순간이동을 배우려고 온 거지? 지금 배울 거니?\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 네 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 질문이 있어요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≥ 나중에요 \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 3
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 순간이동은 매우 유용하지만, 고등 마법이라서 마법 정부에서 교육을 담당하고 있어. 한 위치에서 다른 위치로 즉시 이동할 수 있는 교통수단 같은 거지. 그러니까 마녀나 마법사가 꼭 배워야 하는 필수 마법이란다. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2

#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 0
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 수업을 들을 거니? 500 갤리온이란다.\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 지금 수업을 듣고 싶어요 (500 ≈) \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=..499}] at @s run playsound minecraft:custom.ui.error master @a ~ ~ ~ 1 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=..499}] store success score @s tmp run scoreboard players set @s convState 9
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=500..}] run scoreboard players set @s convState 3
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=500..}] at @s run playsound minecraft:custom.ui.inventory.coin master @a ~ ~ ~ 1 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=500..}] run tag @s add hasSpokenToTwycrossAndPaidForApparitionCourse
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,money=500..}] run scoreboard players remove @s money 500

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≥ 안녕히 계세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1

#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아주 좋아. 나를 따라오렴. 수업을 시작하자. \\n\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1

#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 반대편으로 가려면 순간이동 주문을 외워야 해. 주문을 선택하고 _right mouse button_를 두 번 클릭하여 집중하고, ⌠ 를 누르면 네가 바라보고 있는 곳으로 이동할 거야. 다시 _right mouse button_를 두 번 클릭하면 초점 선택을 취소할 수 있어. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 정부에 관해 얘기해 주세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 6 #####################################
################################################################################################

tag @s[scores={convState=6},tag=drawOptions] add use
tag @s[scores={convState=6},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 오, 훌륭해. 아주 잘했어. 합격이란다. 이제 순간이동 주문을 사용할 수 있어. \\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @s add hasSpokenToTwycrossAboutPassingApparitionTest
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
##################################### Conversation State 7 #####################################
################################################################################################

tag @s[scores={convState=7},tag=drawOptions] add use
tag @s[scores={convState=7},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 다른 사람은 몰라도 우리는 무슨 일이 있었는지 알잖아. 마법 정부와 덤블도어가 항상 협력 관계는 아니지만, 이 일은 전해줘야 한다고 생각해. 덤블도어라면 어떻게 해야 할지 알 테니까. \\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 8
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
##################################### Conversation State 8 #####################################
################################################################################################

tag @s[scores={convState=8},tag=drawOptions] add use
tag @s[scores={convState=8},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 얼른 서둘러! 가! \\n\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] if entity @p[tag=activePlayer,tag=!confirmConvOption] run data merge entity @s {CustomName:"{\"text\":\"√ 마법 정부 중앙 홀로 이동하기\"}",Tags:["_____Normal_____","_____click_____","fastTravel","_____destinationMinistryOfMagic_____","convOption","i"]}
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] if entity @p[tag=activePlayer,tag=confirmConvOption] run data merge entity @s {CustomName:"{\"text\":\"마법 정부\"}",Tags:["_____Normal_____","_____click_____","fastTravel","_____destinationMinistryOfMagic_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @s add hasSpokenToTwycrossAfterDeathEaterAttack
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=2,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≥ 그 전에 해야 할 일이 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=2,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 7
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 9 #####################################
################################################################################################

tag @s[scores={convState=9},tag=drawOptions] add use
tag @s[scores={convState=9},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아, 그 돈으로는 부족해. 나중에 돈을 모으고 다시 와.\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 10 #####################################
################################################################################################

tag @s[scores={convState=10},tag=drawOptions] add use
tag @s[scores={convState=10},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 반대편으로 가려면 순간이동 주문을 외워야 해. ² 를 눌러 주문을 선택하고 ⌠ 를 두 번 클릭하여 집중하고, ⌡ 를 누르면 네가 바라보고 있는 곳으로 이동할 거야.\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 11 #####################################
################################################################################################

tag @s[scores={convState=11},tag=drawOptions] add use
tag @s[scores={convState=11},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 모두 도착할 때까지 기다려.\\n\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 12 #####################################
################################################################################################

tag @s[scores={convState=12},tag=drawOptions] add use
tag @s[scores={convState=12},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 무엇이 궁금한데? \\n\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 정부가 뭔가요? \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 13
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 정부의 역사에 대해 얘기해주세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 14
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법부 장관에 관해 얘기해 주세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 15
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 어떤 부서에 대해 묻고 싶어요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\" 다른 용무가 있어요 \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 5
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 0
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 13 #####################################
################################################################################################

tag @s[scores={convState=13},tag=drawOptions] add use
tag @s[scores={convState=13},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 그러니까, 마법 정부 혹은 '마법부'는 영국과 아일랜드의 마법 세계를 담당하는 곳으로 머글 세계의 영국 정부와 협력하고 있어. 그래서 마법 정부 청사는 화이트홀 밑, 웨스트민스터 궁전 근처, 런던 지하에 있지. 매우 실용적이게도 말이야. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 12
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 14 #####################################
################################################################################################

tag @s[scores={convState=14},tag=drawOptions] add use
tag @s[scores={convState=14},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 역사에 관심 있는가 보군? 마법 정부 전에는 마법사 의회가 영국 마법 세계를 관리했었어. 1692년 국제 마법 비밀 법령 이후에 정부가 더 체계적일 필요가 있었고, 1707년에 마법 정부가 설립되었지. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 12
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 15 #####################################
################################################################################################

tag @s[scores={convState=15},tag=drawOptions] add use
tag @s[scores={convState=15},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 정부 총리는 마법 정부의 최고위 자리이자 영국과 아일랜드 마법 세계의 행정부 수장이야. 마법 세계의 고등법원인 위즌가모트에서 열리는 주요 재판도 참석하지. 초대 총리는 1707년에 부임된 율릭 갬프였어. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 12
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 16 #####################################
################################################################################################


tag @s[scores={convState=16},tag=drawOptions] add use
tag @s[scores={convState=16},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 오, 그래. 마법 정부에는 여러 부서가 있지. 어느 부서에 대해 듣고 싶은데? \"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 사법부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 17
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 사고 및 재난부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 18
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 생명체 통제 관리부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 19
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 국제 마법 협력부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 20
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 스포츠부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 21
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=6}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 교통부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=6}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 22
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=7}] run data merge entity @s {CustomName:"{\"text\":\"≤ 미스터리부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=7}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 23
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=8}] run data merge entity @s {CustomName:"{\"text\":\"다른 거요 \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=8}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 8
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 12
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 17 #####################################
################################################################################################

tag @s[scores={convState=17},tag=drawOptions] add use
tag @s[scores={convState=17},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아, 그래. 마법 사법부는 가장 규모가 크고 가장 강력한 부서야. 영국 마법 세계의 법 적용 및 집행을 담당하지. 미스터리부를 제외한 다른 모든 부서는 마법 사법부의 말을 따라야 한단다. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 18 #####################################
################################################################################################

tag @s[scores={convState=18},tag=drawOptions] add use
tag @s[scores={convState=18},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 중요한 부서지. 우발적인 마법으로 말미암은 사고를 수습하니까. 마법을 잘못 외웠다거나, 주문이 이상하다거나, 물약이 잘못됐다거나. 너도 상상이 갈 거야. 미숙한 마녀, 마법사들이 어떤 사고를 칠지. \\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 19 #####################################
################################################################################################

tag @s[scores={convState=19},tag=drawOptions] add use
tag @s[scores={convState=19},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 생명체 통제 관리부는 마법 정부에서 두 번째로 큰 부서야. 인간, 동물, 유령으로 크게 세 부서로 나뉘어 있지. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 20 #####################################
################################################################################################

tag @s[scores={convState=20},tag=drawOptions] add use
tag @s[scores={convState=20},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아, 국제 마법 협력부는 국제 마법사 연맹을 통해 서로 다른 국가의 마법 세계가 함께 할 수 있도록 노력하는 부서야. 무역 표준을 설정하고, 가마솥 두께 같은 규정도 만들고, 국제 마법 법령도 논의하고, 트라이위자드 시합과 같은 이벤트를 위해 마법 스포츠 부서와 협력하기도 하지. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 5
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 21 #####################################
################################################################################################

tag @s[scores={convState=21},tag=drawOptions] add use
tag @s[scores={convState=21},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 스포츠부는 퀴디치 등의 모든 마법 게임과 스포츠를 담당해. 영국에서 행해지는 모든 마법 스포츠를 관장하지. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 22 #####################################
################################################################################################

tag @s[scores={convState=22},tag=drawOptions] add use
tag @s[scores={convState=22},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아! 우리 부서야. 우리는 마법 교통의 모든 것을 책임지고 있지. 모든 종류의 마법 교통 말이야. 플루가루, 빗자루, 포트키. 순간이동도 당연히 포함하고. 순간이동 교육 센터는 마법 교통부에 있어. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 23 #####################################
################################################################################################

tag @s[scores={convState=23},tag=drawOptions] add use
tag @s[scores={convState=23},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 궁금하구나? 사실 나도 궁금해. 나도 잘 모르거든. 미스터리부의 업무는 대부분 비밀이고, 절대로 함구하는 것이 원칙이라서. 그래서 직원들도 '말할 수 없는 자'라고 부른단다. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
	
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 16
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 16
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 24 #####################################
################################################################################################

tag @s[scores={convState=24},tag=drawOptions] add use
tag @s[scores={convState=24},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 순간이동 수업을 듣기에는 너무 어려 보이는데. 여기는 무슨 일이니? \\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≥ 안녕히 계세요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 25 #####################################
################################################################################################

tag @s[scores={convState=25},tag=drawOptions] add use
tag @s[scores={convState=25},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 그래서 무슨 일이야? \\n\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 질문이 있어요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 26

execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≥ 안녕히 계세요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
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
##################################### Conversation State 26 #####################################
################################################################################################

tag @s[scores={convState=26},tag=drawOptions] add use
tag @s[scores={convState=26},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 무엇을 묻고 싶은데? \\n\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 정부가 뭔가요? \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 27
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 정부의 역사에 대해 얘기해주세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 28
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법부 장관에 관해 얘기해 주세요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 29
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 어떤 부서에 대해 묻고 싶어요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≥ 안녕히 계세요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 5
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 25
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 27 #####################################
################################################################################################

tag @s[scores={convState=27},tag=drawOptions] add use
tag @s[scores={convState=27},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 그러니까, 마법 정부 혹은 '마법부'는 영국과 아일랜드의 마법 세계를 담당하는 곳으로 머글 세계의 영국 정부와 협력하고 있어. 그래서 마법 정부 청사는 화이트홀 밑, 웨스트민스터 궁전 근처, 런던 지하에 있지. 매우 실용적이게도 말이야. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 26
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 26
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 28 #####################################
################################################################################################

tag @s[scores={convState=28},tag=drawOptions] add use
tag @s[scores={convState=28},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 역사에 관심 있는가 보군? 마법 정부 전에는 마법사 의회가 영국 마법 세계를 관리했었어. 1692년 국제 마법 비밀 법령 이후에 정부가 더 체계적일 필요가 있었고, 1707년에 마법 정부가 설립되었지. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 26
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 26
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 29 #####################################
################################################################################################

tag @s[scores={convState=29},tag=drawOptions] add use
tag @s[scores={convState=29},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 정부 총리는 마법 정부의 최고위 자리이자 영국과 아일랜드 마법 세계의 행정부 수장이야. 마법 세계의 고등법원인 위즌가모트에서 열리는 주요 재판도 참석하지. 초대 총리는 1707년에 부임된 율릭 갬프였어. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 26
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 26
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 30 #####################################
################################################################################################


tag @s[scores={convState=30},tag=drawOptions] add use
tag @s[scores={convState=30},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 오, 그래. 마법 정부에는 여러 부서가 있지. 어느 부서에 대해 듣고 싶은데? \"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 사법부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 31
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 사고 및 재난부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 32
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 생명체 통제 관리부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 33
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 국제 마법 협력부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 34
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 스포츠부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 35
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=6}] run data merge entity @s {CustomName:"{\"text\":\"≤ 마법 교통부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=6}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 36
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=7}] run data merge entity @s {CustomName:"{\"text\":\"≤ 미스터리부 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=7}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 37
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=8}] run data merge entity @s {CustomName:"{\"text\":\" 다른 거요 \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=8}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 8
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 26
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 31 #####################################
################################################################################################

tag @s[scores={convState=31},tag=drawOptions] add use
tag @s[scores={convState=31},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아, 그래. 마법 사법부는 가장 규모가 크고 가장 강력한 부서야. 영국 마법 세계의 법 적용 및 집행을 담당하지. 미스터리부를 제외한 다른 모든 부서는 마법 사법부의 말을 따라야 한단다. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 32 #####################################
################################################################################################

tag @s[scores={convState=32},tag=drawOptions] add use
tag @s[scores={convState=32},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 중요한 부서지. 우발적인 마법으로 말미암은 사고를 수습하니까. 마법을 잘못 외웠다거나, 주문이 이상하다거나, 물약이 잘못됐다거나. 너도 상상이 갈 거야. 미숙한 마녀, 마법사들이 어떤 사고를 칠지. \\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 33 #####################################
################################################################################################

tag @s[scores={convState=33},tag=drawOptions] add use
tag @s[scores={convState=33},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 생명체 통제 관리부는 마법 정부에서 두 번째로 큰 부서야. 인간, 동물, 유령으로 크게 세 부서로 나뉘어 있지. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 34 #####################################
################################################################################################

tag @s[scores={convState=34},tag=drawOptions] add use
tag @s[scores={convState=34},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아, 국제 마법 협력부는 국제 마법사 연맹을 통해 서로 다른 국가의 마법 세계가 함께 할 수 있도록 노력하는 부서야. 무역 표준을 설정하고, 가마솥 두께 같은 규정도 만들고, 국제 마법 법령도 논의하고, 트라이위자드 시합과 같은 이벤트를 위해 마법 스포츠 부서와 협력하기도 하지. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 5
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 35 #####################################
################################################################################################

tag @s[scores={convState=35},tag=drawOptions] add use
tag @s[scores={convState=35},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 마법 스포츠부는 퀴디치 등의 모든 마법 게임과 스포츠를 담당해. 영국에서 행해지는 모든 마법 스포츠를 관장하지. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 36 #####################################
################################################################################################

tag @s[scores={convState=36},tag=drawOptions] add use
tag @s[scores={convState=36},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아! 우리 부서야. 우리는 마법 교통의 모든 것을 책임지고 있지. 모든 종류의 마법 교통 말이야. 플루가루, 빗자루, 포트키. 순간이동도 당연히 포함하고. 순간이동 교육 센터는 마법 교통부에 있어. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 37 #####################################
################################################################################################

tag @s[scores={convState=37},tag=drawOptions] add use
tag @s[scores={convState=37},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 궁금하구나? 사실 나도 궁금해. 나도 잘 모르거든. 미스터리부의 업무는 대부분 비밀이고, 절대로 함구하는 것이 원칙이라서. 그래서 직원들도 '말할 수 없는 자'라고 부른단다. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################

#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 16
#-------------------------------
# Back conversation state (when player presses shift. -1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 30
tag @s remove use
tag @s remove trg
#===============================
