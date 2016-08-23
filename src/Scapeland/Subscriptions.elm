module Scapeland.Subscriptions exposing (subscriptions, World, Msg(..), initWorld)

import Mouse


type alias World =
    { mousePosition : Mouse.Position
    }


subscriptions =
    Mouse.moves MousePosition


type Msg
    = MousePosition Mouse.Position


initWorld : World
initWorld =
    { mousePosition = { x = 0, y = 0 } }
