module Fuzzer.Msg exposing (..)

import Fuzz
import Msg exposing (Msg(World))
import Scapeland.Subscriptions exposing (Msg(MousePosition))


mousePositionMessage x y =
    World (MousePosition { x = x, y = y })


assumedWindow =
    { width = 1048, height = 768 }


mousePositionX =
    xPosition assumedWindow.width


xPosition maxX =
    Fuzz.intRange 0 maxX


mousePositionY =
    yPosition assumedWindow.height


yPosition maxY =
    Fuzz.intRange 0 maxY
