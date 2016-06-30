module Debug.Update exposing (update)

import Msg exposing (Msg(MousePosition))


update msg model =
    let
        debugModel =
            { messages = model.debug.messages ++ [ msg ] }

        model =
            { model | debug = debugModel }
    in
        case msg of
            MousePosition m ->
                { model | mousePosition = m }
