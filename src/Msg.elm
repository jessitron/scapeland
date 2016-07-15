module Msg exposing (Msg(..), ComparableMsg, makeComparable)

import Mouse
import String


type Msg
    = MousePosition Mouse.Position
    | HideMessagesLike Msg


type alias ComparableMsg =
    String


makeComparable : Msg -> ComparableMsg
makeComparable msg =
    case msg of
        MousePosition _ ->
            "MousePosition"

        HideMessagesLike _ ->
            "HideMessagesLike"
