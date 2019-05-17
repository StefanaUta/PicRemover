function img = micsoreazaInaltime(img,numarPixeliInaltime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
%micsoreaza imaginea cu un numar de pixeli 'numarPixeliInatime' pe inatime (elimina drumuri ->)
%input: img - imaginea initiala
%       numarPixeliInatime - specifica numarul de drumuri ->  eliminate
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

for i = 1:numarPixeliInaltime
    
    disp(['Eliminam drumul orizontal numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliInaltime)]);
    
    %calculeaza energia dupa ecuatia (1) din articol
    E = calculeazaEnergie(img);
    
    %alege drumul orizontal 
    drum = selecteazaDrumOrizontal(E,metodaSelectareDrum);
    %imshow(drum);
    %pause(10);
    %afiseaza drum
    if ploteazaDrum
        ploteazaDrumVertical(img,E,drum,culoareDrum);
        pause(1);
        close(gcf);
    end
    
    %elimina drumul din imagine
    img = eliminaDrumOrizontal(img,drum);

end
