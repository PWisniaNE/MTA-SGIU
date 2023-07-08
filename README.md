# System graficznego interfejsu użytkownika do MTA:SA
![alt text](http://url/to/img.png)
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
##### Liczby zmiennoprzecinkowe (0.45,11.5,145.56)
```
x(float) - pozycja "x" na ekranie
y(float) - pozycja "y" na ekranie
w(float) - szerokość elementu
h(float) - wysokość elementu
speed(float) - czas w którym progressbar ma zostać załadowany
```
##### Liczby całkowite (1,2,3)
```
alpha(int) - przejrzystność elementu
number(int) - numer dodawanej opcji
textscale(int) - rozmiar skalowania tekstu w przypadku gridlist
```
##### Tekstowy typ danych (AbCd)
```
id(string) - indywidualna nazwa obiektu
text(string) - tekst
option(string) - tekst dodawanej opcji
```
##### Logiczny typ danych (true/false)
```
frame(boolean) - obramówka dookoła
disabled(boolean) - brak możliwości użytkowania + przyciemnienie
state(boolean) - ustawienie pozycji elementu na zaznaczony/nie zaznaczony
default(boolean) - ustawienie odpowiedzialne za ustawienie dodawanej opcji na zaznaczoną
masked(boolean) - ustawienie odpowiedzialne za zamaskowanie tekstu w checkboxie
start(boolean) - ustawienie odpowiedzialne za automatyczne włączenie progressbara po stworzeniu
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
• dxEditboxMasked(id,masked)
• dxEditboxGetText(id)	 
	
• dxFontCreate(id,file,size,bold,quality)		
• dxFontGet()		
	
• dxGridlistCreate(x,y,w,h,id,textscale)	 
• dxGridlistRemove(id)	
• dxGridlistAlpha(id,alpha)	 
• dxGridlistDisabled(id,disabled)
• dxGridlistTextScale(id,textscale)	
• dxGridlistAddOption(id,number,option,default)	 
• dxGridlistRemoveOption(option)	 
• dxGridlistGetOption(id)	
• dxGridlistGetOptionNumber(id)	 	

• dxMemoCreate(x,y,w,h,id)	 
• dxMemoRemove(id)	 
• dxMemoAlpha(id,alpha)	
• dxMemoDisabled(id,disabled)		
• dxMemoSetText(id,text)	 
• dxMemoGetText(id)	 
	
• dxProgressbarCreate(x,y,w,h,id,start,speed)	
• dxProgressbarRemove(id)	 
• dxProgressbarAlpha(id,alpha)	 
• dxProgressbarDisabled(id,disabled)	 
• dxProgressbarGetProgress(id)	
• dxProgressbarRestart(id)	
	
• dxScrollCreate(x,y,w,h,id)	 
• dxScrollRemove(id)	 
• dxScrollAlpha(id,alpha)
• dxScrollDisabled(id,disabled)
• dxScrollGetPosition(id)		
```
