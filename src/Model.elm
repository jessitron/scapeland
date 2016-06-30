module Model exposing (Model, init)

import Mouse
import Debug.Model


type alias Model =
    { mousePosition : Mouse.Position
    , debug : Debug.Model.Model
    }


init : Model
init =
    { mousePosition = { x = 0, y = 0 }
    , debug = Debug.Model.init
    }
