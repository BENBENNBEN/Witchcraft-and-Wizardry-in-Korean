execute if entity @s[tag=selected] run scoreboard players set @p[tag=activePlayer] inspectSound 0
execute as @s run scoreboard players set @s money 65
execute unless entity @p[tag=activePlayer,scores={clothesSlot1ID=89}] if entity @s[tag=selected] run scoreboard players set @p[tag=activePlayer] inspectType 1
execute if entity @p[tag=activePlayer,scores={clothesSlot1ID=89}] if entity @s[tag=selected] run scoreboard players set @p[tag=activePlayer] inspectType 2
execute if entity @p[tag=activePlayer,tag=buy] if score @s money > @p[tag=activePlayer] money run tag @s add cantAffordItem
execute as @s[tag=!cantAffordItem] run data merge entity @s {CustomName:"[\"\",{\"text\":\"   \",\"color\":\"dark_gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"앙증맞은 빨간 페즈 모자\",\"color\":\"gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"},{\"text\":\"                         \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"65\",\"color\":\"gray\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute if entity @p[tag=activePlayer,tag=!invInspectItem] as @s[tag=!cantAffordItem,tag=selected] run data merge entity @s {CustomName:"[\"\",{\"text\":\"ˈˈ\"},{\"text\":\">>\",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"gray\"},{\"text\":\"앙증맞은 빨간 페즈 모자\",\"color\":\"white\",\"underlined\":true},{\"text\":\"] \",\"color\":\"gray\"},{\"text\":\"<<\",\"color\":\"gray\"},{\"text\":\"                         \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"65\",\"color\":\"gray\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute as @s[tag=cantAffordItem] run data merge entity @s {CustomName:"[\"\",{\"text\":\"   \",\"color\":\"dark_gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"앙증맞은 빨간 페즈 모자\",\"color\":\"dark_gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"},{\"text\":\"                         \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"65\",\"color\":\"red\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute if entity @p[tag=activePlayer,tag=!invInspectItem] as @s[tag=cantAffordItem,tag=selected] run data merge entity @s {CustomName:"[\"\",{\"text\":\"ˈˈ\"},{\"text\":\">>\",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"gray\"},{\"text\":\"앙증맞은 빨간 페즈 모자\",\"color\":\"dark_gray\",\"underlined\":true},{\"text\":\"] \",\"color\":\"gray\"},{\"text\":\"<<\",\"color\":\"gray\"},{\"text\":\"                         \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"65\",\"color\":\"red\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute as @s[tag=!cantAffordItem] as @e[type=armor_stand,tag=focusInventoryIcon,limit=1] run data merge entity @s {CustomName:"[{\"text\":\"   \"}]"}
execute as @s[tag=cantAffordItem] as @e[type=armor_stand,tag=focusInventoryIcon,limit=1] run data merge entity @s {CustomName:"[{\"text\":\"   \"}]"}