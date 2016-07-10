module ScapelandDebug.Model exposing (Model, init)

import Msg exposing (Msg(..))


type alias Model =
    { messages : List Msg
    , messageVisibility : Msg -> Visibility
    }


type Visibility
    = Show
    | Hide


init =
    { messages = []
    , messageVisibility = messageVisibilityDefaults
    }


messageVisibilityDefaults : Msg -> Visibility
messageVisibilityDefaults msg =
    case msg of
        _ ->
            Show
