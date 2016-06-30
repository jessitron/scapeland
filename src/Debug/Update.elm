module Debug.Update exposing (update)

import Msg exposing (Msg(MousePosition))


update msg model =
    let
        debugModel =
            { messages = msg :: model.debug.messages }

        model =
            { model | debug = debugModel }
    in
        case msg of
            MousePosition m ->
                { model | mousePosition = m }
