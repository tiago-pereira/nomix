module Stocks.Messages exposing (..)

import Http
import Stocks.Models exposing (Stock)


type Msg
    = FetchAllDone (List Stock)
    | FetchAllFail Http.Error
    | ShowStocks
    | ShowStock Int
