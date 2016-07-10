module Main exposing (main)

import Html exposing (Html)
import Html.App
import View
import Model
import Mouse
import Msg exposing (Msg(MousePosition))
import ScapelandDebug.Update


main : Program Never
main =
    { init = ( Model.init, Cmd.none )
    , update = update
    , subscriptions = \m -> Mouse.moves MousePosition
    , view =
        View.view
    }
        |> Html.App.program


update msg model =
    let
        debugUpdatedModel =
            ScapelandDebug.Update.update msg model
    in
        ( debugUpdatedModel, Cmd.none )
