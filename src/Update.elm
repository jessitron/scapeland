module Update exposing (updateWithDebug, updateOnly)

import ScapelandDebug.Update
import Scapeland.Subscriptions
import Msg exposing (Msg(World))


updateWithDebug msg model =
    ( updateOnly msg model, Cmd.none )


updateOnly msg model =
    let
        updatedModel =
            model
                |> ScapelandDebug.Update.update msg
                |> worldUpdatedModel msg
    in
        updatedModel


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
