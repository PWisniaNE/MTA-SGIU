-- ZMIENNE
local lista_combo = {}
local lista_combo_opcje = {}

-- DODAWANIE DO LISTY
function dxComboCreate(x,y,w,h,id)	 
    local data_combo = {
		id = id,
        x = x,
        y = y,
        w = w,
        h = h,
		selected = nil,
		selectednumber = nil,
		otwarte = false,
		disabled = false,
		alpha = 255,		
    }
	lista_combo[id] = data_combo
end

-- USUWANIE Z LISTY
function dxComboRemove(id)	 
	if not lista_combo[id] then return end
	lista_combo[id] = nil	
end

-- ZMIANA ALPHY
function dxComboAlpha(id,alpha)	 
	if not lista_combo[id] then return end
	local combo_alpha = lista_combo[id]
	combo_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxComboDisabled(id,disabled)	 
	if not lista_combo[id] then return end
	local combo_disabled = lista_combo[id]
	combo_disabled.disabled = disabled
end

-- DODAWANIE OPCJI
function dxComboAddOption(id,number,option,default)	 
	if not lista_combo[id] then return end
    local data_comboopcje = {
		id = id,
		number = number,
		option = option,
    }	
	lista_combo_opcje[option] = data_comboopcje
	if default == true then
		local defaultopcja = lista_combo[id]
		defaultopcja.selected = option
		defaultopcja.selectednumber = number
	end
end

-- USUWANIE OPCJI
function dxComboRemoveOption(option)	 
	if not lista_combo_opcje[option] then return end
	lista_combo_opcje[option] = nil	
end

-- ODCZYT AKTUALNIE ZAZNACZONEJ OPCJI
function dxComboGetOption(id)	 
	if not lista_combo[id] then return '' end
	local wybranaopcja = lista_combo[id]
	-- SPRAWDZANIE CZY OPCJA JEST ZAZNACZONA
	if wybranaopcja.selected then
		return wybranaopcja.selected
	else 
		return ''
	end
end

-- ODCZYT AKTUALNIE ZAZNACZONEJ OPCJI NUMBER
function dxComboGetOptionNumber(id)	 
	if not lista_combo[id] then return '' end
	local wybranaopcjanumber = lista_combo[id]
	-- SPRAWDZANIE CZY OPCJA JEST ZAZNACZONA
	if wybranaopcjanumber.selectednumber then
		return wybranaopcjanumber.selectednumber
	else 
		return ''
	end
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_combo) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
		else
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))
			if v.selected == nil then
				dxDrawText("Wybierz opcje",v.x+(v.w/2),v.y+(v.h/2),nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],alpha),1,lista_fonty["medium"],"center","center")			
			else
				dxDrawText(v.selected,v.x+(v.w/2),v.y+(v.h/2),nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],alpha),1,lista_fonty["medium"],"center","center")	
			end
			if v.otwarte == true then
				if lista_combo_opcje then
					for k,v2 in pairs(lista_combo_opcje) do
						if v2.id == v.id then
							dxDrawRectangle(v.x,v.y+(v.h*v2.number)+2,v.w,v.h,tocolor(config["kolor_tla_elementow_najechane_r"],config["kolor_tla_elementow_najechane_g"],config["kolor_tla_elementow_najechane_b"],alpha))
							dxDrawRectangle(v.x,v.y+(v.h*v2.number)+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
							dxDrawRectangle(v.x+(v.w-2),v.y+(v.h*v2.number)+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
							dxDrawRectangle(v.x,v.y+(v.h*v2.number)+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
							dxDrawRectangle(v.x,v.y+(v.h-2)+(v.h*v2.number)+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
							dxDrawText(v2.option,v.x+(v.w/2),v.y+(v.h/2)+(v.h*v2.number)+2,nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],alpha),1,lista_fonty["medium"],"center","center")	
						end
					end 
				end
			end
		end
    end
end,true,"low")

-- WYCHWYTYWANIE NACIŚNIECIA NA COMBO
addEventHandler("onClientClick", root, function(btn, state)
    if btn ~= "left" or state ~= "down" then return end
    for k,v in pairs(lista_combo) do
		if v.disabled ~= true then
			if v.otwarte == true then
				for k,v2 in pairs(lista_combo_opcje) do
					if v2.id == v.id then
						if cursorPosition(v.x,v.y+(v.h*v2.number)+2,v.w,v.h) then
							v.selected = v2.option
							v.selectednumber = v2.number
							v.otwarte = false
						end
					end
				end
			end	
			if cursorPosition(v.x,v.y,v.w,v.h) then
				v.otwarte = true
			else
				v.otwarte = false
			end
		end
    end
end)