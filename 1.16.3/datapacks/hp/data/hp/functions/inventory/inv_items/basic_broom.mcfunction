execute if entity @s[tag=selected] run scoreboard players set @p[tag=activePlayer] inspectSound 13
execute as @s run scoreboard players set @s money 1000
execute if entity @s[tag=selected] run scoreboard players set @p[tag=activePlayer] inspectType 5
execute if entity @p[tag=activePlayer,tag=buy] if score @s money > @p[tag=activePlayer] money run tag @s add cantAffordItem
execute as @s[tag=!cantAffordItem] run data merge entity @s {CustomName:"[\"\",{\"text\":\"   \",\"color\":\"dark_gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"일반 빗자루\",\"color\":\"gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"},{\"text\":\"                 ˈˈˈˈ        \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"1000\",\"color\":\"gray\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute if entity @p[tag=activePlayer,tag=!invInspectItem] as @s[tag=!cantAffordItem,tag=selected] run data merge entity @s {CustomName:"[\"\",{\"text\":\"ˈˈ\"},{\"text\":\">>\",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"gray\"},{\"text\":\"일반 빗자루\",\"color\":\"white\",\"underlined\":true},{\"text\":\"] \",\"color\":\"gray\"},{\"text\":\"<<\",\"color\":\"gray\"},{\"text\":\"                 ˈˈˈˈ        \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"1000\",\"color\":\"gray\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute as @s[tag=cantAffordItem] run data merge entity @s {CustomName:"[\"\",{\"text\":\"   \",\"color\":\"dark_gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"일반 빗자루\",\"color\":\"dark_gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"},{\"text\":\"                 ˈˈˈˈ        \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"1000\",\"color\":\"red\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute if entity @p[tag=activePlayer,tag=!invInspectItem] as @s[tag=cantAffordItem,tag=selected] run data merge entity @s {CustomName:"[\"\",{\"text\":\"ˈˈ\"},{\"text\":\">>\",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"gray\"},{\"text\":\"일반 빗자루\",\"color\":\"dark_gray\",\"underlined\":true},{\"text\":\"] \",\"color\":\"gray\"},{\"text\":\"<<\",\"color\":\"gray\"},{\"text\":\"                 ˈˈˈˈ        \"},{\"text\":\"(\",\"color\":\"dark_gray\"},{\"text\":\"1000\",\"color\":\"red\",\"italic\":\"true\"},{\"text\":\")\",\"color\":\"dark_gray\"}]"}
execute as @s[tag=!cantAffordItem] as @e[type=armor_stand,tag=focusInventoryIcon,limit=1] run data merge entity @s {CustomName:"[{\"text\":\"   \"}]"}
execute as @s[tag=cantAffordItem] as @e[type=armor_stand,tag=focusInventoryIcon,limit=1] run data merge entity @s {CustomName:"[{\"text\":\"   \"}]"}