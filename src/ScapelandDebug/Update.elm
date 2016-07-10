module ScapelandDebug.Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg(MousePosition))


update : Msg -> Model -> Model
update msg model =
    model
        |> recordSubscriptionValues msg
        |> recordMessage msg


recordSubscriptionValues msg model =
    case msg of
        MousePosition m ->
            { model | mousePosition = m }


recordMessage msg model =
    let
        prevDebugModel =
            model.debug

        debugModel =
            { prevDebugModel | messages = msg :: model.debug.messages }
    in
        { model | debug = debugModel }
