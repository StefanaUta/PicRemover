function imgRedimensionata = redimensioneazaImagine(img,parametri)
%redimensioneaza imaginea
%
%input: img - imaginea initiala
%       parametri - stuctura de defineste modul in care face redimensionarea 
%
% output: imgRedimensionata - imaginea redimensionata obtinuta


optiuneRedimensionare = parametri.optiuneRedimensionare;
metodaSelectareDrum = parametri.metodaSelectareDrum;
ploteazaDrum = parametri.ploteazaDrum;
culoareDrum = parametri.culoareDrum;

switch optiuneRedimensionare
    
    case 'micsoreazaLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'micsoreazaInaltime'
        numarPixeliLatime=parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaInaltime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'maresteLatime'
        numarPixeliLatime=parametri.numarPixeliLatime;
        imgRedimensionata=maresteLatime(img, numarPixeliLatime);
        
    case 'maresteInaltime'
         numarPixeliLatime=parametri.numarPixeliLatime;
        imgRedimensionata=maresteInaltime(img, numarPixeliLatime);
    
    case 'amplificaContinut'
        scale=1.3;
        imgRedimensionata=amplificaContinut(img,scale,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    
    case 'eliminaObiect'
        imgRedimensionata=eliminaObiect(img);
    
end