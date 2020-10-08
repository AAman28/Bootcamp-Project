float x;
float y;
float score;


//3 variables, positions (x,y) and a score counter

void setup()
{
  size(400, 400);  // size of the window
  noStroke();
  x = random(width); // find random width
  y = random(height); // find random height
  score = 0; // when the game starts, the score will be 0
}




void draw()
{
  background(200);
  fill(0);
  text("Score : " +score, 310, 25); //visual score for user to see

  //red circle for user to intercept
  fill(255, 0, 0);
  ellipse(x, y, 25, 25); // the ellipse that will appear based on the x,y coords

  //making the circle move through the window(as the window changes every second)
  x = x+0;
  y = y+10;

  //making the blue circle that the player will move
  fill(0, 255, 255);
  ellipse(mouseX, mouseY, 60, 60); // circle that follows the coordinates of the mouse

  //checking to see if the red circle leaves the window
  if (x> width || y>height)// if the values x,y exceed the window
  {
    x = random(width);
    y = 0;
    score = score -1; //if the circle leaves the window then -1 is added to the score
    if (score == -3)
    {
      background(0);
      textSize(20);
      text("Game over! Don't reach a score of -3!", 0, height/2);
      frameRate(0); //end screen for once the user has lost
    }
  }
  // taking into account the size of the circle(60) and the position of the circle and mouse
  if (x>mouseX-30 && x<mouseX+30 && y>mouseY-30 && y<mouseY+30)

  {
    x = random(width);
    y = 0;
    //reset the x and y values as the user has hovered over a circle
    score = score +1;
    //give the user a point for hovering over a circle
    if (score ==35)
    {
      background(0);
      textSize(20);
      text("Victory! You attained a score of 35!", 0, height/2);
      frameRate(0); //end screen for once the user has beat the game
    }
  }
}
