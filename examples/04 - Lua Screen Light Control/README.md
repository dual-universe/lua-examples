# Lua Screen Interaction
These examples are intended to show you how to do interactions between screens and other elements.

## Light Control
![lightControl](img/lightControl.jpg)
### Description
- This example shows you a concrete use of an interface widget developed for this example; a button. In this case, it will show you one of the many ways to interact with other elements using a screen unit and a programming board.
### Requirements
- You will need:
  - A programming board
  - A screen unit
  - 3 lights (Square XS in the visual but do as you wish)
### Installation
- Firstly, for the screen unit part:
  - Place the screen unit.
  - Copy and paste the [render.lua](render.lua) into the screen content in Lua mode.
- Then, paste the [controlunit.json](controlunit.json) file on your programming board with contextual menu, or proceed manualy as below:
  - Place the programming board.
  - Create a start filter in the unit slot.
  - Paste the content of [unit_start.lua](unit_start.lua) code in.
  - Create a tick filter in the unit slot. Set the timerId argument as `output`.
  - Paste the content of [unit_tick1.lua](unit_tick1.lua) code in.
- Finaly link the three lights and screen to the programming board and name the slots in the Lua editor of the programming board as `lightRed`, `lightGreen`,`lightBlue` and finaly, the screen as `screen`.
