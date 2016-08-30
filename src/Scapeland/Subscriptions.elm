module Scapeland.Subscriptions exposing (subscriptions, World, Msg(..), makeComparable, initWorld, updateWorld)

import Mouse
import Set exposing (Set)
import Keyboard exposing (KeyCode)


type alias World =
    { mousePosition : Mouse.Position
    , keysDown : Set KeyCode
    }


subscriptions =
    Sub.batch [ Mouse.moves MousePosition, Keyboard.downs KeyDown, Keyboard.ups KeyUp ]


type Msg
    = MousePosition Mouse.Position
    | KeyDown KeyCode
    | KeyUp KeyCode


makeComparable msg =
    case msg of
        MousePosition _ ->
            "MousePosition"

        KeyDown _ ->
            "Key"

        KeyUp _ ->
            "Key"


initWorld : World
initWorld =
    { mousePosition = { x = 0, y = 0 }
    , keysDown = Set.empty
    }


updateWorld : Msg -> World -> World
updateWorld msg world =
    case msg of
        MousePosition x ->
            { world | mousePosition = x }

        KeyDown k ->
            { world | keysDown = Set.insert k world.keysDown }

        KeyUp k ->
            { world | keysDown = Set.remove k world.keysDown }
