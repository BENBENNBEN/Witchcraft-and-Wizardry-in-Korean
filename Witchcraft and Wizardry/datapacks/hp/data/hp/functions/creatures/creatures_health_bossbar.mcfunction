# Name
execute if entity @s[tag=bossBarCreatureFocus,tag=trollCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"트롤","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=trollCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"트롤","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=trollCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"트롤","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=trollCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"트롤","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=deathEaterCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"죽음을 먹는 자들","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=deathEaterCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"죽음을 먹는 자들","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=deathEaterCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"죽음을 먹는 자들","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=deathEaterCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"죽음을 먹는 자들","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=flubberwormCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"플로버웜","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=flubberwormCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"플로버웜","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=flubberwormCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"플로버웜","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=flubberwormCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"플로버웜","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"두꺼비","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature,scores={toadType=5..8}] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"독두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature,scores={toadType=5..8}] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"독두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature,scores={toadType=5..8}] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"독두꺼비","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=toadCreature,scores={toadType=5..8}] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"독두꺼비","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=monsterBookCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"괴물들에 관한 괴물책","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=monsterBookCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"괴물들에 관한 괴물책","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=monsterBookCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"괴물들에 관한 괴물책","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=monsterBookCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"괴물들에 관한 괴물책","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=armorSuitCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"마법에 걸린 갑옷","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=armorSuitCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"마법에 걸린 갑옷","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=armorSuitCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"마법에 걸린 갑옷","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=armorSuitCreature,tag=!keyBearer] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"마법에 걸린 갑옷","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=keyBearer] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"열쇠 지킴이","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=keyBearer] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"열쇠 지킴이","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=keyBearer] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"열쇠 지킴이","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=keyBearer] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"열쇠 지킴이","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"마법에 걸린 해골","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"마법에 걸린 해골","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"마법에 걸린 해골","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"마법에 걸린 해골","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonArcherCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"마법에 걸린 해골 궁수","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonArcherCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"마법에 걸린 해골 궁수","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonArcherCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"마법에 걸린 해골 궁수","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonArcherCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"마법에 걸린 해골 궁수","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonSwordsmanCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"마법에 걸린 해골 검사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonSwordsmanCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"마법에 걸린 해골 검사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonSwordsmanCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"마법에 걸린 해골 검사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=skeletonSwordsmanCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"마법에 걸린 해골 검사","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=largeSpiderCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"큰 거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=largeSpiderCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"큰 거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=largeSpiderCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"큰 거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=largeSpiderCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"큰 거미","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=smallSpiderCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"독거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=smallSpiderCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"독거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=smallSpiderCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"독거미","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=smallSpiderCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"독거미","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=poltergeistCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"폴터가이스트","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=poltergeistCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"폴터가이스트","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=poltergeistCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"폴터가이스트","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=poltergeistCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"폴터가이스트","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=darkSpiritCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"어둠의 영혼","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkSpiritCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"어둠의 영혼","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkSpiritCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"어둠의 영혼","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkSpiritCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"어둠의 영혼","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=pixieCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"픽시","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=pixieCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"픽시","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=pixieCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"픽시","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=pixieCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"픽시","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=ratCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"쥐","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=ratCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"쥐","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=ratCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"쥐","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=ratCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"쥐","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=darkWizardCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"어둠의 마법사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkWizardCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"어둠의 마법사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkWizardCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"어둠의 마법사","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=darkWizardCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"어둠의 마법사","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=murtlapCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"머트랩","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=murtlapCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"머트랩","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=murtlapCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"머트랩","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=murtlapCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"머트랩","color":"white"}

execute if entity @s[tag=bossBarCreatureFocus,tag=grindylowCreature] as @p[tag=activePlayer,scores={playerID=2}] run bossbar set minecraft:player2enemy name {"text":"그린딜로","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=grindylowCreature] as @p[tag=activePlayer,scores={playerID=1}] run bossbar set minecraft:player1enemy name {"text":"그린딜로","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=grindylowCreature] as @p[tag=activePlayer,scores={playerID=3}] run bossbar set minecraft:player3enemy name {"text":"그린딜로","color":"white"}
execute if entity @s[tag=bossBarCreatureFocus,tag=grindylowCreature] as @p[tag=activePlayer,scores={playerID=4}] run bossbar set minecraft:player4enemy name {"text":"그린딜로","color":"white"}

