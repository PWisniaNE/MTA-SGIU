# System graficznego interfejsu użytkownika do MTA:SA

## AKTUALNIE DOSTĘPNE GUI
```
• Background
• Button
• Checkbox
• ComboBox
• EditBox
• Font
• GridList
• Memo
• ProgressBar
```
## OPIS ZMIENNYCH
```
x - pozycja "x" na ekranie
y - pozycja "y" na ekranie
w - szerokość
h - wysokość
id - indywidualna nazwa obiektu
text - tekst w formacie string
obramowka - obramówka do okoła (true(tak)/false(nie))
disabled - wyłączony(brak możliwości wpisania + przyciemnienie) (true(tak)/false(nie))
alpha - przejrzystność (zakres 0-255)
```
## FUNKCJE
```
• dxBackgroundCreate(x,y,w,h,id,text,frame)
• dxBackgroundRemove(id)	
• dxBackgroundAlpha(id,alpha)	
	
• dxButtonCreate(x,y,w,h,id,text)	
• dxButtonRemove(id)	 
• dxButtonAlpha(id,alpha)	
• dxButtonDisabled(id,disabled)	 
	
• dxCheckboxCreate(x,y,w,h,id)	 
• dxCheckboxRemove(id)	 
• dxCheckboxAlpha(id,alpha)	 
• dxCheckboxDisabled(id,disabled)	 
• dxCheckboxSetState(id,state)	
• dxCheckboxGetState(id)	 
	
• dxComboCreate(x,y,w,h,id)	 
• dxComboRemove(id)	 
• dxComboAlpha(id,alpha)	 
• dxComboDisabled(id,disabled)	 	
• dxComboAddOption(id,number,option,default)	 
• dxComboRemoveOption(option)	
• dxComboGetOption(id)	 
• dxComboGetOptionNumber(id)	 

• dxEditboxCreate(x,y,w,h,id)
• dxEditboxRemove(id)
• dxEditboxAlpha(id,alpha)	
• dxEditboxDisabled(id,disabled)	 	
• dxEditboxMasked(id,variable)
• dxEditboxGetText(id)	 
	
• dxFontCreate(id,file,size,bold,quality)		
• dxFontGet()		
	
• dxGridlistCreate(x,y,w,h,id,textscale)	 
• dxGridlistRemove(id)	
• dxGridlistAlpha(id,alpha)	 
• dxGridlistDisabled(id,disabled)
• dxGridlistTextScale(id,scale)	
• dxGridlistAddOption(id,number,option,default)	 
• dxGridlistRemoveOption(option)	 
• dxGridlistGetOption(id)	
• dxGridlistGetOptionNumber(id)	 	

• dxMemoCreate
• dxMemoRemove
• dxMemoAlpha
• dxMemoDisabled	
• dxMemoSetText
• dxMemoGetText
	
• dxProgressbarCreate
• dxProgressbarRemove
• dxProgressbarAlpha
• dxProgressbarDisabled	
• dxProgressbarGetProgress
• dxProgressbarRestart
	
• dxScrollCreate
• dxScrollRemove
• dxScrollAlpha
• dxScrollDisabled	
• dxScrollGetPosition
```
