module Models exposing (..)

import Players.Models exposing (Player)
import Stocks.Models exposing (Stock)
import Routing


type alias Model =
    { players : List Player
    , stocks : List Stock
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { players = []
    , stocks = []
    , route = route
    }
