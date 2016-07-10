module ScapelandDebug.Update exposing (update)

import ScapelandDebug.Model
import Model exposing (Model)
import Msg exposing (Msg(MousePosition, HideMessagesLike))


update : Msg -> Model -> Model
update msg model =
    model
        |> recordSubscriptionValues msg
        |> updateDebugModel (recordMessage msg)
        |> respond msg


respond msg model =
    case msg of
        HideMessagesLike thisOne ->
            model

        _ ->
            model


recordSubscriptionValues msg model =
    case msg of
        MousePosition m ->
            { model | mousePosition = m }

        _ ->
            model


updateDebugModel :
    (ScapelandDebug.Model.Model -> ScapelandDebug.Model.Model)
    -> Model
    -> Model
updateDebugModel f model =
    { model | debug = f model.debug }


recordMessage : Msg -> ScapelandDebug.Model.Model -> ScapelandDebug.Model.Model
recordMessage msg model =
    { model | messages = msg :: model.messages }
