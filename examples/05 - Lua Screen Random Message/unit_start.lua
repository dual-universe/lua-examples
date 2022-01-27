-- Add to programming board's unit.start() and connect it to this screen.

local messages = {
    "Hi, I am a message!",
    "Yes hello this is Lua Screen.",
    "We love Pops the Hamster!",
    "WARNING: No warnings found.",
    "I am a screen unit.",
    "Are you enjoying this?",
    "Pending Screen Operations",
    "Lua Screen Units o/",
    "It is NOT NQ-Node\'s fault.",
    "Knock knock...",
    "Who's there?",
    "Ran out of Knock knock jokes.",
    "It is all NQ-Deckard\'s fault."
}

local message = messages[math.random(1, #messages)]

local params = {
    message = message,
    testNumber = 1.337,
    testStr = 'hello I am a string',
    testTable = {x = 1, y = 0, k = {1, 2, 3, 4}},
}

screen.setScriptInput(json.encode(params))
unit.exit()