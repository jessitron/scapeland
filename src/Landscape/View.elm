module Scapeland.View exposing (view)

import Html
import Html.Attributes as Attr
import Model


view m =
    Html.canvas
        [ Attr.style
            [ ( "background-image", "url(images/elmscape.png)" )
            ]
        , Attr.class "whatever"
        ]
        []
