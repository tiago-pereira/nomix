module Stocks.Models exposing (..)


type alias Stock =
    { id : Int
    , currentPrice : Float
    , code : String
    , buyPrice : Float
    , sellPrice : Maybe Float
    , amount : Int
    , revenue : Float
    }
