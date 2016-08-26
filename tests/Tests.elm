module Tests exposing (..)

import Test exposing (..)
import Fuzz
import Expect
import String
import ScapelandDebug.Update
import Model
import Fuzzer.Msg exposing (mousePositionX, mousePositionY, mousePositionMessage)
import ScapelandDebug.Msg exposing (Msg(HideMessagesLike))
import Msg


all : Test
all =
    describe "Saving messages"
        [ fuzz2 mousePositionX mousePositionY "When I send messages to update they get stored in the debug.messages"
            <| \x y ->
                let
                    messages =
                        [ mousePositionMessage x y ]

                    result =
                        List.foldr ScapelandDebug.Update.update Model.init messages
                in
                    Expect.equal messages result.debug.messages
        , fuzz2 mousePositionX mousePositionY "When asked to hide messages it does not store them"
            <| \x y ->
                let
                    worldMessage =
                        mousePositionMessage x y

                    pleaseHide =
                        Msg.Debug (HideMessagesLike (Msg.makeComparable worldMessage))

                    messages =
                        [ pleaseHide, worldMessage ]

                    result =
                        List.foldr ScapelandDebug.Update.update Model.init messages
                in
                    Expect.equal [ pleaseHide ] result.debug.messages
        ]
