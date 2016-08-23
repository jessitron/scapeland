module View exposing (view)

import Html exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg)
import ScapelandDebug.View
import Scapeland.View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.main' []
            [ Scapeland.View.view model
            ]
        , Html.aside []
            [ ScapelandDebug.View.view model ]
        ]
