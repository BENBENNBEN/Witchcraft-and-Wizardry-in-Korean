#  Platform Nine and Three-Quarters
execute if entity @s[scores={InvItemID=37,mapUnlocked=1..}] as @e[type=armor_stand,tag=focusInventoryOption,limit=1] run data merge entity @s {CustomName:"[\"\",{\"text\":\"  ˈˈˈˈˈˈˈˈˈ     \",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"9와 4분의 3 승강장\",\"color\":\"gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"}]"}
execute if entity @s[scores={InvItemID=37,mapUnlocked=1..},tag=!invInspectItem] as @e[type=armor_stand,tag=focusInventoryOption,tag=selected,limit=1] run data merge entity @s {CustomName:"[\"\",{\"text\":\"  ˈˈˈˈˈˈˈˈˈ  ˈˈ\"},{\"text\":\">>\",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"gray\"},{\"text\":\"9와 4분의 3 승강장\",\"color\":\"white\",\"underlined\":true},{\"text\":\"] \",\"color\":\"gray\"},{\"text\":\"<<\",\"color\":\"gray\"}]"}
execute if entity @s[scores={InvItemID=37,mapUnlocked=0}] as @e[type=armor_stand,tag=focusInventoryOption,limit=1] run data merge entity @s {CustomName:"[\"\",{\"text\":\"       \",\"color\":\"gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"9와 4분의 3 승강장\",\"color\":\"dark_gray\"},{\"text\":\"] ˈˈˈˈˈˈˈˈˈˈ\",\"color\":\"dark_gray\"}]"}
execute if entity @s[scores={InvItemID=37,mapUnlocked=0},tag=!invInspectItem] as @e[type=armor_stand,tag=focusInventoryOption,tag=selected,limit=1] run data merge entity @s {CustomName:"[\"\",{\"text\":\"    ˈˈ\"},{\"text\":\">>\",\"color\":\"dark_gray\"},{\"text\":\" [\",\"color\":\"dark_gray\"},{\"text\":\"9와 4분의 3 승강장\",\"color\":\"dark_gray\",\"underlined\":true},{\"text\":\"] \",\"color\":\"dark_gray\"},{\"text\":\"<<\",\"color\":\"dark_gray\"}]"}
execute if entity @s[scores={InvItemID=37},tag=invInspectItem] as @e[type=armor_stand,tag=focusInventoryOption,tag=selected,limit=1] run data merge entity @s {CustomName:"[\"\",{\"text\":\"\"},{\"text\":\"9와 4분의 3 승강장\",\"color\":\"gold\",\"bold\":true}]",Tags:["_____destinationPlatfromNineAndThreeQuarters_____","inventoryOption","fastTravel","focusInventoryOption","inspectedItem"]}