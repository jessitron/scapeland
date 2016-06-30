module Main exposing (main)

import Html exposing (Html)
import Html.App
import View
import Model


main : Program Never
main =
    { model = {}
    , update = \a m -> m
    , view =
        View.view
    }
        |> Html.App.beginnerProgram
