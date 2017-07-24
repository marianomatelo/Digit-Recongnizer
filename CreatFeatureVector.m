function C = CreatFeatureVector(I)
k = 1;
C = zeros(35,1);
for i = 1:10:70
    for j = 1:10:50
        temp = I(i:i+9,j:j+9);
        C(k) = sum(temp(:));
        k = k+1;
    end
end
C = C./100;
    