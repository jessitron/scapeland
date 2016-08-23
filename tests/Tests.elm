module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import ScapelandDebug.Update
import Model


all : Test
all =
    describe "Something"
        [ test "When I send messages to update they get stored in the messages"
            <| \() ->
                let
                    initialModel =
                        Model.init

                    messages =
                        []

                    result =
                        List.foldr ScapelandDebug.Update.update initialModel messages
                in
                    Expect.equal initialModel result
        ]
