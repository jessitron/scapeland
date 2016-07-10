module Debug.View exposing (view)

import Html
import Html.Attributes as Attr


view m =
    Html.div [] [ subscriptionValues m, messages m.debug.messages ]


messages m =
    Html.ul []
        (List.map messageItem m)


messageItem msg =
    Html.li [] [ Html.text (toString msg) ]


subscriptionValues m =
    Html.div [ Attr.class "debugSection" ] [ mousePositionSubscription m.mousePosition ]


mousePositionSubscription m =
    Html.div []
        [ Html.label [] [ Html.text "Mouse Position" ]
        , Html.output [] [ Html.text (toString m) ]
        ]
