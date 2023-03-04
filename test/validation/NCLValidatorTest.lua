-- Document without error!
local doc1 = "docs/nclcd/exemplo01.ncl"
os.execute("java -jar LuaNa(API)/ncl-validator-1.4.20.jar -nl pt_BR "..doc1)

-- Document with error!
local doc2 = "docs/nclcd/exercicio02.ncl"
os.execute("java -jar LuaNa(API)/ncl-validator-1.4.20.jar -nl pt_BR "..doc2)

-- Document without error!
local doc3 = "docs/nclcd/exercicio03.ncl"
os.execute("java -jar LuaNa(API)/ncl-validator-1.4.20.jar -nl pt_BR "..doc3)

-- Document with error!
local doc4 = "docs/nclcd/exercicio04.ncl"
os.execute("java -jar LuaNa(API)/ncl-validator-1.4.20.jar -nl pt_BR "..doc4)