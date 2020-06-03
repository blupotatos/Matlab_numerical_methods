%prova preparazione secondo test laboratorio
%-------------------------------------------------------------------------
%calcolare E(T) per T pari a 213K con almeno 10 cifre significative esatte
%usando la formula di quadratura CS composta.
%-------------------------------------------------------------------------

fid=fopen('energia.txt','w');
fprintf(fid, '\n%8s %16s','N.sudd.', 'I_simp');


%definisco parametro temperatura ed estremi integrazione
T=213; toll=1e-11;
a=3e-4; b=14e-4;
err=[];
%definisco funzione integranda
f=@(x) 1/(x.^5.*(exp(1.432./(T*x))-1));

I_quad = quad(f,a,b,toll);

m=1; diff=1; I_simp_old=0; %inizializzo parametri del while

%calcolo integrale con m=1,2,3...suddivisioni e mi fermo quando la diff tra
%due approssimazione è minore o uguale a 1e-11

while diff > toll
    [x, w, I_simp] = simpson_composta(m,a,b,f);  %m numero suddicisioni
    diff = abs(I_simp - I_simp_old);
    err=[err, abs(I_simp - I_quad)];
    I_simp_old = I_simp;
   
    fprintf(fid, ' \n %d        %20.14f\n',m ,I_simp);
    m=m+1;
end


%scrivo a video valore finale ottenuto
fprintf('\nsuddivisioni: %7d\n', m-1);
fprintf('valore integrale finale:  %20.14f \n', I_simp);
fprintf('valore calcolato con quad: %20.14f \n', I_quad);

%grafico errore differenza I_simo e I_vero
plot(1:m-1, err, 'r-*');
title('errore Vs. suddivisioni');
xlabel('suddivisioni intervallo');
ylabel('errore');

print -dpdf errore.pdf
fid(close);