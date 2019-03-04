module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text, br)
import Html.Events exposing (onClick)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


-- MODEL

type alias Model =
    { countNum : Int }

init : Model
init =
    { countNum = 0}


-- UPDATE

type Msg
    = Increment
    | Decrement
    | ResetCounter
    | IncrementX2
    | DecrementX2

update : Msg -> Model -> Model
update msg  model =
    case msg of
        Increment ->
            { model | countNum = model.countNum + 1 }

        Decrement ->
            { model | countNum = model.countNum - 1 }

        ResetCounter ->
            { model | countNum = 0}

        IncrementX2 ->
            { model | countNum = model.countNum * 2 }

        DecrementX2 ->
            { model | countNum = model.countNum * (-2) }
-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick DecrementX2 ] [ text "-x2"]
        , br [] []
        , button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.countNum) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [ onClick IncrementX2 ] [ text "+x2" ]
        , br [] []
        , button [ onClick ResetCounter ] [ text "Reset" ]
        ]
