module Main exposing (..)

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

type alias Model
    = Int

init : Model
init = 0


-- UPDATE

type Msg
    = Increment
    | Decrement
    | ResetCounter

update : Msg -> Model -> Model
update msg  model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        ResetCounter ->
            init  -- 初期化を行う
-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [ onClick ResetCounter ] [ text "Reset" ]
        ]
