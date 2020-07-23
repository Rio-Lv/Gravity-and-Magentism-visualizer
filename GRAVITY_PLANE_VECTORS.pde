// Rogerio Wong
// 20/02/20
# testing first changes using git hub
int gap = 90;// the space between each coordinate of space

PVector[] pos; // array of vector positions that carry a mass
plane A; // representes the space that is deformed by a mass

void setup(){
  size(1000,1000,P3D); // size of the 3D canvas that the simulation will take place
  background(0);       // if background of the draw loop is commented out, this ensures a white background
  // background in the setup is not required to show the vectors as the mass moves
  pos = new PVector[1];// decides the nunber of particle to be included in the simulation
  A = new plane(gap);   
}

void draw(){
 
  background(0);
  
  translate(width/2,height/2,-0.6*width); // centres the axis of rotation
  rotateY(0.00005*millis());  // slow rotation of the simulation to better show the motion of the particle
  // rotateX(0.00005*millis()); // optionall slow rotation along other axis
  // rotateZ(0.00005*millis()); // 
  // rotateX(PI); // new starting angle of the plane
  translate(-width/2,-height/2,-width/2); // transalation back to 0,0 so that the mass does not start offset
 
  
  pos[0] = new PVector(width/2 ,height/2+70*sin(0.0009*millis()) ,width/2);
  //position of the mass, the hieght is oscillation using the millis(constant time increment) and sin function
  //pos[1] = new PVector(width/2-200 ,height/2+70*sin(0.0009*millis()),width/2); 
  //optional second mass position, Any number of particle can be written on to one plane
 
   
  for(int i = 0 ; i <= width ; i += gap){// sets each coordinate of the plane which will then interact with the masses
    for(int j = 0; j <= height ; j +=gap){
      for(int k = 0; k <= height ; k +=gap){
       A.gravityLines(i,j,k,pos);
     
      
     
    }}}
  
}
