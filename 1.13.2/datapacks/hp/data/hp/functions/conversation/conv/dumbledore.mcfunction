# Style:
# (_____Normal_____)
# (_____Quest_____)
# (_____Return_____)

# Sound
# (_____click_____)
# (_____paper_____)

# On first execution used to set convOverride
execute as @s[scores={delayConvTellraw=2,playerID=1}] run scoreboard players operation @s convState = dumbledore p1convOverride
execute as @s[scores={delayConvTellraw=2,playerID=2}] run scoreboard players operation @s convState = dumbledore p2convOverride
execute as @s[scores={delayConvTellraw=2,playerID=3}] run scoreboard players operation @s convState = dumbledore p3convOverride
execute as @s[scores={delayConvTellraw=2,playerID=4}] run scoreboard players operation @s convState = dumbledore p4convOverride
execute as @s[scores={delayConvTellraw=2}] run scoreboard players set @s oldConvState -2
execute as @s[scores={delayConvTellraw=1..}] run scoreboard players remove @s delayConvTellraw 1

scoreboard players set @s npcVoice 0

################################################################################################
##################################### Conversation State 0 #####################################
################################################################################################

tag @s[scores={convState=0},tag=drawOptions] add use
tag @s[scores={convState=0},tag=triggerOption,tag=!drawOptions] add trg

