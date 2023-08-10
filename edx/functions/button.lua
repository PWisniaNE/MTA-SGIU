-- ZMIENNE
local lista_buttons = {}

-- DODAWANIE DO LISTY
function dxButtonCreate(x,y,w,h,id,text)	 
    local data_button = {
        x = x,
        y = y,
        w = w,
        h = h,
		text = text,
		disabled = false,
		alpha = 255,
    }
	lista_buttons[id] = data_button
end

-- USUWANIE Z LISTY
function dxButtonRemove(id)	 
	if not lista_buttons[id] then return end
	lista_buttons[id] = nil	
end

-- ZMIANA ALPHY
function dxButtonAlpha(id,alpha)	
	if not lista_buttons[id] then return end 
	local button_alpha = lista_buttons[id]
	button_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxButtonDisabled(id,disabled)	 
	if not lista_buttons[id] then return end
	local button_disabled = lista_buttons[id]
	button_disabled.disabled = disabled
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_buttons) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],v.alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))				
		else
			if cursorPosition(v.x,v.y,v.w,v.h) then
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_najechane_r"],config["kolor_tla_elementow_najechane_g"],config["kolor_tla_elementow_najechane_b"],v.alpha))
				dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
				dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))			
			else
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
				dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
				dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
				dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))					
			end	
			dxDrawText(v.text,v.x+(v.w/2),v.y+(v.h/2),nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["medium"],"center","center")	
		end
    end
end,true,"low")