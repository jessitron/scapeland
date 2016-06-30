module Debug.Update exposing (update)

import Msg exposing (Msg(MousePosition))


update msg model =
    case msg of
        MousePosition m ->
            { model | mousePosition = m }