################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"[{\"text\":\" 내가 호그와트 마법학교의 교장, \"},{\"text\":\"알버스 퍼시벌 울프릭 브라이언 덤블도어란다\",\"color\":\"gold\",\"bold\":\"true\"},{\"text\":\".\\n\\n\\n\",\"color\":\"white\",\"bold\":\"false\"}]"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=1}] run scoreboard players set dumbledore p1convOverride 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=2}] run scoreboard players set dumbledore p2convOverride 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=3}] run scoreboard players set dumbledore p3convOverride 1
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0,playerID=4}] run scoreboard players set dumbledore p4convOverride 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트는 언제나 도움이 필요한 이에게 열려있지. 무슨 일이니? \"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 어떻게 교장이 되셨나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 33
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 이전 교장 선생님에 대해 알려주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 23
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 선생님이셨을 때 무엇을 가르치셨나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 24
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≤ 다른 마법학교는 없나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 25
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=6}] run data merge entity @s {CustomName:"{\"text\":\"≤ 멀린 훈장에 대해 알려주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=6}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 29
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=7}] run data merge entity @s {CustomName:"{\"text\":\"≤ 니콜라스 플라멜에 대해 알려주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=7}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 30
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=8}] run data merge entity @s {CustomName:"{\"text\":\"≤ 어느 기숙사에 속하셨나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=8}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 31
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=9}] run data merge entity @s {CustomName:"{\"text\":\"≥ 몸조심하세요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=9}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 9
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트 마법학교는 영국 마법학교야. 더 알고 싶은 게 있니?\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트는 어디에 있어요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 3
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트는 언제 설립되었나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 4
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트 기숙사에 대해 알려주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트 성 주변에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 21
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트 성에 대해 알려주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 22
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=6}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트 교수님들은 누구인가요?"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=6}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 5
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=7}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트에서는 어떤 과목을 가르치나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=7}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 19
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=8}] run data merge entity @s {CustomName:"{\"text\":\"≤ 호그와트 일상은 어떤 가요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=8}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 20
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=9}] run data merge entity @s {CustomName:"{\"text\":\"또 물어보고 싶은 게 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=9}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 9
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 성은 스코틀랜드의 하일랜드 지방에 위치해 있어. 머글에게는 보이지 않고, 버려진 지 오래된 성처럼 보이지. 우리의 교육 방식이 드러나지 않도록 해서 학생들을 위험으로부터 보호하기 위함이란다. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트는 990년대에 고드릭 그리핀도르, 헬가 후플푸프, 로위너 래번클로, 살라자르 슬리데린 2명의 마법사와 2명의 마녀에 의해 설립되었단다. 그들은 각자 학생들에게 바라는 중요한 특성을 대표하지.\\n \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트의 일반 마법 교수 겸 래번클로 기숙사 사감으로 필리우스 플리트윅이 있고, 변환 마법 교수이자 그리핀도르 기숙사 사감으로 미네르바 맥고나걸이 있고, 약초학 교수 겸 후플푸프 기숙사 사감으로 포모나 스프라우트가 있고, 마법약 교수이자 슬리데린 기숙사 사감으로 세베루스 스네이프가 있어; ...\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 32
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트의 기숙사는 생활공간뿐만 아니라 학습 공동체와 다름이 없어. 더 궁금한 게 있니?\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####The houses compete throughout the school year, by earning and losing points for various activities. 
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 무슨 기숙사가 있어요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 7
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 어떻게 기숙사에 배정되나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 8
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 기숙사들은 어떻게 경쟁하나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 9
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 누가 기숙사를 세웠나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"≤ 그리핀도르 기숙사에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 15
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=6}] run data merge entity @s {CustomName:"{\"text\":\"≤ 래번클로 기숙사에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=6}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 17
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=7}] run data merge entity @s {CustomName:"{\"text\":\"≤ 후플푸프 기숙사에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=7}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 16
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=8}] run data merge entity @s {CustomName:"{\"text\":\"≤ 슬리데린 기숙사에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=8}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 18
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=9}] run data merge entity @s {CustomName:"{\"text\":\"또 물어보고 싶은 게 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=9}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 9
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"[{\"text\":\" 호그와트는 창립자들의 성을 딴 4개의 기숙사로 이뤄져 있단다. \"},{\"text\":\"그리핀도르, 후플푸프, 래번클로, 슬리데린\",\"color\":\"gold\",\"bold\":\"true\"},{\"text\":\".\"}]"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 누가 호그와트를 설립했나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"또 물어보고 싶은 게 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. 2 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트 초기에는 4명의 창립자들이 자신들의 이념에 따라 직접 학생들을 선발했었어. 그들이 죽은 후에도 그들을 대신해 학생들을 분류하기 위해 고드릭 그리핀도르가 자신이 쓰고 있던 모자를 벗어 분류모자로 만들었단다. 매년 마법의 분류모자가 신입생들 머리에 씌여져 기숙사가 배정되는 거야.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 일 년 내내 기숙사 점수를 얻고 잃으면서 경쟁하다가 학기 말에 결산해 그 해 우승 기숙사를 정해. 각 기숙사마다 퀴디치 팀이 있는데 기숙사 경쟁전도 치러져. 이런 대회는 기숙사 사이에 경쟁을 일으키고 가장 뜨거운 것은 그리핀도르와 슬리데린 사이의 경쟁이란다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트의 기숙사는 2명의 마법사와 2명의 마녀에 의해 설립되었단다. \"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 고드릭 그리핀도르에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 11
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 헬가 후플푸프에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 12
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 로위너 래번클로에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 13
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\"≤ 살라자르 슬리데린에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 14
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=5}] run data merge entity @s {CustomName:"{\"text\":\"또 질문이 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=5}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 5
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 그리핀도르는 영국 태생의 마법사였어. 살라자르 슬리데린과는 가까운 친구였지만 머글 태생 입학 문제에 대한 의견 차이를 극복하지 못했어. 그리핀도르가 태어난 곳은 그의 이름을 따 고드릭 골짜기라고 지어졌단다.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 10
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 헬가 후플푸프는 웨일스 태생의 마녀였어. 그녀는 나머지 설립자들이 각자의 기준에 따라 선별하고 남은 학생 모두를 받아들였어. 후플푸프 학생들은 성실하고 열심히 노력하지. 그리고 그녀가 음식 관련 마법 주문에 뛰어난 재능이 있었는데, 그녀가 만든 음식 레시피는 아직도 호그와트 요리를 만드는 데 쓰이고 있단다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 10
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 로위너 래번클로는 스코틀랜트 태생의 마녀였어. 그녀의 뛰어난 지성과 창의성으로 당대 최고의 마녀라고 불리었어. 래번클로는 치명적인 병에 걸린 후 사망했지. 전설에 따르면 그녀의 딸 헬레나가 로위너의 보관을 훔쳐 도망친 후 상처 받은 마음이 병의 원인이라고 해. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 10
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 살라자르 슬리데린은 순혈주의 마법사였어. 그의 교활함과 결단력은 아주 유명했고, 당대 최고의 마법사 중 하나로 여겨졌지. 그는 뱀의 말을 할 수 있는 파셀마우스였으며 레질리먼시에 뛰어난 실력자였어. 당시 머글 혈통 학생들을 매우 경멸해서 입학 허가를 해서는 안 된다고 했단다. 다른 호그와트 창립자들은 그와 동의하지 않았고, 그는 학교를 떠나 다시 돌아오지 않았어.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 10
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 10
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 그리핀도르에 배정받은 학생들은 용기 있고, 대담하며, 기사도 정신이 있단다. 그리핀도르를 상징하는 동물은 사자이고, 상징하는 색은 붉은색과 금색이야. 니콜라스 드 밈시포핑턴 경 또는 '목이 달랑달랑한 닉'이 그리핀도르 기숙사 유령이야.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 후플푸프는 4개의 기숙사 중 가장 포용적이야. 특별한 능력보다는 성실함, 헌신, 인내심, 공정함을 중시하지. 후플푸프를 상징하는 동물은 오소리이고, 노란색과 검은색이 상징하는 색이야. 후플푸프 기숙사 사감은 포모나 스프라우트이고 뚱보 수도사가 기숙사 유령이야.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 래번클로 기숙사 학생들은 지혜, 지식, 그리고 재치가 있지. 래번클로를 상징하는 동물은 독수리이고, 파란색과 청동색이 상징 색이야. 래번클로 기숙사 사감은 필리우스 플리트윅이고 기숙사 유령은 '회색 숙녀' 헬레나 래번클로야.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 슬리데린에 배정된 학생들은 교활하고, 수단이 좋고, 야망에 가득 차 있어. 슬리데린 학생들은 리더를 세우고 함께 모여 다니는 경향이 있는데, 슬리데린의 야심을 잘 보여주지. 그 예시로는 드레이코 말포이 친구들이나 죽음을 먹는 자들이 있단다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 6
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 6
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트에서는 많은 과목을 가르친단다. 공통 과목은 천문학, 일반 마법, 어둠의 마법 방어법, 비행, 약초학, 마법의 역사, 마법약, 그리고 변환 마법이 있어. 그 외는 선택 과목이지. 연금술, 순간이동, 숫자점, 마법 생물 돌보기, 점술, 머글학, 그리고 고대 룬문자 연구 수업이 있단다. \"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 10
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 오전 7시 30분에 연회장에서 아침 식사로 호그와트의 하루는 시작돼. 아침 식사 중에 우편물이 도착하지. 점심시간 전에 두 개의 수업이 있는데 기숙사마다 다르단다. 점심 식사 후에는 휴식시간과 두 개의 오후 수업이 더 있어. 저녁식사는 연회장에 하고, 그 이후에 학생들은 공부와 사교 시간을 위해 기숙사 휴게실에서 시간을 보내.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 성 주변에는 경사가 진 잔디밭과, 꽃밭, 그리고 채소밭이 있어. 검은 호수와 금지된 숲, 여러 온실과 다른 건물들과 퀴디치 경기장이 있지. 그리고 부엉이장이 있는데 학교 부엉이와 학생들의 부엉이가 살고 있단다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트 성 안에 수많은 탑과 터렛 그리고 매우 깊은 지하 던전 사이를 142개의 움직이는 계단으로 이어져 있어. 이 계단들은 움직인단다. 나도 모르는 비밀 통로나 마법도 많아.\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 2
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 여러 사람이 교장직을 맡았단다. 마지막 5명으로는 내 전임자였던 아만도 디펫, 그 전은 피니어스 나이젤러스 블랙, 브루투스 스크림저, 몰디쿠스 에그와 월터 아르곤이 있었어.\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 내 담당 과목은 변형 마법이었어. 몇 년 동안 호그와트에서 변형 과목으로 가르쳤고 '오늘의 변형 마법'이라는 학술지에 칼럼니스트였단다. 사물이나 사람의 형태를 바꾸는 마법이야.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 호그와트 이외에도 많은 마법학교가 있지. 예를 들어, 보바통 마법학교나 덤스트랭 마법학교가 있고, 다른 학교도 많단다.\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"≤ 보바통 마법학교에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 27
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"≤ 덤스트랭 마법학교에 대해 얘기해주세요\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 26
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=3}] run data merge entity @s {CustomName:"{\"text\":\"≤ 다른 마법학교와 교류하나요?\"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=3}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 28
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=4}] run data merge entity @s {CustomName:"{\"text\":\" 또 질문이 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=4}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------

#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 4
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 덤스트랭 마법학교는 스칸디나비아 최북단에 위치해있어. 1294년에 세워진 학교로 트라이위저드 시합에 참가하는 학교 중 하나이지. 어둠의 마법을 정규 수업으로 가르친단다.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 25
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 보바통은 프랑스 남부 피레네 산맥에 위치한 마법학교야. 대부분의 학생이 프랑스인이지만, 스페인, 포르투갈, 네덜란드, 룩셈부르크, 벨기에 국적의 학생들도 꽤 된다고 해. 학교 문장은 방패 위에 세 개의 별이 반짝이고 황금빛 마법 지팡이 두 개가 교차되어 있는 모양이란다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 25
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 25
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 트라이위저드 시합은 유럽의 대표 마법학교인 호그와트, 보바통, 덤스트랭이 모여 5년마다 한 번씩 실력을 겨루는 시합이야. 한 명씩 학교 대표 학생으로 선발되어 온갖 위험한 시험을 치르게 되는 거야. 우승한 학교는 트라이위저드 트로피가 주어져.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 25
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 25
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 멀린 훈장은 중세 시대 대마법사였던 멀린에 의해 만들어졌어. 멀린은 마법사와 마녀가 머글들을 도와야 한다고 믿었고, 머글에게 마법 사용에 대한 규칙을 확립했어.\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 니콜라스 플라멜은 유명한 연금술사야. 불로장생의 약으로 690년이나 살았지. 아내 페르넬과 함께 마법사의 돌을 이용해 불로장생의 약을 만들었어.\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 나는 1892년 가을에 호그와트에 다니기 시작했고 그리핀도르 기숙사에 배정받았었단다.\\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader
 
################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" ... 리무스 루핀 교수가 어둠의 마법 방어술을 가르치고, 루비우스 해그리드가 마법 생명체 돌보기를 가르치고, 시빌 트릴로니 교수가 점술을 가르치고 오로라 시니스트라 교수가 천문학을 가르치고, 베데스다 베블링 교수가 고대 룬문자 연구 수업을 가르치고, 채러티 벌베이지 교수가 머글학을 가르치고, 마지막으로 커스버트 빈스 교수가 마법의 역사를 가르친단다.\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 2
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 5
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아르만 디핏이 돌아가시기 전에 교장직을 넘겨받았어. 그전에는 변형 마법 교수로 일하고 있었지. 내 후임으로는 미네르바 맥고나걸 교수가 교장직을 이어받았어.\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 지금 그 말이 사실이라면, 볼드모트의 추종자들이 다시 모이고 있다는 거구나. 우리도 빠르게 움직여야겠어. 호그와트에 지내면서 네 능력을 충분히 증명해냈구나. 나이가 들면 어리석게도 젊은이들을 과소평가하게 되지. 이제 네가 해낼 거라 믿어:\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 35
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 오래전에 나는 볼드모트와 그의 추종자에 대항하기 위해 '불사조 기사단'이라는 비밀 결사단을 설립했어. 어서 그곳으로 가보도록 해. 런던에 그리몰드가 12번지로 가서 앨리스터 무디와 대화하렴. 나에게 말한 내용을 그에게도 알려줘. 지금 바로 출발해! 날 실망시키지 않을 거라 믿는다.\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 그리몰드 가 12번지로 갈게요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @s add hasSpokenToDumbledoreAboutDeathEaterAttack
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 34
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 우리는 즉시 행동해야 해요!\\n\"}"}
# execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\"±ˈˈ 그리몰드 가 12번지로 갈게요 \"}",Tags:["_____Normal_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=2}] run data merge entity @s {CustomName:"{\"text\":\"다른 할 일이 있어요\"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=2}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 2
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState -1
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
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 안타깝지만 내 걱정이 현실이 되는 것 같구나. 어두운 시대가 다가오고 있어. 하지만 오직 한 사람이라도 빛을 밝히는 것을 기억한다면 가장 어두운 시기에도 행복이 찾아올 거란다. \\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 38
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 1
tag @s remove use
tag @s remove trg
#===============================

