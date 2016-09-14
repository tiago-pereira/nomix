module Stocks.Update exposing (..)

import Stocks.Messages exposing (Msg(..))
import Stocks.Models exposing (Stock)
import Navigation


update : Msg -> List Stock -> ( List Stock, Cmd Msg )
update message stocks =
    case message of
        FetchAllDone newStocks ->
            ( newStocks, Cmd.none )

        FetchAllFail error ->
            ( stocks, Cmd.none )

        ShowStocks ->
            ( stocks, Navigation.newUrl "#stocks" )

        ShowStock id ->
            ( stocks, Navigation.newUrl ("#stocks/" ++ (toString id)) )
