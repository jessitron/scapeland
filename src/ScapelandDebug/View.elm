module ScapelandDebug.View exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events as E
import Msg exposing (Msg(..))
import ScapelandDebug.Model exposing (isVisible)


view m =
    Html.div [] [ subscriptionValues m, messages m.debug ]


messages m =
    debugSection "Messages"
        [ (m.messages
            |> List.filter (isVisible m)
            |> List.map messageItem
            |> Html.ul []
          )
        ]


messageItem msg =
    Html.li []
        [ Html.text (toString msg)
        , Html.text " "
        , Html.a [ E.onClick (HideMessagesLike msg) ] [ Html.text "Hide these" ]
        ]


subscriptionValues m =
    debugSection "Subscriptions"
        [ mousePositionSubscription m.mousePosition
        ]


debugSection : String -> List (Html Msg) -> Html Msg
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
