module Tests exposing (..)

import Test exposing (..)
import Fuzz
import Expect
import String
import ScapelandDebug.Update
import Model
import Fuzzer.Msg exposing (mousePositionX, mousePositionY, mousePositionMessage)
import ScapelandDebug.Msg exposing (Msg(StopMessagesLike))
import Msg
import ScapelandDebug.View.MessageConstruction exposing (pleaseStopRecording)


all : Test
all =
    describe "how do I combine multiple suites"
        [ fuzz2 mousePositionX mousePositionY "When I send messages to update they get stored in the debug.messages"
            <| \x y ->
                let
                    messages =
                        [ mousePositionMessage x y ]

                    result =
                        List.foldl ScapelandDebug.Update.update Model.init messages
                in
                    Expect.equal messages result.debug.messages
        , fuzz2 mousePositionX mousePositionY "When asked to stop messages it does not store them"
            <| \x y ->
                let
                    worldMessage =
                        mousePositionMessage x y

                    pleaseStopRecordingMessage =
                        Msg.Debug (pleaseStopRecording worldMessage)

                    messages =
                        [ pleaseStopRecordingMessage, worldMessage ]

                    result =
                        List.foldl ScapelandDebug.Update.update Model.init messages
                in
                    Expect.equal [ pleaseStopRecordingMessage ] result.debug.messages
        , fuzz2 mousePositionX mousePositionY "It always displays the latest mouse position"
            <| \x y ->
                let
                    messages =
                        [ mousePositionMessage x y ]

                    result =
                        List.foldl ScapelandDebug.Update.update Model.init messages
                in
                    Expect.equal { x = x, y = y } result.world.mousePosition
        ]
