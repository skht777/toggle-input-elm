module Main exposing (..)

import Html exposing (Html, text, div, a, span, textarea)
import Html.Attributes exposing (type_, class, value, readonly, wrap)
import Html.Events exposing (onClick)

---- MODEL ----


type alias Model =
    { words: List Char
    , current: List Char
    , count: Int
    , before: Maybe Key }


init : ( Model, Cmd Msg )
init =
    ( { words = []
      , current = []
      , count = 0
      , before = Nothing }, Cmd.none )



---- UPDATE ----


type Msg
    = Enter
    | Push Key

type Key
    = One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Astar
    | Zero
    | Sharp



listElem : Int -> (List a) -> (Maybe a)
listElem num list = List.head <| List.drop num list

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Enter ->
            ( { model | words = model.words ++ model.current, current = [] }, Cmd.none )
        Push push ->
            let
                list =
                    case push of
                        One ->
                            ["あ", "い", "う", "え", "お"]
                        Two ->
                            ["か", "き", "く", "け", "こ"]
                        Three ->
                            ["さ", "し", "す", "せ", "そ"]
                        Four ->
                            ["た", "ち", "つ", "て", "と"]
                        Five -> 
                            ["な", "に", "ぬ", "ね", "の"]
                        Six ->
                            ["は", "ひ", "ふ", "へ", "ほ"]
                        Seven ->
                            ["ま", "み", "む", "め", "も"]
                        Eight ->
                            ["や", "ゆ", "よ"]
                        Nine ->
                            ["ら", "り", "る", "れ", "ろ"]
                        Astar ->
                            ["", "", "", "", ""]
                        Zero ->
                            ["わ", "を", "ん"]
                        Sharp ->
                            ["", "", "", "", ""]

                num = 
                    if Just push == model.before
                    then model.count + 1
                    else 0
                pos = num % (List.length list)
                newModel = { model | current = Maybe.withDefault [] <| Maybe.map String.toList (listElem pos list), count = num, before = Just push }
            in
            if List.any (\key -> key == model.before ) [Just push, Nothing]
            then ( newModel, Cmd.none )
            else ( { newModel | words = model.words ++ model.current }, Cmd.none )
            


---- VIEW ----


view : Model -> Html Msg
view { words, current } =
    div []
        [ div [ class "display" ]
            [ textarea [ class "display-text", readonly True, wrap "hard", value <| String.fromList (words ++ current) ] []
            ]
        , div [ class "keyboard" ]
            [ a [ class "return button", type_ "button", onClick Enter ] [ span [ class "icon is-medium" ] [ text "□" ] ]
            , a [ class "button", type_ "button", onClick <| Push One ] [ span [ class "icon" ] [ text "1 あ" ] ]
            , a [ class "button", type_ "button", onClick <| Push Two ] [ span [ class "icon" ] [ text "2 か" ] ]
            , a [ class "button", type_ "button", onClick <| Push Three ] [ span [ class "icon" ] [ text "3 さ" ] ]
            , a [ class "button", type_ "button", onClick <| Push Four ] [ span [ class "icon" ] [ text "4 た" ] ]
            , a [ class "button", type_ "button", onClick <| Push Five ] [ span [ class "icon" ] [ text "5 な" ] ]
            , a [ class "button", type_ "button", onClick <| Push Six ] [ span [ class "icon" ] [ text "6 は" ] ]
            , a [ class "button", type_ "button", onClick <| Push Seven ] [ span [ class "icon" ] [ text "7 ま" ] ]
            , a [ class "button", type_ "button", onClick <| Push Eight ] [ span [ class "icon" ] [ text "8 や" ] ]
            , a [ class "button", type_ "button", onClick <| Push Nine ] [ span [ class "icon" ] [ text "9 ら" ] ]
            , a [ class "button", type_ "button", onClick <| Push Astar ] [ span [ class "icon" ] [ text "*" ] ]
            , a [ class "button", type_ "button", onClick <| Push Zero ] [ span [ class "icon" ] [ text "0 わ" ] ]
            , a [ class "button", type_ "button", onClick <| Push Sharp ] [ span [ class "icon" ] [ text "#" ] ]
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
