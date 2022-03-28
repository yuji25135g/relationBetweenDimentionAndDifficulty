function u = state_gen(A,x0)

size_a = size(A);
step = 20;
time = 20;
samplingWidth = 0.1;

%‰Šúó‘Ô‚©‚çtime‚Ü‚Å‚ÌŠÔ‚Ì”z—ñ
t=0:samplingWidth:(time-1)*samplingWidth;

%ó‘Ô‚Ì‰Šú‰»
x = zeros(size_a(1)*time,1);
start = 1;

for ti = 1:time
    x(start:start+size_a(1)-1) = expm(A*t(ti))*x0;
    start = start+size_a(1);
end
u = repmat(x,1,step);
end
