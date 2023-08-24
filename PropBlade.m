% Turbine Blade
smodel = createpde('structural','static-solid');
importGeometry(smodel, 'Prop2.stl');
figure(1)
pdegplot(smodel, 'FaceLabels', 'on', 'FaceAlpha', 0.5);

msh = generateMesh(smodel, 'Hmax', 5,'Hmin', 1);
figure(2)
pdeplot3D(smodel);

% Material properties
E = 227E9;
nu = 0.27;
structuralProperties(smodel, 'YoungsModulus', E, 'PoissonsRatio', nu);
structuralBC(smodel, 'Face', 1, 'Constraint', 'fixed');
%structuralBC(smodel, 'Face', 2, 'Constraint', 'fixed');
%structuralBC(smodel, 'Face', 3, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 4, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 5, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 6, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 7, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 8, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 9, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 10, 'Constraint', 'fixed');
structuralBC(smodel, 'Face', 11, 'Constraint', 'fixed');
% structuralBC(smodel, 'Face', 16, 'Constraint', 'fixed');
% structuralBC(smodel, 'Face', 17, 'Constraint', 'fixed');
% structuralBC(smodel, 'Face', 18, 'Constraint', 'fixed');
% structuralBC(smodel, 'Face', 19, 'Constraint', 'fixed');

% Surrounding Conditions
p1 = 5e5;
p2 = 4.99e5;
structuralBoundaryLoad(smodel, 'Face', 3, 'Pressure', p1);
%structuralBoundaryLoad(smodel, 'Face', , 'Pressure', p1);
structuralBoundaryLoad(smodel, 'Face', 2, 'Pressure', p2);
Rs = solve(smodel);
figure(3)
pdeplot3D(smodel, 'ColorMapData', Rs.VonMisesStress, 'Deformation', Rs.Displacement, 'DeformationScaleFactor', 100);
