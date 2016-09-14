module Stocks.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Stocks.Models exposing (Stock)
import Stocks.Messages exposing (..)


fetchStocks : Cmd Msg
fetchStocks =
    Http.get collectionDecoder fetchAllUrl
        |> Task.perform FetchAllFail FetchAllDone


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/stocks"


collectionDecoder : Decode.Decoder (List Stock)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Stock
memberDecoder =
    Decode.object7 Stock
        ("id" := Decode.int)
        ("currentPrice" := Decode.float)
        ("code" := Decode.string)
        ("buyPrice" := Decode.float)
        (Decode.maybe ("sellPrice" := Decode.float))
        ("amount" := Decode.int)
        ("revenue" := Decode.float)