################################################################################################
##################################### Conversation State 38 #####################################
################################################################################################

tag @s[scores={convState=38},tag=drawOptions] add use
tag @s[scores={convState=38},tag=triggerOption,tag=!drawOptions] add trg


################################
##### Conversation Header ######
################################
execute if entity @s[tag=use,scores={house=1}] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\"아아... 완전히 물리칠 수는 없어도 악을 막을 수 있으려면 계속 싸우고, 또 싸워야 해. \\n 네가 상황을 정리하는 데 큰 일을 해주었구나. 그러한 행동은 보상을 받아야지. 그리핀도르에게 60점. \\n\"}"}
execute if entity @s[tag=use,scores={house=2}] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아아... 완전히 물리칠 수는 없어도 악을 막을 수 있으려면 계속 싸우고, 또 싸워야 해. \\n 네가 상황을 정리하는 데 큰 일을 해주었구나. 그러한 행동은 보상을 받아야지. 래번클로에게 50점. \\n\"}"}
execute if entity @s[tag=use,scores={house=3}] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아아... 완전히 물리칠 수는 없어도 악을 막을 수 있으려면 계속 싸우고, 또 싸워야 해. \\n 네가 상황을 정리하는 데 큰 일을 해주었구나. 그러한 행동은 보상을 받아야지. 후플푸프에게 50점. \\n\"}"}
execute if entity @s[tag=use,scores={house=4}] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 아아... 완전히 물리칠 수는 없어도 악을 막을 수 있으려면 계속 싸우고, 또 싸워야 해. \\n 네가 상황을 정리하는 데 큰 일을 해주었구나. 그러한 행동은 보상을 받아야지. 슬리데린에게 50점. \\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 39
#-------------------------------



