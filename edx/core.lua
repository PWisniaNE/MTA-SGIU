-- ZMIENNE // TAK WIEM SKALOWANIE RELATYWNE // ZAWSZE BEZ PROBLEMU MOŻNA ZMIENIĆ
config = {} 
sw,sh = guiGetScreenSize()
px = math.min(sw / 1920,1)
py = math.min(sh / 1080,1)

-- TWORZENIE FONTÓW PO ZAŁADOWANIU
addEventHandler( "onClientResourceStart", getRootElement( ),function ( startedRes )
    dxFontCreate("bold","fonts/bold.ttf",15)	
	dxFontCreate("medium","fonts/medium.ttf",15)	
	dxFontCreate("light","fonts/light.ttf",15)	
end)

-- TEKSTURY
-- BRAK BO JEDNAK TYLKO DX MOŻNA ZGODNIE Z POSTEM

-- ŁADOWANIE STYLU INTERFEJSU
local SelectedStyle = "example"
local f = fileOpen("styles/"..SelectedStyle..".style",true)
local getstyle = fileRead(f,100)
while not fileIsEOF(f) do
	getstyle = getstyle ..fileRead(f,100)
end
fileClose(f)

local styleTable = split(getstyle, '\n')
for k,v in pairs(styleTable) do
	if v ~= "" then
		local strlen = string.len(v)
		local start, stop = string.find(v," = ",1)
		local wykluczona = string.find(v,"//",1)		
		if strlen and start and stop and not wykluczona then
			local conf = string.sub(v,1,start-1)
			local value = string.sub(v,stop+1,strlen)
			config[conf] = tonumber(value)
		end
	end
end

-- SPRAWDZANIE GDZIE JEST KURSOR
function cursorPosition(psw,psh,pssw,pssh,abx,aby)
    if not isCursorShowing() then return end
    cx,cy=getCursorPosition()
    cx,cy=cx*sw,cy*sh
    if cx >= psw and cx <= psw+pssw and cy >= psh and cy <= psh+pssh then
        return true,cx,cy
    else
        return false
    end
end