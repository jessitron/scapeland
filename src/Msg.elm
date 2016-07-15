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
    msg |> toString |> firstWord


firstWord string =
    string |> String.words |> List.head |> Maybe.withDefault ""
