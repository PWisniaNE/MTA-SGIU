-- ZMIENNE
local lista_progressbar = {}

-- DODAWANIE DO LISTY
function dxProgressbarCreate(x,y,w,h,id,start,speed)	 
    local data_progressbar = {
        x = x,
        y = y,
        w = w,
        h = h,
		start = start,
		speed = speed,
		disabled = disabled,
		progress = 0,
		alpha = 255,
    }
	lista_progressbar[id] = data_progressbar
end

-- USUWANIE Z LISTY
function dxProgressbarRemove(id)	 
	if not lista_progressbar[id] then return end
	lista_progressbar[id] = nil	
end

-- ZMIANA ALPHY
function dxProgressbarAlpha(id,alpha)	 
	if not lista_progressbar[id] then return end
	local progressbar_alpha = lista_progressbar[id]
	progressbar_alpha.alpha = alpha
end

-- ZMIANA OPCJI DISABLED
function dxProgressbarDisabled(id,disabled)	 
	if not lista_progressbar[id] then return end
	local progressbar_disabled = lista_progressbar[id]
	progressbar_disabled.disabled = disabled
end

-- ODCZYT ILOŚCI
function dxProgressbarGetProgress(id)	 
	if not lista_progressbar[id] then return '' end
	local progressbarpro = lista_progressbar[id]
	return progressbarpro.progress
end

-- RESTART
function dxProgressbarRestart(id)	
	if not lista_progressbar[id] then return end
	local wybranaopcja = lista_progressbar[id]
	wybranaopcja.progress = 0
end

-- RENDEROWANIE
addEventHandler("onClientRender", root, function()
    for k,v in pairs(lista_progressbar) do
		if v.disabled == true then
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_disabled_r"],config["kolor_tla_disabled_g"],config["kolor_tla_disabled_b"],v.alpha))
			dxDrawRectangle(v.x,v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
			dxDrawRectangle(v.x+(v.w-2),v.y,2,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y,v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))		
			dxDrawRectangle(v.x,v.y+(v.h-2),v.w,2,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))				
		else
			if v.start == true then
				local timestart = getTickCount(  )	
				local iloscdomaksa = v.w/100
				v.progress = math.min(v.progress+v.speed,1) 
				aktualnailosc = interpolateBetween(0,0,0,200,0,0,v.progress,"Linear") 	
			else
				aktualnailosc = 0
			end
			dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(config["kolor_tla_elementow_r"],config["kolor_tla_elementow_g"],config["kolor_tla_elementow_b"],v.alpha))	
			dxDrawRectangle(v.x,v.y,aktualnailosc,v.h,tocolor(config["kolorystyka_ogolna_r"],config["kolorystyka_ogolna_g"],config["kolorystyka_ogolna_b"],v.alpha))	
		end
    end
end,true,"low")