function d = selecteazaDrumVertical(E,metodaSelectareDrum)
%selecteaza drumul vertical ce minimizeaza functia cost calculate pe baza lui E
%
%input: E - energia la fiecare pixel calculata pe baza gradientului
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%
%output: d - drumul vertical ales

d = zeros(size(E,1),2);

switch metodaSelectareDrum
    case 'aleator'
        %pentru linia 1 alegem primul pixel in mod aleator
        linia = 1;
        %coloana o alegem intre 1 si size(E,2)
        coloana = randi(size(E,2));
        %punem in d linia si coloana coresponzatoare pixelului
        d(1,:) = [linia coloana];
        for i = 2:size(d,1)
            %alege urmatorul pixel pe baza vecinilor
            %linia este i
            linia = i;
            %coloana depinde de coloana pixelului anterior
            if d(i-1,2) == 1%pixelul este localizat la marginea din stanga
                %doua optiuni
                optiune = randi(2)-1;%genereaza 0 sau 1 cu probabilitati egale 
            elseif d(i-1,2) == size(E,2)%pixelul este la marginea din dreapta
                %doua optiuni
                optiune = randi(2) - 2; %genereaza -1 sau 0
            else
                optiune = randi(3)-2; % genereaza -1, 0 sau 1
            end
            coloana = d(i-1,2) + optiune;%adun -1 sau 0 sau 1: 
                                         % merg la stanga, dreapta sau stau pe loc
            d(i,:) = [linia coloana];
        end
        
    
    case 'greedy'
        a=260;
        %gasesc minimul de pe prima linie
        for i=1:size(E,2)
          if(E(1, i)<a)
              a=E(1,i);
              coloana=i;
          end
        end
     d(1, :)=[1 coloana];
     for i=2:size(E,1)
        linia=i;
        if d(i-1,2) == 1%pixelul este localizat la marginea din stanga
                if E(i, 1)>E(i,2)
                  coloana=2;
                else
                  coloana=1;
                end
        elseif d(i-1,2) == size(E,2)%pixelul este la marginea din dreapta
                if E(i, size(E,2))>E(i, size(E,2)-1)
                 coloana=size(E, 2)-1;
                else
                  coloana=size(E,2);
                end
        else
            if E(i, d(i-1,2)+1) < E(i, d(i-1,2))
                if E(i, d(i-1,2)+1)<E(i, d(i-1,2)-1)
                  coloana=d(i-1, 2)+1;
                else
                  coloana=d(i-1, 2)-1;
                end
            else
                if E(i, d(i-1,2))<E(i, d(i-1,2)-1)
                  coloana=d(i-1, 2);
                else
                  coloana=d(i-1, 2)-1;
                end
            end
        end
    d(i, :)=[linia coloana];        
     end
    
    case 'programareDinamica'
        %calculam drumul de cost minim
       M=zeros(size(E,1), size(E,2));    
       for i=1:size(E,2)
           M(1,i)=E(1,i);
       end
       
       for i=2:size(E, 1)
        %prima coloana
        M(i,1)=E(i,1)+min([M(i-1, 1), M(i-1, 2)]);
        %ultima coloana
        M(i, size(E,2))=E(i, size(E,2))+min([M(i-1, size(E,2)), M(i-1, size(E,2)-1)]);
        for k=2:size(E,2)-1
            M(i, k)=E(i,k)+min([M(i-1, k-1), M(i-1, k), M(i-1, k+1)]);
        end
       end
       
      a=intmax('int64');
      %calculam minimul de pe ultima linie
      for i=1:size(E, 2)
            if M(size(E,1), i)<a
                a=M(size(E,1),i);
                coloana=i;
            end
      end
      d(size(E,1),:) = [size(E,1) coloana];
      %facem backtracking pentru a gasi drumul care a dus la costul minim
      %de pe ultima linie
      for i=size(E, 1)-1:-1:1
          if(coloana-1>1)
          if (M(i+1, coloana)-E(i+1, coloana))==M(i, coloana-1)
              coloana=coloana-1;
          end
          end
          if(coloana+1<size(E, 2))
          if (M(i+1, coloana)-E(i+1, coloana))==M(i, coloana+1)
              coloana=coloana+1;
          end
          end
             d(i, :)=[i coloana];
      end
             
    otherwise
        error('Optiune pentru metodaSelectareDrum invalida');
end

end