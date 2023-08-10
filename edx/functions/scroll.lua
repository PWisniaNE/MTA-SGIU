-- ZMIENNE
local lista_scroll = {}

-- DODAWANIE DO LISTY
function dxScrollCreate(x,y,w,h,id)	 
    local data_scroll = {
		id = id,
        x = x,
        y = y,
        w = w,
        h = h,
		pozycja = y,
		move = false,
		disabled = false,		
		alpha = 255,		
    }
	lista_scroll[id] = data_scroll
end
 
-- USUWANIE Z LISTY
function dxScrollRemove(id)	 
	if not lista_scroll[id] then return end
	lista_scroll[id] = nil	
end

-- ZMIANA ALPHY
function dxScrollAlpha(id,alpha)	
	if not lista_scroll[id] then return end 
	local scroll_alpha = lista_scroll[id]
	scroll_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxScrollDisabled(id,disabled)	 
	if not lista_scroll[id] then return end
	local scroll_disabled = lista_scroll[id]
	scroll_disabled.disabled = disabled
end

-- ODCZYT POZYCJI SCROLLA
function dxScrollGetPosition(id)	
	if not lista_scroll[id] then return 0 end 
	local odczytpozycja = lista_scroll[id]
	return odczytpozycja.pozycja
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_scroll) do
		--SCROLL
		if v.pozycja > ((v.y+v.h)-20) then
			v.pozycja = (v.y+v.h)-20
		elseif v.pozycja < v.y then
			v.pozycja = v.y
		end	
		fixedpozycja = v.y-v.pozycja		
		dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))
		dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
		dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
		dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
		-- TESTOWA WIADOMOŚĆ, NORMALNIE INTERFEJS POWINIEN POBIERAĆ POZYCJE SCROLLA I NA JEJ PODSTAWIE ZMIENIAĆ POZYCJE ELEMENTÓW -- NORMALNIE TEGO TUTAJ NIE POWINNO BYĆ
		dxDrawText("Testowa\nWiadomość",v.x+10,v.y+fixedpozycja,nil,nil,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha),1,lista_fonty["medium"],"left","top")
		--
		dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))				
		dxDrawRectangle(v.x+v.w-20,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
		if v.disabled == true then
			dxDrawRectangle(v.x+v.w-20,v.pozycja,20,20,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],v.alpha))	
		else
			dxDrawRectangle(v.x+v.w-20,v.pozycja,20,20,tocolor(config["kolor_tekstu_r"],config["kolor_tekstu_g"],config["kolor_tekstu_b"],v.alpha))			
		end
    end
end,true,"low") 

-- WYCHWYTYWANIE NACIŚNIECIA/PUSZCZENIA SCROLLA
addEventHandler("onClientClick", root, function(b, s)
    for k,v in pairs(lista_scroll) do
		if v.disabled ~= true then
			if cursorPosition(v.x,v.pozycja,v.w,v.h) then
					if s == "down" then
					v.move = true
				else
					v.move = false
				end	
			end
			if s == "up" then
				v.move = false
			end	
		end
	end
end)

-- WYCHWYTYWANIE RUCHU MYSZKĄ
addEventHandler("onClientCursorMove", getRootElement( ),function( _, _, x, y )
	for k,v in pairs(lista_scroll) do
		if v.disabled ~= true then
			if v.move == true then
				v.pozycja = y
			end
		end
	end
end)