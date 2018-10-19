
GUIEditor = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}

	local screenW, screenH = guiGetScreenSize()
    GUIEditor.window[1] = guiCreateWindow((screenW - 402) / 2, (screenH - 283) / 2, 402, 283, "MDuelos", false)
    guiWindowSetSizable(GUIEditor.window[1], false)
    GUIEditor.gridlist[1] = guiCreateGridList(10, 25, 146, 243, false, GUIEditor.window[1])
    column = guiGridListAddColumn(GUIEditor.gridlist[1], "Jugadores Cerca", 0.9)
    GUIEditor.label[1] = guiCreateLabel(162, 62, 92, 17, "Cantidad", false, GUIEditor.window[1])
    guiSetFont(GUIEditor.label[1], "default-bold-small")
    guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
    GUIEditor.edit[1] = guiCreateEdit(254, 52, 112, 31, "", false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(166, 107, 88, 44, "Retar", false, GUIEditor.window[1])
    guiSetFont(GUIEditor.button[1], "default-bold-small")
    guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
    GUIEditor.button[2] = guiCreateButton(294, 107, 88, 44, "Cancelar", false, GUIEditor.window[1])
    guiSetFont(GUIEditor.button[2], "default-bold-small")
    guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
    GUIEditor.label[2] = guiCreateLabel(169, 210, 213, 28, "Pulsa el boton 'Retar' para enviar un duelo al jugador seleccionado.", false, GUIEditor.window[1])
    guiSetFont(GUIEditor.label[2], "default-bold-small")
    guiLabelSetHorizontalAlign(GUIEditor.label[2], "left", true)    
	guiSetVisible(GUIEditor.window[1], false)
	


for i,v in ipairs(getElementsByType("player")) do
	local row = guiGridListAddRow(GUIEditor.gridlist[1])
	guiGridListSetItemText(GUIEditor.gridlist[1], row, column, getPlayerName(v), false, false)
end

	
function verGUIDuelos()
	if(guiGetVisible(GUIEditor.window[1]) == false)  then
		guiSetVisible(GUIEditor.window[1], true)
		showCursor(true)
	else
		guiSetVisible(GUIEditor.window[1], false)
		showCursor(false)
	end
end	
bindKey("F6", "down", verGUIDuelos)

function cerrarGUIDuelos()
	guiSetVisible(GUIEditor.window[1], false)
	showCursor(false)
end

-- EVENTOS DE CLICK

addEventHandler("onClientGUIClick", resourceRoot,
	function()
		if source == GUIEditor.button[1] then -- button retar
			local row, column = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if(row ~= guiGridListGetRowCount(GUIEditor.gridlist[1]) and column ~= 0) then
			
			else
				exports.Mdxgui:createMessage("[MDuelos] No has seleccionado ningun jugador.", 255, 0, 0)
			end
		elseif source == GUIEditor.button[2] then -- button cancelar
			cerrarGUIDuelos()
		end
	end
)	