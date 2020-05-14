import bpy
 
#Define vertices, faces, edges
verts = [(0,0,0),(0,5,0),(5,5,0),(5,0,0),(0,0,5),(0,5,5),(5,5,5),(5,0,5)]
faces = [(0,1,2,3), (7,6,5,4), (0,4,5,1), (1,5,6,2), (2,6,7,3), (3,7,4,0)]
 
#Define mesh and object
mymesh = bpy.data.meshes.new("Cube")
myobject = bpy.data.objects.new("Cube", mymesh)
 
#Set location and scene of object
myobject.location = (0,0,5)
bpy.context.collection.objects.link(myobject)
 
#Create mesh
mymesh.from_pydata(verts,[],faces)
mymesh.update(calc_edges=True)
 
# subdivide modifier
myobject.modifiers.new("subd", type='SUBSURF')
 
# Increase subdivisions
myobject.modifiers['subd'].levels = 3
 
# show mesh as smooth
mypolys = mymesh.polygons
for p in mypolys:
    p.use_smooth = True