module Debug.Model exposing (Model, init)

import Msg exposing (Msg)


type alias Model =
    { messages : List Msg }


init =
    { messages = [] }
