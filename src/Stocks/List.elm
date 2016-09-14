module Stocks.List exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Stocks.Messages exposing (..)
import Stocks.Models exposing (Stock)


view : List Stock -> Html Msg
view stocks =
    div []
        [ nav stocks
        , list stocks
        ]


nav : List Stock -> Html Msg
nav stocks =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Stocks" ] ]


list : List Stock -> Html Msg
list stocks =
    div [ class "p2" ]
        (List.map stockCard stocks)


editBtn : Stock -> Html Msg
editBtn stock =
    button
        [ class "btn regular"
        , onClick (ShowStock stock.id)
        ]
        [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]


stockCard : Stock -> Html Msg
stockCard stock =
    div
        [ class "col col-2 m1 border"
        , onClick (ShowStock stock.id)
        ]
        [ div [] [ text stock.code ]
        , div [] [ text (toString stock.currentPrice) ]
        ]
