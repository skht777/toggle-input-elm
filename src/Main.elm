module Main exposing (..)

import Html exposing (Html, text, div, a, span, textarea)
import Html.Attributes exposing (type_, class, value, readonly, wrap)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div [ class "display" ]
            [ textarea [ class "display-text", readonly True, wrap "hard", value "こんにちは えるむ" ] []
            ]
        , div [ class "keyboard" ]
            [ a [ class "return button", type_ "button" ] [ span [ class "icon is-medium" ] [ text "□" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "1 あ" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "2 か" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "3 さ" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "4 た" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "5 な" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "6 は" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "7 ま" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "8 や" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "9 ら" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "*" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "0 わ" ] ]
            , a [ class "button", type_ "button" ] [ span [ class "icon" ] [ text "#" ] ]
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
