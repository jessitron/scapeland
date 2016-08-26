module ScapelandDebug.View.MessageConstruction exposing (..)

-- Functions for building the messages we let the view send.
-- This lets us call them from tests.

import Msg as TopLevelMsg
import ScapelandDebug.Msg as DebugMsg exposing (Msg(StopMessagesLike))


-- the message sent when the user wants to stop recording a kind of message


pleaseStopRecording : TopLevelMsg.Msg -> DebugMsg.Msg
pleaseStopRecording msg =
    StopMessagesLike (TopLevelMsg.makeComparable msg)
