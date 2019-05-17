function imgA=amplificaContinut(img,scale,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);

[h, w, v]=size(img);
%redimensionam imaginea
imgA=imresize(img, scale);
[H, W, v]=size(imgA);
%eliminam drumuri veritcale si orizontale de cost minim pentru a reduce
%imaginea la marimea initiala
imgA=micsoreazaLatime(imgA, W-w, "programareDinamica", 0, culoareDrum);
imgA=micsoreazaInaltime(imgA, H-h,"programareDinamica", 0, culoareDrum);
end