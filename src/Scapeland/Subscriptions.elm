module Scapeland.Subscriptions exposing (World, initWorld)

import Mouse


type alias World =
    { mousePosition : Mouse.Position
    }


initWorld : World
initWorld =
    { mousePosition = { x = 0, y = 0 } }
