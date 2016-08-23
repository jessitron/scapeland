module Main exposing (main)

import Html exposing (Html)
import Html.App
import Model
import Mouse
import Msg exposing (Msg(MousePosition))
import ScapelandDebug.Update
import ScapelandDebug.View
import Scapeland.View


main : Program Never
main =
    { init = ( Model.init, Cmd.none )
    , update = updateWithDebug
    , subscriptions = \m -> Mouse.moves MousePosition
    , view = viewWithDebug
    }
        |> Html.App.program


viewWithDebug : Model.Model -> Html Msg
viewWithDebug model =
    Html.div []
        [ Html.main' []
            [ Scapeland.View.view model
            ]
        , Html.aside []
            [ ScapelandDebug.View.view model ]
        ]


updateWithDebug msg model =
    let
        debugUpdatedModel =
            ScapelandDebug.Update.update msg model
    in
        ( debugUpdatedModel, Cmd.none )
