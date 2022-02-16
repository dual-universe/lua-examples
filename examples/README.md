# Examples
## Table of contents
 - [Lua screen basic examples](#lua-screen-basic-examples)
    - Simple text
    - Checkerboard
    - Bouncing ball
 - [Lua screen advanced examples](#lua-screen-advanced-examples)
    - Screen entropy
    - Radial Menu
 - [Lua screen widget examples](#lua-screen-widget-examples)
    - Slider widgets
    - Toggle buttons
 - [Lua Screen Interaction](#lua-screen-interaction)
    - Light control
    - Random screen message
 - [NQ Lua libraries](#nq-lua-libraries)
    - Event library
 - [Complete examples](#complete-examples)
    - Atlas screen

## Lua screen basic examples
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/01%20-%20Lua%20Screen%20Basic%20Examples/img/simpleText.jpg" width="30%"/><img src="https://github.com/dual-universe/lua-examples/blob/main/examples/01%20-%20Lua%20Screen%20Basic%20Examples/img/checkerboard.jpg" width="30%"/><img src="https://github.com/dual-universe/lua-examples/blob/main/examples/01%20-%20Lua%20Screen%20Basic%20Examples/img/bouncingBall.jpg" width="30%"/>

These examples are simple examples of using Lua screens. They are intended to show basic use cases.

### Simple text
 - One of the first things you will want to do on a Lua screen is to display text! So here is an example of how to simply display pieces of text on the screen.
Note that in this example we are writing lines from a hard-coded array of lines, but you have a `getTextWrapped` function in the `rslib` library to split your text according to a width limit.
### Checkerboard
 - An example of use to repeat a pattern or shape across the screen.
### Bouncing ball
 - Animation is a whole area of use for Lua screens. This example shows you how to animate a simple ball with a track, bouncing off the edges of the screen.

[Go to the examples](https://github.com/dual-universe/lua-examples/tree/main/examples/01%20-%20Lua%20Screen%20Basic%20Examples)

## Lua screen advanced examples
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/02%20-%20Lua%20Screen%20Advanced%20Examples/img/entropy.jpg" width="30%"/><img src="https://github.com/dual-universe/lua-examples/blob/main/examples/02%20-%20Lua%20Screen%20Advanced%20Examples/img/radialMenu.jpg" width="30%"/>

These examples are advanced examples of using Lua screens. They are intended to show a more complex use than the previous one.

### Screen entropy
 - If you were wondering what kind of complexity you can do with the Lua screen, here is an example of a moving random circle generator.
### Radial Menu
 - The main interaction with a screen is with the mouse and your character's eyes. So here is an example of a radial menu, a perfect example of a relatively complex interactive form.

[Go to the examples](https://github.com/dual-universe/lua-examples/tree/main/examples/02%20-%20Lua%20Screen%20Advanced%20Examples)

## Lua screen widget examples
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/03%20-%20Lua%20Screen%20Widgets%20Objects/img/sliders.jpg" width="30%"/><img src="https://github.com/dual-universe/lua-examples/blob/main/examples/03%20-%20Lua%20Screen%20Widgets%20Objects/img/toggle.jpg" width="30%"/>

These examples are examples of ui widgets done with Lua screens. They are intended to show you some typical object structure for interfaces.

### Slider widgets
- An example of a cursor widget made in pure Lua to allow you to define values in a range of values. In this case, it allows you to control the background color.
### Toggle buttons
- An example of a toggle button, a useful widget element for interface design in Lua. In this case, the use of a toggle button we recommend its status in the Lua chat.

[Go to the examples](https://github.com/dual-universe/lua-examples/tree/main/examples/03%20-%20Lua%20Screen%20Widgets%20Objects)

## Lua Screen Interaction
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/04%20-%20Lua%20Screen%20Light%20Control/img/lightControl.jpg" width="30%"/><img src="https://github.com/dual-universe/lua-examples/blob/main/examples/05%20-%20Lua%20Screen%20Random%20Message/img/randomMessage.jpg" width="30%"/>

These examples are intended to show you how to do interactions between screens and other elements.

### Light control
- This example shows you a concrete use of an interface widget developed for this example; a button. In this case, it will show you one of the many ways to interact with other elements using a screen unit and a programming board.

[Go to the example](https://github.com/dual-universe/lua-examples/tree/main/examples/04%20-%20Lua%20Screen%20Light%20Control)
### Random screen message
- This example shows you another way of interacting between a screen unit and other elements. But this time we will do the opposite of the previous example Lua Screen Light Control. To be clear, in this case we are going to show you how to interact between the programming board and the screen by sending it a message and the player username.

[Go to the example](https://github.com/dual-universe/lua-examples/tree/main/examples/05%20-%20Lua%20Screen%20Random%20Message)

## NQ Lua libraries
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/06%20-%20Event%20Library%20Screen/img/event.jpg" width="30%"/>

These examples are examples of application of libraries implemented by Novaquark. They are intended to show you how to use them.

### Event library on screen
- Interactivity is a key point in using the screens. For this you could tackle several different strategies, however to help the less experienced we have added a Lua library to the game. This library is intended to provide a simple integration of events covering various uses. In this case, you will see a modified version of the button example made in Lua Screen Light Control, to include events such as :
  - onPressed: triggered when the button is pressed
  - onDown: triggered when the button is hold down
  - onReleased: triggered when the button is released
  - onHover: triggered when the button is hovered
  - onLeave: triggered when the button is leave

[Go to the example](https://github.com/dual-universe/lua-examples/tree/main/examples/06%20-%20Event%20Library%20Screen)

## Complete examples
<img src="https://github.com/dual-universe/lua-examples/blob/main/examples/Atlas%20Library%20Screen/img/atlas.jpg" width="30%"/>

These examples are examples of concrete application of libraries implemented by Novaquark. They are intended to show you how to use them.

### Atlas library Screen
- After a few simple and practical examples, this is the first example of a complete system; an Atlas screen. This screen allows you to display information about the stellar bodies in the Helios system. This is a concrete example of the use of all the previous examples

[Go to the example](https://github.com/dual-universe/lua-examples/tree/main/examples/Atlas%20Library%20Screen%20Screen)