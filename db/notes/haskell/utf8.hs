import Prelude hiding (putStr)
import Data.ByteString.Char8 (putStr, pack)

main :: IO ()
main = putStr $ pack "čušpajž日本語"
