//GLOBAL VARIABLES
import java.io.File;
World world;//world which stores the species / populations

World worldOfLegends;//world containing the legends, used for training the legends to be even better


int speed = 30;//the frame rate

//booleans used to control the game state
boolean showAll = true;//whether to show all the snakes in the generation or just the current best snake
boolean trainLegendSnakes = false; //true if training the legends i.e. if running worldOfLegends
boolean showingLegend = false;//true if testing just one legend
boolean fusionGo =false;//true if testing the snake fusion 

float globalMutationRate = 0.01;

//---------------------------------------------------------------------------------------------------------------------------------------------------------  
//run on startup
void setup() {
  frameRate(speed);
  size(800, 500);
  world = new World(5, 2000);
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------  
void draw() {
  background(40);

  drawData();
  
  //training/evolving the legend snakes
  if (trainLegendSnakes) {
    if (!worldOfLegends.done()) {
      worldOfLegends.updateAlive();
    } else {
      //all are dead
      worldOfLegends.geneticAlgorithm();
    }

    //testing a single legend
  } else if (showingLegend) {
    if (world.legend.alive) {
      world.updateLegend();
    } else {
      if(world.legend.len < 100){
        
        world.playLegend(world.legendNo);
      }else{

      showingLegend = false;
      }
    }

    // testing the supersnake fusion
  } else if (fusionGo) {
    if (world.fusedSnake.alive) {
      world.updateSuperSnake();
    } else { //once done set the fusionGo to false
      fusionGo = false;
    }


    //training/evolving population normally
  } else {
    if (!world.done()) {//if there is still a snake alive then update them
      world.updateAlive();
    } else {//if all are dead :(
      world.geneticAlgorithm();
    }
  }
 





}

//---------------------------------------------------------------------------------------------------------------------------------------------------------  

void keyReleased() {
  switch(key) {
  case ' '://toggle show all
    showAll = !showAll;
    break;
  case '+'://speed up frame rate
    speed += 10;
    frameRate(speed);
    break;
  case '-'://slow down frame rate
    if (speed > 10) {
      speed -= 10;
      frameRate(speed);
    }
    break;
  case 'f'://create a fused snake from the legends
    fusionGo  = true;
    world.snakeFusion();
    break;
  case '0'://test legend 0
    showingLegend = true;
    world.playLegend(0);
    break;
  case '1': // test legend no 1
    world.playLegend(1);
    showingLegend = true;
    break;
  case '2'://test legend no 2
    world.playLegend(2);
    showingLegend = true;
    break;
  case '3'://test legend no 3
    world.playLegend(3);
    showingLegend = true;
    break;
  case '4'://test legend no 4
    world.playLegend(4);
    showingLegend = true;
    break;
  case 'h'://halve the mutation rate
    globalMutationRate /=2;
    break;
  case 'd'://double the mutation rate
    globalMutationRate *= 2;
    break;
  case 'l'://train the legends
    trainLegendSnakes =!trainLegendSnakes;
    if (trainLegendSnakes == true) {//load best snakes from file and setup worldOfLegends
      world.loadBestSnakes();
      worldOfLegends = new World(1000, world.SnakesOfLegend);
    }

    
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------  
void drawData() {
 
  fill(255);
  stroke(255);
  line(400, 0, 400, 400);
  line(0, 400, 800, 400);
  textSize(10);
  text("Show all", 0, 350); 
  text("Speed +", 50, 350); 
  text("Speed -", 100, 350); 
  text("Fusion", 150, 350); 
  text("Mutation*2", 200, 350); 
  text("Mutation/2",250, 350); 
  text("Legend",300, 350); 
  textSize(30);
  
float x = 0;
float y = 350;
float w = 40;
float h = 40;

float x2 = 50;
float y2 = 350;
float w2 = 40;
float h2 = 40;

float x3 = 100;
float y3 = 350;
float w3 = 40;
float h3 = 40;

float x4 = 150;
float y4 = 350;
float w4 = 40;
float h4 = 40;

float x5 = 200;
float y5 = 350;
float w5 = 40;
float h5 = 40;

float x6 = 250;
float y6 = 350;
float w6 = 40;
float h6 = 40;

float x7 = 300;
float y7=  350;
float w7 = 40;
float h7 = 40;

rect(x,y,w,h);
 
 rect(x2,y2,w2,h2);

 rect(x3,y3,w3,h3);
 
 rect(x4,y4,w4,h4);
 
 rect(x5,y5,w5,h5);
 
 rect(x6,y6,w6,h6);
 
 rect(x7,y7,w7,h7);



 


  if(mousePressed){
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the button");
   fill(0);
   showAll = !showAll;
  }
    if(mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2){
   println("The mouse is pressed and over the button2");
   fill(0);
    
     speed += 10;
    frameRate(speed);
  }
    if(mouseX>x3 && mouseX <x3+w3 && mouseY>y3 && mouseY <y3+h3){
   println("The mouse is pressed and over the button3");
   fill(0);
     if(speed > 20){
        speed -= 10;
        frameRate(speed);
      }else {
        speed = 10 ;    
        frameRate(speed);
      }
   
     
  }
      if(mouseX>x4 && mouseX <x4+w4 && mouseY>y4 && mouseY <y4+h4){
   println("The mouse is pressed and over the button4");
   fill(0);
    fusionGo  = true;
    world.snakeFusion();
  }
      if(mouseX>x5 && mouseX <x5+w5 && mouseY>y5 && mouseY <y5+h5){
   println("The mouse is pressed and over the button5");
   fill(0);
   
   globalMutationRate *= 2;
  }
      if(mouseX>x6 && mouseX <x6+w6 && mouseY>y6 && mouseY <y6+h6){
   println("The mouse is pressed and over the button6");
   fill(0);
   globalMutationRate /=2;
   if(globalMutationRate > 0.0015){
        globalMutationRate /=2;
       
      }
  }
      if(mouseX>x7 && mouseX <x7+w7 && mouseY>y7 && mouseY <y7+h7){
   println("The mouse is pressed and over the button7");
   fill(0);
   trainLegendSnakes =!trainLegendSnakes;
    if (trainLegendSnakes == true) {//load best snakes from file and setup worldOfLegends
      world.loadBestSnakes();
      worldOfLegends = new World(1000, world.SnakesOfLegend);
  }
}
     
  }
 
  //training/evolving the legend snakes
  if (trainLegendSnakes) {
      
  text("Generation: " + (worldOfLegends.gen), 10, 100); 
    text("Speed: " + speed, 10, 150);
    text("Global Best: " + (worldOfLegends.worldBestScore), 10, 200);
    text("mutation Rate: " + globalMutationRate, 10, 250);    

  } else if (showingLegend) {
   text("Score: " + (world.legend.len-4), 10, 100); 

    // testing the supersnake fusion
  } else if (fusionGo) {
    text("Score: " + (world.fusedSnake.len-4), 10, 100);  

    //training/evolving population normally
  }else {

    text("Generation: " + (world.gen), 10, 100); 
    text("Speed: " + speed, 10, 150);
   text("Global Best: " + (world.worldBestScore), 10, 200);
    text("mutation Rate: " + globalMutationRate, 10, 250);
    
  }
  }
