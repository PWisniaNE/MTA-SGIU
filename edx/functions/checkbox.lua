-- ZMIENNE
local lista_checkbox = {}

-- DODAWANIE DO LISTY
function dxCheckboxCreate(x,y,w,h,id)	 
    local data_checkbox = {
        x = x,
        y = y,
        w = w,
        h = h,
		state = false,
		disabled = false,
		alpha = 255,
    }
	lista_checkbox[id] = data_checkbox
end

-- USUWANIE Z LISTY
function dxCheckboxRemove(id)	 
	if not lista_checkbox[id] then return end
	lista_checkbox[id] = nil	
end

-- ZMIANA ALPHY
function dxCheckboxAlpha(id,alpha)	 
	if not lista_checkbox[id] then return end
	local checkbox_alpha = lista_checkbox[id]
	checkbox_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxCheckboxDisabled(id,disabled)	 
	if not lista_checkbox[id] then return end
	local checkbox_disabled = lista_checkbox[id]
	checkbox_disabled.disabled = disabled
end

-- ZMIANA CHECKBOX
function dxCheckboxSetState(id,state)	 
	if not lista_checkbox[id] then return end
	local zapischeckbox = lista_checkbox[id]
	zapischeckbox.state = state
end

-- ODCZYT CHECKBOX
function dxCheckboxGetState(id)	 
	if not lista_checkbox[id] then return '' end
	local odczytcheckbox = lista_checkbox[id]
	return odczytcheckbox.state
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_checkbox) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],alpha))	
		else	
			if v.state == true then
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
				dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
				dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
				dxDrawText("✓",v.x+(v.w/2),v.y+(v.h/2),nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["medium"],"center","center")				
			else
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
				dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
				dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			end
		end
    end
end,true,"low") 

-- WYCHWYTYWANIE NACIŚNIECIA NA CHECKBOX
addEventHandler("onClientClick", root, function(btn, state)
    if btn ~= "left" or state ~= "down" then return end
    for k,v in pairs(lista_checkbox) do
        if cursorPosition(v.x,v.y,v.w,v.h) then
            if v.state == true then
				v.state = false
			else
				v.state = true
			end
		end
    end
end)