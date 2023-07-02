# System graficznego interfejsu użytkownika do MTA:SA

## DOSTĘPNE GUI
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
## DOSTĘPNE FUNKCJE
```
• dxBackgroundCreate(x,y,w,h,id,text,obramowka)
• dxBackgroundRemove(id)
• dxBackgroundAlpha(id,alpha)	 
	
• dxButtonCreate(x,y,w,h,id,text,disabled)	 
• dxButtonRemove(id)	 
• dxButtonAlpha(id,alpha)	
	
• dxCheckboxCreate(x,y,w,h,id,disabled)	
• dxCheckboxRemove(id)	
• dxCheckboxAlpha(id,alpha)	 
• dxCheckboxState(id)	
	
• dxComboCreate(x,y,w,h,id)	
• dxComboRemove(id)	 
• dxComboAlpha(id,alpha)	 
• ddxComboAddOption(id,numer,opcja,default)	 
• dxComboRemoveOption(opcja)	 
• dxComboGetOption(id)	
	
• dxEditboxCreate
• dxEditboxRemove
• dxEditboxAlpha
• dxEditboxPassword
• dxEditboxGetText
	
• dxFontCreate	
• dxFontGet		
	
• dxGridlistCreate
• dxGridlistRemove
• dxGridlistAlpha
• dxGridlistAddOption
• dxGridlistRemoveOption
• dxGridlistGetOption

• dxMemoCreate
• dxMemoRemove
• dxMemoAlpha
• dxMemoGetText
	
• dxProgressbarCreate
• dxProgressbarRemove
• dxProgressbarAlpha
• dxProgressbarGetProgress
• dxProgressbarRestart
	
• dxScrollCreate
• dxScrollRemove
• dxScrollAlpha
• dxScrollPosition
```
