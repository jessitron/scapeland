module Landscape.View exposing (view)

import Html
import Html.Attributes as Attr


view m =
    Html.canvas
        [ Attr.style
            [ ( "background-image", "url(images/elmscape.png)" )
            ]
        , Attr.class "whatever"
        ]
        []
