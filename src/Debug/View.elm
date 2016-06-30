module Debug.View exposing (view)

import Html


view m =
    Html.div [] [ mousePositionSubscription m.mousePosition ]


mousePositionSubscription m =
    Html.div [] [ Html.text "Mouse Position", Html.text (toString m) ]
