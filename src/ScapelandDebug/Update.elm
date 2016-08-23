module ScapelandDebug.Update exposing (update)

import Dict
import ScapelandDebug.Model exposing (Visibility(..))
import ScapelandDebug.Msg
import ScapelandDebug.ComparableMsg exposing (ComparableMsg)
import Model exposing (Model)
import Msg exposing (Msg(Debug, World))


update : Msg -> Model -> Model
update msg model =
    model
        |> updateDebugModel (recordMessage msg)
        |> respond msg


respond msg model =
    case msg of
        Debug (ScapelandDebug.Msg.HideMessagesLike thisOne) ->
            updateDebugModel (addToMessageVisibility thisOne Hide)
                model

        _ ->
            model


updateDebugModel :
    (ScapelandDebug.Model.Model -> ScapelandDebug.Model.Model)
    -> Model
    -> Model
updateDebugModel f model =
    { model | debug = f model.debug }


addToMessageVisibility :
    ComparableMsg
    -> Visibility
    -> ScapelandDebug.Model.Model
    -> ScapelandDebug.Model.Model
addToMessageVisibility message viz debugModel =
    let
        oldVisibilities =
            debugModel.requestedMessageVisibility

        newVisibilities =
            Dict.insert message viz oldVisibilities
    in
        { debugModel
            | requestedMessageVisibility =
                newVisibilities
        }


recordMessage : Msg -> ScapelandDebug.Model.Model -> ScapelandDebug.Model.Model
recordMessage msg model =
    { model | messages = msg :: model.messages }
