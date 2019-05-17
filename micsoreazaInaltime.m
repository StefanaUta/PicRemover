function img = micsoreazaInaltime(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
%micsoreaza imaginea cu un numar de pixeli 'numarPixeliLatime' pe latime (elimina drumuri de sus in jos) 
%
%input: img - imaginea initiala
%       numarPixeliLatime - specifica numarul de drumuri de sus in jos eliminate
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%       ploteazaDrum - specifica daca se ploteaza drumul gasit la fiecare pas. Valori posibile:
%                    0 - nu se ploteaza
%                    1 - se ploteaza
%       culoareDrum  - specifica culoarea cu care se vor plota pixelii din drum. Valori posibile:
%                    [r g b]' - triplete RGB (e.g [255 0 0]' - rosu)          
%                           
% output: img - imaginea redimensionata obtinuta prin eliminarea drumurilor
%rotim imaginea pentru a aplica acelasi algoritm ca la micsoreazaLatime
imag=imrotate(img, -90);

for i = 1:numarPixeliLatime
    
    disp(['Eliminam drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    
    %calculeaza energia dupa ecuatia (1) din articol
    E = calculeazaEnergie(imag);
    
    %alege drumul vertical care conecteaza sus de jos
    drum = selecteazaDrumVertical(E,metodaSelectareDrum);
    %imshow(drum);
    %pause(10);
    %afiseaza drum
    if ploteazaDrum
        ploteazaDrumVertical(imag,E,drum,culoareDrum);
        pause(1);
        close(gcf);
    end
    
    %elimina drumul din imagine
    imag = eliminaDrumVertical(imag,drum);
   
end
%rotim imaginea la loc
 img=imrotate(imag, 90);
