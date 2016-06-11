module Scapeland exposing (main)

import Html exposing (Html)
import Html.App


main : Program Never
main =
    { model = ()
    , update = \a m -> m
    , view =
        \_ ->
            Html.text "put program here"
    }
        |> Html.App.beginnerProgram
