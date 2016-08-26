module Main exposing (main)

import Html exposing (Html)
import Html.App
import Model
import Mouse
import ScapelandDebug.Update
import ScapelandDebug.View
import Scapeland.View
import Scapeland.Subscriptions
import Msg exposing (Msg(World))


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


updateWithDebug msg model =
    let
        updatedModel =
            model
                |> ScapelandDebug.Update.update msg
                |> worldUpdatedModel msg
    in
        ( updatedModel, Cmd.none )


worldUpdatedModel msg model =
    case msg of
        World m ->
            let
                newWorld =
                    Scapeland.Subscriptions.updateWorld m model.world
            in
                { model | world = newWorld }

        _ ->
            model
