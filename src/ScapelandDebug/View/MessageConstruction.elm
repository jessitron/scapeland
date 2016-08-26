module ScapelandDebug.View.MessageConstruction exposing (..)

-- Functions for building the messages we let the view send.
-- This lets us call them from tests.

import Msg as TopLevelMsg
import ScapelandDebug.Msg as DebugMsg exposing (Msg(HideMessagesLike))


-- the message sent when the user wants to hide a kind of message


pleaseHide : TopLevelMsg.Msg -> DebugMsg.Msg
pleaseHide msg =
    HideMessagesLike (TopLevelMsg.makeComparable msg)
