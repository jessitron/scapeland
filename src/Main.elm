module Main exposing (main)

import Html exposing (Html)
import Html.App
import Model
import Mouse
import ScapelandDebug.View
import Scapeland.View
import Scapeland.Subscriptions
import Msg exposing (Msg)
import Update exposing (updateWithDebug)


main : Program Never
main =
    { init = ( Model.init, Cmd.none )
    , update = updateWithDebug
    , subscriptions = subscriptionsAsWorld
    , view = viewWithDebug
    }
        |> Html.App.program


subscriptionsAsWorld _ =
    Sub.map Msg.World Scapeland.Subscriptions.subscriptions


viewWithDebug : Model.Model -> Html Msg
viewWithDebug model =
    Html.div []
        [ Html.main' []
            [ Scapeland.View.view model
            ]
        , Html.aside []
            [ Html.App.map Msg.Debug (ScapelandDebug.View.view model) ]
        ]
