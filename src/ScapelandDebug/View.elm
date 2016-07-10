module ScapelandDebug.View exposing (view)

import Html
import Html.Attributes as Attr


view m =
    Html.div [] [ subscriptionValues m, messages m.debug.messages ]


messages m =
    debugSection "Messages"
        [ Html.ul [] (List.map messageItem m)
        ]


messageItem msg =
    Html.li [] [ Html.text (toString msg) ]


subscriptionValues m =
    debugSection "Subscriptions"
        [ mousePositionSubscription m.mousePosition
        ]


debugSection name contents =
    Html.div [ Attr.class "debugSection" ]
        ([ Html.text name
         , Html.hr [] []
         ]
            ++ contents
        )


mousePositionSubscription m =
    Html.div []
        [ Html.label [] [ Html.text "Mouse Position" ]
        , Html.output [] [ Html.text (toString m) ]
        ]