#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 37
tag @s remove use
tag @s remove trg
#===============================


################################################################################################
##################################### Conversation State 39 #####################################
################################################################################################

tag @s[scores={convState=39},tag=drawOptions] add use
tag @s[scores={convState=39},tag=triggerOption,tag=!drawOptions] add trg


################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"[{\"text\":\" 이제 호그와트에서 있는 동안 네가 사용하는 것을 허락 하마. \"},{\"text\":\"펜시브야.\",\"color\":\"gold\",\"bold\":\"true\"},{\"text\":\" 여기 내 사무실에 있단다. \\n\\n 자신의 복잡한 기억을 꺼내 병에 담아두고, 나중에 들여다볼 수 있어. 그럼 기억을 다시 체험할 수 있게 되는 거지. \"}]"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState 40
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 38
tag @s remove use
tag @s remove trg
#===============================


################################################################################################
##################################### Conversation State 40 #####################################
################################################################################################

tag @s[scores={convState=40},tag=drawOptions] add use
tag @s[scores={convState=40},tag=triggerOption,tag=!drawOptions] add trg


################################
##### Conversation Header ######
################################
execute if entity @s[tag=use] as 0-0-6-0-9 run data merge entity @s {CustomName:"{\"text\":\" 이제 네가 할 일을 다해주었구나. 남은 시간 동안 호그와트에서 평화롭게 즐기렴. \\n\\n\\n\\n\"}"}
execute if entity @s[tag=use] run tag @s add longHeader

################################
##### Conversation Options #####
################################
#-------------------------------
execute as @s[tag=use] as @e[type=armor_stand,limit=1,scores={con=1}] run data merge entity @s {CustomName:"{\"text\":\" ... \"}",Tags:["_____Return_____","_____click_____","convOption","i"]}
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] run tag @s add hasSpokenToDumbledoreAboutAzkaban
execute as @s[tag=trg] as @e[type=armor_stand,limit=1,scores={con=1}] as @s[tag=convSelected] as @p[tag=activePlayer,scores={tmp=0}] store success score @s tmp run scoreboard players set @s convState -1
#-------------------------------


#===============================
# Number of options
scoreboard players set @s[tag=use,tag=!inInventory] convMaxView 1
#-------------------------------
# Back conversation state (when player presses shift. 1 is exit conversation)
scoreboard players set @s[tag=use] backConvState 39
tag @s remove use
tag @s remove trg
#===============================