class plane{
  float G = 5000000;
  int gap;
  plane(int GAP){
   gap = GAP;
  }
  
  void gravityLines(int i , int j ,int k, PVector [] pos){
    int I = i/gap;
    int J = j/gap;
    int K = k/gap;
    
    PVector[][][] gradient = new PVector[width/gap+1][height/gap+1][width/gap+1];
    gradient[I][J][K] = new PVector(i,j,k);   
    float strength = 0;
    
    for(int f =0 ; f < pos.length ; f++){
      PVector distance = new PVector(pos[f].x - i ,pos[f].y - j,pos[f].z - k);
      
       strength = G/(distance.mag()*distance.mag());
      PVector direction = distance.setMag(1);
      PVector line = direction.mult(strength);
      
      gradient[I][J][K].add(line);
    }         
    
    //line(gradient[I][J].x, gradient[I][J].y, i , j);
    //ellipse(gradient[I][J].x, gradient[I][J].y, 2 , 2);
    //PVector radius = new PVector(gradient[I][J][K].x - width/2,gradient[I][J][K].y - height/2,gradient[I][J][K].z - width/2);
    //float Color = map(width -gradient[I][J][K].x,0,width,0,100);
    float thc = map(strength,0,1000,0.7,1.4);
    
    stroke(255);
    strokeWeight(thc);
    point(gradient[I][J][K].x,gradient[I][J][K].y,gradient[I][J][K].z);
    line(gradient[I][J][K].x,gradient[I][J][K].y,gradient[I][J][K].z,i,j,k);
   
    
    //  if(strength>100 && radius.mag()>150){
    ////point(gradient[I][J][K].x,gradient[I][J][K].y,gradient[I][J][K].z);
    //line(gradient[I][J][K].x,gradient[I][J][K].y,gradient[I][J][K].z,i,j,k);
    //}
    
   
    
  }
}
