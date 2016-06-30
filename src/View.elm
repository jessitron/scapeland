module View exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr
import Model exposing (Model)


view : Model -> Html Never
view model =
    Html.main' []
        [ Html.canvas
            [ Attr.style
                [ ( "background-image", "url(images/elmscape.png)" )
                ]
            , Attr.class "whatever"
            ]
            []
        ]
