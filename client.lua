

txd = engineLoadTXD ( "models/roads_texture.txd" )
engineImportTXD ( txd, 2670 )
engineImportTXD ( txd, 2671 )
engineImportTXD ( txd, 2672 )
engineImportTXD ( txd, 2673 )
engineImportTXD ( txd, 2674 )

col = engineLoadCOL ( "models/corner_long.col" )
dff = engineLoadDFF ( "models/corner_long.dff", 2670 )
engineReplaceCOL (col, 2670)
engineReplaceModel (dff, 2670)
col = engineLoadCOL ( "models/corner_short.col" )
dff = engineLoadDFF ( "models/corner_short.dff", 2671 )
engineReplaceCOL (col, 2671)
engineReplaceModel (dff, 2671)
col = engineLoadCOL ( "models/cross_junction.col" )
dff = engineLoadDFF ( "models/cross_junction.dff", 2672 )
engineReplaceCOL (col, 2672)
engineReplaceModel (dff, 2672)
col = engineLoadCOL ( "models/straight_road.col" )
dff = engineLoadDFF ( "models/straight_road.dff", 2673 )
engineReplaceCOL (col, 2673)
engineReplaceModel (dff, 2673)
col = engineLoadCOL ( "models/t_junction.col" )
dff = engineLoadDFF ( "models/t_junction.dff", 2674 )
engineReplaceCOL (col, 2674)
engineReplaceModel (dff, 2674)




--[[ Events ]]--
