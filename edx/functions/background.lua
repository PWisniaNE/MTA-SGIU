-- ZMIENNE
local lista_backgrounds = {}

-- DODAWANIE DO LISTY
function dxBackgroundCreate(x,y,w,h,id,text,frame)	 
    local data_background = {
        x = x,
        y = y,
        w = w,
        h = h,
		text = text,
		frame = frame,
		alpha = 255,
    }
	lista_backgrounds[id] = data_background
end

-- USUWANIE Z LISTY
function dxBackgroundRemove(id)	
	if not lista_backgrounds[id] then return end 
	lista_backgrounds[id] = nil	
end

-- ZMIANA ALPHY
function dxBackgroundAlpha(id,alpha)	 
	if not lista_backgrounds[id] then return end
	local background_alpha = lista_backgrounds[id]
	background_alpha.alpha = alpha
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_backgrounds) do
		dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_r"],config["kolor_tla_g"],config["kolor_tla_b"],v.alpha))		
		if v.text and v.text ~= nil then
			dxDrawRectangle(v.x,v.y,v.w,20,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))			
			dxDrawText(v.text,v.x+(v.w/2),v.y+9,nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["medium"],"center","center")	
		end
		if v.frame == true then
			dxDrawRectangle(v.x,v.y+20,2,v.h-20,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y+20,2,v.h-20,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			if not v.text or v.text == "" or v.text == nil then
				dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			end
		end
    end
end,true,"high")