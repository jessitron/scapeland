module Debug.View exposing (view)

import Html


view m =
    Html.div [] [ subscriptionValues m, messages m.debug.messages ]


messages m =
    Html.ul []
        (List.map messageItem m)


messageItem msg =
    Html.li [] [ Html.text (toString msg) ]


subscriptionValues m =
    Html.div [] [ mousePositionSubscription m.mousePosition ]


mousePositionSubscription m =
    Html.div [] [ Html.text "Mouse Position", Html.text (toString m) ]
