module Scapeland.Subscriptions exposing (subscriptions, World, Msg(..), makeComparable, initWorld, updateWorld)

import Mouse


type alias World =
    { mousePosition : Mouse.Position
    }


subscriptions =
    Mouse.moves MousePosition


type Msg
    = MousePosition Mouse.Position


makeComparable msg =
    case msg of
        MousePosition _ ->
            "MousePosition"


initWorld : World
initWorld =
    { mousePosition = { x = 0, y = 0 } }


updateWorld : Msg -> World -> World
updateWorld msg world =
    case msg of
        MousePosition x ->
            { world | mousePosition = x }
