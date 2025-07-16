# FFXI-Dream-UI

![Screenshot](UI%20Example.png)

## ■ Features:

- **FFXI Hotbar**
<br>Addon from: SirEdeonX/Akirane
<br><br>Displays your spells, abilities and shortcuts, which can be used with 1, CTRL+1, Shift+1, Alt+1, etc. or clicked with mouse.
<br>You can swap between two different sets with a key (default: "\") and more hotbars can be added and turned horizontal or vertical.

- **Enemybar2:**
  <br>Addon from: mmckee,akaden
  <br><br>Displays target HP bar with its current target and distance.
  <br>It also shows all the monsters currently aggroed by the party.

- **InfoHUD:**
  <br>Addon from: DreamEyes
  <br><br>Custom HUD to display your hit accuracy %, miss and critical hit %.
  <br>It displays your current Engage and Idle set (from your GearSwap lua) and shows whether AutoWS mode is enabled or not.
  <br> It also displays your current roll, lucky and unlucky numbers as Corsair.

- **EquipViewer:**
  <br>Addon from: Tako, Rubenator
  <br><br>Displays your current gear.

- **Minimap (FFXIDB):**
  <br>Displays a minimap of your current area (even if you don't own the map).

- **Inventory Tracking (FindAll):**
  <br>Addon from: Zohno
  <br><br>Displays your current inventory count and items you want to track.
  <br>You can also look for any items and their location with the command //findall <Item Name>".

- **Party members list (XivParty):**
<br>Addon from: Tylas
<br><br>Displays the party member list with their job. Can be customised and display their buff/debuff as well.

- **Timers:**
<br>Displays abilities on cooldown.

- **ZoneName:**
<br>Addon from: onimitch
<br>Displays the name of the area upon zoning.

## ■ How to install:

- Copy all the addon folders to the Windower4\Addon\ folder.
- Copy all the plugin files and folders to the Windower4\Plugin folder.
- In Windower4\scripts\init.txt, add the following below the "Load plugins" section to start the addons automatically on startup:
<pre>
load Timers
lua load EquipViewer
lua load xivhotbar
lua load xivparty
lua load zonename
lua load enemybar2
lua load infohud
</pre>

## ■ How to set up:

These addons often have a lot of customisation options and have already been tweaked for this UI.

The main setting you will have to change is the position of the addons since they may not match my resolution (1920*1080) or UI Scale (x1).

Below is how you can adjust the position settings inidividually. If you want to learn more about each addon, I added the links to the owner's documentation.

| **Addon** | **Instruction** |
|---|---|
| **[FFXIV Hotbar](https://github.com/Akirane/XIVHotbar)** | • Open `addons\XIVHotbar\data\settings.xml`<br>• Adjust position inside the `<Offsets>` tag. |
| **[Enemybar2](https://github.com/AkadenTK/enemybar2)** | • Open `addons\enemybar2\data\settings.xml`<br>• Adjust position inside the `</target_bar>` tag. |
| **[InfoHUD](https://github.com/Noduko/InfoHUD)** | • Open `addons\InfoHUD\data\settings.xml`<br>• Adjust `x` and `y` positions or drag HUD in-game and type `//infohud save`. |
| **[EquipViewer](https://github.com/Windower/Lua/tree/live/addons/equipviewer)** | • Open `addons\EquipViewer\data\settings.xml`<br>• Adjust position inside the `<pos>` tag. |
| **[Minimap](https://docs.windower.net/plugins/ffxidb/)** | • Adjust position in-game by dragging the map to your preferred location. |
| **[FindAll (Inventory Tracking)](https://github.com/Windower/Lua/tree/live/addons/findAll)** | • Open `addons\FindAll\data\settings.xml`<br>• Adjust position inside the `<pos>` tag. |
| **[XivParty (Party List)](https://github.com/Tylas11/XivParty)** | • Open `addons\XivParty\data\settings.xml`<br>• Adjust position inside the `<pos>` tag or type `//xivparty setup` in-game to move/resize with the mousewheel. |
| **[Timers](https://docs.windower.net/plugins/timers/)** | • Open `plugins\settings\Timers.xml`<br>• Adjust X/Y positions in `<RecastX>, <RecastY>, <BuffX>, <BuffY>` tags. |
| **[ZoneName](https://github.com/onimitch/ffxi-zonename)** | • Open `addons\zonename\data\settings.xml`<br>• Adjust position inside the `<pos>` tag. |



## ■ Bonus - GearSwap templates:

If you'd like to use GearSwap to automatically swap your gear when using abilities/weapon skills or add custom bindings etc., I've added my own lua for my current jobs AND a template file you can use to make your own (with instructions in the code).  
My lua is meant to be easy to use and is not as granular as some more advanced lua.

GearSwap lua files are located in `Addons\GearSwap\Data\`

If you want to use it, make a copy of the template.lua file and name it with your job (e.g. THF, NIN, etc.). Then add all your gear for each set.

My GearSwap lua stucture:
<pre>
1. Macro Book selection & Lockstyle
2. Key Bindings
   ↳ JA / Gear Swap / Utility
3. Gear Sets
   ↳ Weapon Sets
   ↳ Idle Sets
   ↳ TP (Engaged) Sets
   ↳ WS Sets
   ↳ JA Sets
   ↳ Item Sets
4. Core GearSwap Functions
   ↳ precast / aftercast / status_change
5. Self Commands (Hotkey Actions)
6. InfoHUD Updates (from the addon InfoHUD)
</pre>

**Tip:**  
You can equip your set in game, then type `//gs export` to automatically export your current gear (saved in GearSwap\data\export) so you can copy/paste the set to your GearSwap lua (quicker than adding each item one by one).
