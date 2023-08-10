-- ZMIENNE
local lista_gridlist = {}
local lista_gridlist_opcje = {}

-- DODAWANIE DO LISTY
function dxGridlistCreate(x,y,w,h,id,textscale)	 
    local data_gridlist = {
		id = id,
        x = x,
        y = y,
        w = w,
        h = h,
		textscale = textscale,
		selected = nil,
		selectednumber = nil,
		disabled = false,		
		alpha = 255,		
    }
	lista_gridlist[id] = data_gridlist
end
 
-- USUWANIE Z LISTY
function dxGridlistRemove(id)	 
	if not lista_gridlist[id] then return end
	lista_gridlist[id] = nil	
end

-- ZMIANA ALPHY
function dxGridlistAlpha(id,alpha)	 
	if not lista_gridlist[id] then return end
	local gridlist_alpha = lista_gridlist[id]
	gridlist_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxGridlistDisabled(id,disabled)
	if not lista_gridlist[id] then return end	 
	local gridlist_disabled = lista_gridlist[id]
	gridlist_disabled.disabled = disabled
end

-- ZMIANA TEXT SCALE
function dxGridlistTextScale(id,textscale)	 
	if not lista_gridlist[id] then return end
	local gridlist_alpha = lista_gridlist[id]
	gridlist_alpha.textscale = textscale
end

-- DODAWANIE OPCJI
function dxGridlistAddOption(id,number,option,default)	 
	if not lista_gridlist[id] then return end
    local data_gridlistopcje = {
		id = id,
		number = number,
		option = option,
		selected = default,
    }	
	lista_gridlist_opcje[option] = data_gridlistopcje	
	if default == true then
		local defaultopcja = lista_gridlist[id]
		defaultopcja.selected = option
		defaultopcja.selectednumber = number
	end	
end

-- USUWANIE OPCJI
function dxGridlistRemoveOption(option)	 
	if not lista_gridlist_opcje[option] then return end
	lista_gridlist_opcje[option] = nil	
end

-- ODCZYT OPCJI
function dxGridlistGetOption(id)	 
	if not lista_gridlist[id] then return '' end
	local wybranaopcja = lista_gridlist[id]
	-- SPRAWDZANIE CZY OPCJA JEST ZAZNACZONA
	if wybranaopcja.selected then
		return wybranaopcja.selected
	else 
		return ''
	end
end

-- ODCZYT OPCJI NUMBER
function dxGridlistGetOptionNumber(id)	 
	if not lista_gridlist[id] then return '' end
	local wybranaopcjanumber = lista_gridlist[id]
	-- SPRAWDZANIE CZY OPCJA JEST ZAZNACZONA
	if wybranaopcjanumber.selectednumber then
		return wybranaopcjanumber.selectednumber
	else 
		return ''
	end
end
 
-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_gridlist) do
		if lista_gridlist_opcje then
			for k,v2 in pairs(lista_gridlist_opcje) do
				if v2.id == v.id then
					if v.disabled == true then
						dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],alpha))
						dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
						dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
						dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
						dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
					else
						if v2.selected == true then
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,v.w,v.h,tocolor(config["kolor_tla_elementow_najechane_r"],config["kolor_tla_elementow_najechane_g"],config["kolor_tla_elementow_najechane_b"],v.alpha))
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
							dxDrawRectangle(v.x+(v.w-2),v.y+(v.h*(v2.number-1))+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawRectangle(v.x,v.y+(v.h-2)+(v.h*(v2.number-1))+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawText(v2.option,v.x+(v.w/2),v.y+(v.h/2)+(v.h*(v2.number-1))+2,nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),v.textscale,lista_fonty["medium"],"center","center")	
						else
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
							dxDrawRectangle(v.x+(v.w-2),v.y+(v.h*(v2.number-1))+2,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawRectangle(v.x,v.y+(v.h*(v2.number-1))+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawRectangle(v.x,v.y+(v.h-2)+(v.h*(v2.number-1))+2,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
							dxDrawText(v2.option,v.x+(v.w/2),v.y+(v.h/2)+(v.h*(v2.number-1))+2,nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),v.textscale,lista_fonty["medium"],"center","center")	
						end
					end
				end
			end 
		end
    end
end,true,"low") 

-- WYCHWYTYWANIE NACIŚNIECIA NA GRIDLIST
addEventHandler("onClientClick", root, function(btn, state)
    if btn ~= "left" or state ~= "down" then return end
    for k,v in pairs(lista_gridlist) do
		for k,v2 in pairs(lista_gridlist_opcje) do
			if v2.id == v.id then
				if v.disabled ~= true then
					if cursorPosition(v.x,v.y+(v.h*(v2.number-1))+2,v.w,v.h) then
						for k,v2 in pairs(lista_gridlist_opcje) do
							v2.selected = false
						end
						v.selected = v2.option
						v.selectednumber = v2.number
						v2.selected = true	
						v.otwarte = false					
					end
				end
			end
		end
    end
end)