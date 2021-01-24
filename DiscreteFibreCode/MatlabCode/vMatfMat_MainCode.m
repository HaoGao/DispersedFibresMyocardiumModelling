clear all;
[vMat, fMat] = spheretribydepth(3);
%% level 1 gives 80 triangles 
%% level 2 gives 320
%% level 3 gives 1280

N = size(fMat,1);
nodeFileName = sprintf('sphere_node%d.txt', N);
fid=fopen(nodeFileName,'w');
fprintf(fid,'%i\n', size(vMat,1));
for i=1:size(vMat,1)
    fprintf(fid,'%12.9f \t%12.9f \t%12.9f\n',vMat(i,1),vMat(i,2),vMat(i,3));
end
fclose(fid);


elemFileName = sprintf('sphere_elem%d.txt', N);
fid=fopen(elemFileName,'w');
fprintf(fid,'%i\n', size(fMat,1));
for i=1:size(fMat,1)
    fprintf(fid,'%i \t%i \t%i\n',fMat(i,1),fMat(i,2),fMat(i,3));
end
fclose(fid);

figure;
patch('Vertices',vMat,'Faces',fMat,'FaceColor','g','EdgeColor','k');
axis equal;