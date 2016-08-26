module Msg exposing (Msg(..), makeComparable)

import Mouse
import String
import Scapeland.Subscriptions
import ScapelandDebug.Msg
import ScapelandDebug.ComparableMsg exposing (ComparableMsg)


type Msg
    = World Scapeland.Subscriptions.Msg
    | Debug ScapelandDebug.Msg.Msg



-- I will move this down into debug-land


makeComparable : Msg -> ComparableMsg
makeComparable msg =
    case msg of
        World (Scapeland.Subscriptions.MousePosition _) ->
            "MousePosition"

        Debug (ScapelandDebug.Msg.StopMessagesLike _) ->
            "StopMessagesLike"
