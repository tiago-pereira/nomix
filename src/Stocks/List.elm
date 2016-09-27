module Stocks.List exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Html.Attributes exposing (class)
import Debug
import Stocks.Messages exposing (..)
import Stocks.Models exposing (Stock, Model)
import Material.Card as Card
import Material.Color as Color
import Material.Elevation as Elevation
import Material.Options as Options exposing (cs, css)
import Material.Typography as Typography


view : Model -> Html Msg
view model =
    div []
        [ nav model.stocks
        , list model
        ]


wide : Float
wide =
    300


margin2 : Options.Property a b
margin2 =
    css "margin" "4px 8px 4px 0px"


stockCardMdl : Stock -> Html Msg
stockCardMdl stock =
    let
        card =
            Card.view
                [ dynamic stock 6 stock.raised
                , css "width" (toString wide ++ "px")
                , css "cursor" "pointer"
                , cs "sm-col"
                , cs "flex"
                , margin2
                ]
                [ Card.title []
                    [ Card.head
                        [ cs "flex col-12"
                        , css "justify-content" "space-between"
                        ]
                        [ div [] [ text stock.code ]
                        , div [ class "green" ] [ text (toString stock.currentPrice) ]
                        ]
                    ]
                , Card.text [] [ text "Tiago" ]
                ]
    in
        card


dynamic : Stock -> Int -> Int -> Options.Style Msg
dynamic stock k raised =
    [ if raised == k then
        Elevation.e8
      else
        Elevation.e2
    , Elevation.transition 250
    , Options.attribute <| onMouseEnter (Raise stock k)
    , Options.attribute <| onMouseLeave (Raise stock -1)
    ]
        |> Options.many


nav : List Stock -> Html Msg
nav stocks =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Stocks" ] ]


list : Model -> Html Msg
list model =
    div
        [ class "p2"
        ]
        (List.map stockCardMdl model.stocks)


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
