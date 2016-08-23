module Model exposing (Model, init)

import Dict
import Mouse
import ScapelandDebug.Model
import Scapeland.Subscriptions


type alias Model =
    { world : Scapeland.Subscriptions.World
    , debug : ScapelandDebug.Model.Model
    }


init : Model
init =
    { world = Scapeland.Subscriptions.initWorld
    , debug = ScapelandDebug.Model.init
    }
