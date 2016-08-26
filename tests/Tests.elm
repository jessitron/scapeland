module Tests exposing (..)

import Test exposing (..)
import Fuzz
import Expect
import String
import ScapelandDebug.Update
import Model
import Fuzzer.Msg exposing (mousePositionX, mousePositionY, mousePositionMessage)


all : Test
all =
    describe "Something"
        [ fuzz2 mousePositionX mousePositionY "When I send messages to update they get stored in the messages"
            <| \x y ->
                let
                    aMessage =
                        mousePositionMessage x y

                    initialModel =
                        Model.init

                    messages =
                        [ aMessage ]

                    result =
                        List.foldr ScapelandDebug.Update.update initialModel messages
                in
                    Expect.equal messages result.debug.messages
        ]
