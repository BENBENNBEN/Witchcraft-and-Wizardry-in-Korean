execute as @s[scores={animState=0}] run replaceitem entity @s hotbar.0 minecraft:iron_sword{AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:10,Operation:2,UUID:[I;1997641946,856640959,-1199930564,-1073699668]},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:-99999,Operation:0,UUID:[I;1997641946,856640959,-1199930564,-1073699668]}],Unbreakable:1b,display:{Name:"{\"text\":\"마법 지팡이 \",\"color\":\"gold\",\"bold\":true}"},HideFlags:63,qDetect:1b,Damage:251}
execute as @s[scores={animState=1}] run function hp:animation/wand_anim/idle_state1
execute as @s[scores={animState=2}] run function hp:animation/wand_anim/idle_state2
execute as @s[scores={animState=3}] run function hp:animation/wand_anim/idle_state3
execute as @s[scores={animState=4}] run function hp:animation/wand_anim/idle_state4
