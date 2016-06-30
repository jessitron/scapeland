module Main exposing (main)

import Html exposing (Html)
import Html.App
import View
import Model
import Mouse
import Msg exposing (Msg(MousePosition))
import Debug.Update


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
            Debug.Update.update msg model
    in
        ( debugUpdatedModel, Cmd.none )
