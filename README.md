# System graficznego interfejsu użytkownika do MTA:SA

## DOSTĘPNE GUI
```
• Background<br/>
• Button<br/>
• Checkbox<br/>
• ComboBox<br/>
• EditBox<br/>
• Font<br/>
• GridList<br/>
• Memo<br/>
• ProgressBar<br/>
```
## OPIS ZMIENNYCH
```
x - pozycja "x" na ekranie<br/>
y - pozycja "y" na ekranie<br/>
w - szerokość<br/>
h - wysokość<br/>
id - indywidualna nazwa obiektu<br/>
text - tekst w formacie string<br/>
obramowka - obramówka do okoła (true(tak)/false(nie))<br/>
disabled - wyłączony(brak możliwości wpisania + przyciemnienie) (true(tak)/false(nie))<br/>
alpha - przejrzystność (zakres 0-255)<br/>
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
