module ScapelandDebug.Model exposing (Model, init, isVisible, Visibility(..))

import Dict exposing (Dict)
import Msg exposing (Msg(..))


type alias Model =
    { messages : List Msg
    , requestedMessageVisibility : Dict Msg.ComparableMsg Visibility
    }


isVisible : Model -> Msg -> Bool
isVisible model msg =
    let
        viz =
            case Dict.get (Msg.makeComparable msg) model.requestedMessageVisibility of
                Just viz ->
                    viz

                Nothing ->
                    messageVisibilityDefaults msg
    in
        viz == Show


type Visibility
    = Show
    | Hide


init =
    { messages = []
    , requestedMessageVisibility = Dict.empty
    }


messageVisibilityDefaults : Msg -> Visibility
messageVisibilityDefaults msg =
    case msg of
        _ ->
            Show
