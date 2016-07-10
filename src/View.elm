module View exposing (view)

import Html exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg)
import ScapelandDebug.View
import Landscape.View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.main' []
            [ Landscape.View.view model
            ]
        , Html.aside []
            [ ScapelandDebug.View.view model ]
        ]
