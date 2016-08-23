module Model exposing (Model, init)

import Dict
import Mouse
import ScapelandDebug.Model
import Scapeland.Model


type alias Model =
    { app : Scapeland.Model.Model
    , debug : ScapelandDebug.Model.Model
    }


init : Model
init =
    { app = Scapeland.Model.init
    , debug = ScapelandDebug.Model.init
    }
