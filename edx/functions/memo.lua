-- ZMIENNE
local lista_memo = {}

-- DODAWANIE DO LISTY
function dxMemoCreate(x,y,w,h,id)	 
    local data_memo = {
        x = x,
        y = y,
        w = w,
        h = h,
		text = "",
		active = false,
		disabled = false,
		alpha = 255,		
    }
	lista_memo[id] = data_memo
end

-- USUWANIE Z LISTY
function dxMemoRemove(id)	 
	if not lista_memo[id] then return end
	lista_memo[id] = nil
end

-- ZMIANA ALPHY
function dxMemoAlpha(id,alpha)	
	if not lista_memo[id] then return end 
	local memo_alpha = lista_memo[id]
	memo_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxMemoDisabled(id,disabled)	
	if not lista_memo[id] then return end 
	local memo_disabled = lista_memo[id]
	memo_disabled.disabled = disabled
end

-- ZMIANA TEKSTU
function dxMemoSetText(id,text)	 
	if not lista_memo[id] then return end
	local memo_text = lista_memo[id]
	memo_text.text = text
end

-- ODCZYT TEKSTU
function dxMemoGetText(id)	 
	if not lista_memo[id] then return '' end
	local odczyttekstu = lista_memo[id]
	return odczyttekstu.text
end

-- GET \N COUNT
function dxMemoGetNNCount(string)	 
	if not string then return 0 end
	local _, replacements = string.gsub(string, "\n", "\n")
	return replacements
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_memo) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawText(v.text,v.x+(5*px),v.y+(5*py),v.x+v.w,v.y+v.h,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["light"],"left","top",true,true)					
		else				
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))				
			dxDrawText(v.text,v.x+(5*px),v.y+(5*py),v.x+v.w,v.y+v.h,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["light"],"left","top",true,true)	
			if v.active == true then
				if getTickCount() % 1200 > 600 then
					if v.text then
						local textwidth = dxGetTextWidth(string.match(v.text, "[^%c]*$"),1,lista_fonty["light"])
						local _, textheight = dxGetTextSize(textwidth,1,1,lista_fonty["light"])		
						local ktoralinia = dxMemoGetNNCount(v.text)	 						
						if textwidth then
							if (v.x+textwidth+(5)) < (v.x+v.w) and ((v.y+(ktoralinia*textheight)) < (v.y+v.h-textheight)) then
								dxDrawRectangle(v.x+textwidth+5,(v.y+(ktoralinia*textheight))*1.015, 1, textheight*0.8,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha))
							end
						end
					end
				end
			end			
		end
    end
end,true,"low")

-- WYCHWYTYWANIE NACIŚNIECIA NA MEMO
addEventHandler("onClientClick", root, function(btn, state)
    if btn ~= "left" or state ~= "down" then return end
    for k,v in pairs(lista_memo) do
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
    for k,v in pairs(lista_memo) do
		if v.disabled ~= true then
			if v.active == true then
				local textwidth = dxGetTextWidth(string.match((v.text.."A"), "[^%c]*$"),1,lista_fonty["light"])
				if textwidth then
					local _, textheight = dxGetTextSize(textwidth,1,1,lista_fonty["light"])		
					if (v.x+textwidth+(5)) < (v.x+v.w) then
						v.text = v.text..character
					else
						local ktoralinia = dxMemoGetNNCount(v.text)	 					
						if ((v.y+((ktoralinia+1)*textheight)) < (v.y+v.h-textheight)) then
							v.text = v.text.."\n"..character
						end
					end
				end
			end
		end
    end
end)

-- NACIŚNIECIE BACKSPACE I USUWANIE TEKSTU ZA POMOCĄ DELETE
addEventHandler("onClientKey", root, function(key, state)
    if not state then return end
    for k,v in pairs(lista_memo) do
		if v.disabled ~= true then
			if v.active == true then
				-- DO NOWEJ LINII
				if key == "enter" then
					local textwidth = dxGetTextWidth(string.match((v.text.."A"), "[^%c]*$"),1,lista_fonty["light"])
					local _, textheight = dxGetTextSize(textwidth,1,1,lista_fonty["light"])		
					local ktoralinia = dxMemoGetNNCount(v.text)	 					
					if ((v.y+((ktoralinia+1)*textheight)) < (v.y+v.h-textheight)) then
						v.text = v.text.."\n"
					end					
				end		
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
					setClipboard(v.text)
					v.text = ""
				end					
			end
		end
    end
end)

-- WKLEJANIE TEKSTU
addEventHandler("onClientPaste", root, function(text)
    for k,v in pairs(lista_memo) do
		if v.disabled ~= true then
			if v.active == true then
				v.text = text			
			end
		end
    end   
end)