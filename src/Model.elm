module Model exposing (Model, init)

import Mouse
import ScapelandDebug.Model


type alias Model =
    { mousePosition : Mouse.Position
    , debug : ScapelandDebug.Model.Model
    }


init : Model
init =
    { mousePosition = { x = 0, y = 0 }
    , debug = ScapelandDebug.Model.init
    }
