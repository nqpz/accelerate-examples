{-# LANGUAGE TemplateHaskell #-}

module Config where

import Data.Label
import System.Console.GetOpt


data Config
  = Config
  {
    _configRows :: Int
  , _configCols :: Int
  }

$(mkLabels [''Config])

defaults :: Config
defaults = Config
  { _configRows = 1000
  , _configCols = 1000
  }

options :: [OptDescr (Config -> Config)]
options =
  [ Option []   ["rows"]  (ReqArg (set configRows . read) "INT")   "number of rows (1000)"
  , Option []   ["cols"]  (ReqArg (set configCols . read) "INT")   "number of columsn (1000)"
  ]


header :: [String]
header =
  [ "accelerate-smvm (c) [2015] The Accelerate Team"
  , ""
  , "Usage: accelerate-mvm [OPTIONS]"
  , ""
  ]

footer :: [String]
footer = [ "" ]

