-- ZMIENNE
lista_fonty = {}

-- TWORZENIE FONTA
function dxFontCreate(id,file,size,bold,quality)	 
	lista_fonty[id] = dxCreateFont(file,size)
end

-- POBIERANIE FONTÓW DO INNEGO SKRYPTU
function dxFontGet()	 
	if not lista_fonty then return '' end
	return lista_fonty
end