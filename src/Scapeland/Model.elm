module Scapeland.Model exposing (Model, init)

import Mouse


type alias Model =
    { mousePosition : Mouse.Position
    }


init : Model
init =
    { mousePosition = { x = 0, y = 0 } }
