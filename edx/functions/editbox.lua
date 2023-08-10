-- ZMIENNE
local lista_editbox = {}

-- DODAWANIE DO LISTY
function dxEditboxCreate(x,y,w,h,id)	 
    local data_editbox = {
        x = x,
        y = y,
        w = w,
        h = h,
		text = "",
		active = false,
		masked = false,
		disabled = false,
		alpha = 255,		
    }
	lista_editbox[id] = data_editbox
end

-- USUWANIE Z LISTY
function dxEditboxRemove(id)	
	if not lista_editbox[id] then return end 
	lista_editbox[id] = nil	
end

-- ZMIANA ALPHY
function dxEditboxAlpha(id,alpha)	
	if not lista_editbox[id] then return end 
	local editbox_alpha = lista_editbox[id]
	editbox_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxEditboxDisabled(id,disabled)	 
	if not lista_editbox[id] then return end
	local editbox_disabled = lista_editbox[id]
	editbox_disabled.disabled = disabled
end

-- USTAW EDITBOX JAKO ZAMASKOWANE ***
function dxEditboxMasked(id,masked)	 
	if not lista_editbox[id] then return end
	local editbox_pass = lista_editbox[id]
	editbox_pass.masked = masked
end

-- ODCZYT TEKSTU
function dxEditboxGetText(id)	 
	if not lista_editbox[id] then return '' end
	local odczyttekstu = lista_editbox[id]
	return odczyttekstu.text
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_editbox) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
		else
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			local text = v.text
			if v.masked == true then
				text = (string.rep("*",#text))
			end
			dxDrawText(text,v.x+(5*px),v.y+(v.h/3),v.x+v.w,v.y+v.h,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["light"],"left","top",true,false)	
			if v.active == true then
				if getTickCount() % 1200 > 600 then
					if text then
						local textwidth = dxGetTextWidth(text,1,lista_fonty["light"])
						if textwidth then
							if (v.x+textwidth+(5*px)) < (v.x+v.w) then
								dxDrawRectangle(v.x+textwidth+5,v.y+(v.h/3.7), 1, v.h/2,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha))
							end
						end
					end
				end
			end
		end
    end
end,true,"low")

-- WYCHWYTYWANIE NACIŚNIECIA NA EDITBOX
addEventHandler("onClientClick", root, function(btn, state)
    if btn ~= "left" or state ~= "down" then return end
    for k,v in pairs(lista_editbox) do
		if v.disabled ~= true then
			if cursorPosition(v.x,v.y,v.w,v.h) then
				v.active = true
				guiSetInputEnabled(true)
			else
				v.active = false
				guiSetInputEnabled(false)
			end
		end
    end
end)

-- WYCHWYTYWANIE NACIŚNIECIA KLAWISZA
addEventHandler("onClientCharacter", root, function(character)
    for k,v in pairs(lista_editbox) do
		if v.disabled ~= true then
			if v.active == true then
				local text = v.text
				if v.masked == true then
					text = (string.rep("*",#text))
				end			
				local textwidth = dxGetTextWidth(text.."A",1,lista_fonty["light"])
				if textwidth then
					if (v.x+textwidth+(5*px)) < (v.x+v.w) then
						v.text = v.text..character
					end
				end				
			end
		end
    end
end)

-- NACIŚNIECIE BACKSPACE I USUWANIE TEKSTU ZA POMOCĄ DELETE
addEventHandler("onClientKey", root, function(key, state)
    if not state then return end
    for k,v in pairs(lista_editbox) do
		if v.disabled ~= true then
			if v.active == true then
				-- USUWANIE JEDNEGO ZNAKU
				if key == "backspace" then
					v.text = v.text:sub(1,#v.text-1)
				end
				-- USUWANIE CAŁOŚCI
				if key == "end" then
					v.text = ""
				end		
				-- KOPIOWANIE CAŁOŚĆI
				if key == "delete" then
					if v.masked ~= true then
						setClipboard(v.text)
						v.text = ""
					end
				end					
			end
		end
    end
end)

-- WKLEJANIE TEKSTU
addEventHandler("onClientPaste", root, function(text)
    for k,v in pairs(lista_editbox) do
		if v.disabled ~= true then
			if v.active == true then
				v.text = text			
			end
		end
    end   
end)