# Max
execute store result score @p[tag=activePlayer] tmp run scoreboard players get @s maxHealth
scoreboard players set @p[tag=activePlayer] tmp2 3
execute as @p[tag=activePlayer,scores={playerID=1}] store result bossbar player1enemy max run scoreboard players operation @s tmp *= @s tmp2
execute as @p[tag=activePlayer,scores={playerID=2}] store result bossbar player2enemy max run scoreboard players operation @s tmp *= @s tmp2
execute as @p[tag=activePlayer,scores={playerID=3}] store result bossbar player3enemy max run scoreboard players operation @s tmp *= @s tmp2
execute as @p[tag=activePlayer,scores={playerID=4}] store result bossbar player4enemy max run scoreboard players operation @s tmp *= @s tmp2

execute if score @s creatureHealth = @s maxHealth run tag @p[tag=activePlayer] add fullHealth

# Value
execute as @p[tag=activePlayer,scores={playerID=1}] store result score @s creatureHealth run bossbar get minecraft:player1enemy max
execute as @p[tag=activePlayer,scores={playerID=2}] store result score @s creatureHealth run bossbar get minecraft:player2enemy max
execute as @p[tag=activePlayer,scores={playerID=3}] store result score @s creatureHealth run bossbar get minecraft:player3enemy max
execute as @p[tag=activePlayer,scores={playerID=4}] store result score @s creatureHealth run bossbar get minecraft:player4enemy max
scoreboard players operation @p[tag=activePlayer] creatureHealth /= @p[tag=activePlayer] tmp2
scoreboard players operation @p[tag=activePlayer] creatureHealth += @s creatureHealth
execute as @p[tag=activePlayer,scores={playerID=1}] store result bossbar minecraft:player1enemy value run scoreboard players get @s[tag=!fullHealth] creatureHealth
execute as @p[tag=activePlayer,scores={playerID=2}] store result bossbar minecraft:player2enemy value run scoreboard players get @s[tag=!fullHealth] creatureHealth
execute as @p[tag=activePlayer,scores={playerID=3}] store result bossbar minecraft:player3enemy value run scoreboard players get @s[tag=!fullHealth] creatureHealth
execute as @p[tag=activePlayer,scores={playerID=4}] store result bossbar minecraft:player4enemy value run scoreboard players get @s[tag=!fullHealth] creatureHealth

# If full health (helps because the health bar is a bit too wide)
execute as @p[tag=activePlayer,scores={playerID=1}] as @s[tag=fullHealth] store result bossbar player1enemy value run bossbar get minecraft:player1enemy max
execute as @p[tag=activePlayer,scores={playerID=2}] as @s[tag=fullHealth] store result bossbar player2enemy value run bossbar get minecraft:player2enemy max
execute as @p[tag=activePlayer,scores={playerID=3}] as @s[tag=fullHealth] store result bossbar player3enemy value run bossbar get minecraft:player3enemy max
execute as @p[tag=activePlayer,scores={playerID=4}] as @s[tag=fullHealth] store result bossbar player4enemy value run bossbar get minecraft:player4enemy max
tag @p[tag=activePlayer] remove fullHealth


# If tracked creature is dead
execute as @s[scores={creatureFocus=20..}] unless entity @e[tag=bossBarCreatureFocus] run scoreboard players set @s creatureFocus 20

# Vera Verto Blink on stunned suit of armor
execute if entity @s[tag=isStunned] run scoreboard players add @p[tag=activePlayer] veraVertoBossbar 1
execute unless entity @s[tag=isStunned] run scoreboard players set @p[tag=activePlayer,tag=blueVeraVertoBossBar] veraVertoBossbar 10