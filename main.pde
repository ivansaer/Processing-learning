PImage backgroundimg;
Cube mainCube;

void setup()
{
    size(1200, 600);
    backgroundimg = loadImage("pictures/Bloons.png");
    mainCube = new Cube(35,35,4);
}

void draw()
{
    background(backgroundimg);
    mainCube.updateCube();
}