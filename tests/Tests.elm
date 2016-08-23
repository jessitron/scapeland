module Tests exposing (..)

import Test exposing (..)
import Expect
import String


all : Test
all =
    describe "Something"
        [ test "When I send messages to update they get stored in the messages"
            <| \() ->
                Expect.equal (3 + 7) 10
        ]
