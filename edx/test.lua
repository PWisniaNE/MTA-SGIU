-- OTWARTE/ZAMKNIETE
local open = false 

-- TESTOWE GUI
function dx_test() 
	dxDrawText("Przycisk:",620*px,380*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
	dxDrawText("Checkbox:",860*px,380*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])		
	dxDrawText("GridList:",1100*px,380*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
	dxDrawText("Memo:",620*px,480*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
	dxDrawText("Progressbar:",860*px,480*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
	dxDrawText("Scrollbar:",1100*px,480*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"],left)
	dxDrawText("Combobox:",860*px,580*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
	dxDrawText("Editbox:",1100*px,580*py,nil,nil,tocolor(255,255,255,255),1,1,lista_fonty["medium"])	
end

-- KOMENDA NA OTWIERANIE
function TestDX(playerSource,commandName)
	if open == true then
		open = false
		dxBackgroundRemove("test")	
		dxButtonRemove("test")			
		dxCheckboxRemove("test")			
		dxGridlistRemove("test")			
		dxMemoRemove("test")	
		dxProgressbarRemove("test")					
		dxScrollRemove("test")	
		dxComboRemove("test")	
		dxEditboxRemove("test")											
		removeEventHandler("onClientRender", root, dx_test)		
		showCursor(false)		
	else
		open = true
		addEventHandler("onClientRender", root, dx_test)	
		showCursor(true)				
		dxBackgroundCreate(610*px,340*py,700*px,400*py,"test","Menu testowe",true)	
		dxBackgroundAlpha("test",200)
		dxButtonCreate(620*px,410*py,200*px,50*py,"test","Output Test")	
		dxCheckboxCreate(860*px,410*py,50*px,50*py,"test")	
		dxCheckboxSetState("test",true)		
		dxGridlistCreate(1100*px,410*py,200*px,20*py,"test",0.5)		
		dxGridlistAddOption("test",1,"Jeden")
		dxGridlistAddOption("test",2,"Dwa")
		dxGridlistAddOption("test",3,"Trzy")	
		dxMemoCreate(620*px,510*py,200*px,150*py,"test")	
		dxProgressbarCreate(860*px,510*py,200*px,50*py,"test",true,0.02)		
		dxScrollCreate(1100*px,510*py,200*px,50*py,"test",true,0.02)		
		dxComboCreate(860*px,610*py,200*px,50*py,"test")			
		dxComboAddOption("test",1,"Jeden",true)
		dxComboAddOption("test",2,"Dwa")
		dxComboAddOption("test",3,"Trzy")
		dxEditboxCreate(1100*px,610*py,200*px,50*py,"test")				
		dxEditboxMasked("test",true)		
	end
end
addCommandHandler("testdx",TestDX)

-- RESET SCROLL BAR
addEventHandler("onClientClick", root, function(b, s)
	if not open == true then return end
	if cursorPosition(860*px,510*py,200*px,50*py) then
		if s == "down" then
			dxProgressbarRestart("test")		
		end
	end
	if cursorPosition(620*px,410*py,200*px,50*py) then
		if s == "down" then
			outputChatBox("Editbox: "..dxEditboxGetText("test"))
			outputChatBox("Memo: "..dxMemoGetText("test"))
			outputChatBox("Combo: "..dxComboGetOption("test"))
			outputChatBox("ComboNumber: "..dxComboGetOptionNumber("test"))			
			outputChatBox("Checkbox: "..tostring(dxCheckboxGetState("test")))	
			outputChatBox("Scroll: "..dxScrollGetPosition("test"))	
			outputChatBox("Gridlist: "..dxGridlistGetOption("test"))		
			outputChatBox("GridlistNumber: "..dxGridlistGetOptionNumber("test"))		
			outputChatBox("Progressbar: "..dxProgressbarGetProgress("test"))		
		end
	end	
end) 