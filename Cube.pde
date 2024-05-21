PVector[] mapNodes = {new PVector(213,304),new PVector(221,281),new PVector(232,256),new PVector(241,222),new PVector(252,194),new PVector(273,166),new PVector(321,142),new PVector(442,149),new PVector(474,181),new PVector(498,207),new PVector(509,241),new PVector(517,258),new PVector(524,280),new PVector(531,298),new PVector(536,304),new PVector(744,306),new PVector(762,316),new PVector(769,345),new PVector(777,375),new PVector(792,426),new PVector(817,449),new PVector(837,465),new PVector(874,468),new PVector(917,459),new PVector(949,436),new PVector(968,400),new PVector(984,365),new PVector(992,332),new PVector(1003,311),new PVector(1049,307),new PVector(1099,307),new PVector(1139,308),new PVector(1133,339),new PVector(1077,343),new PVector(1028,342),new PVector(1021,365),new PVector(1017,394),new PVector(1005,431),new PVector(993,458),new PVector(972,478),new PVector(935,497),new PVector(904,505),new PVector(865,506),new PVector(836,500),new PVector(799,492),new PVector(777,467),new PVector(747,418),new PVector(738,384),new PVector(726,349),new PVector(718,338),new PVector(500,333),new PVector(486,309),new PVector(479,278),new PVector(461,237),new PVector(448,203),new PVector(396,169),new PVector(356,168),new PVector(323,180),new PVector(301,206),new PVector(271,256),new PVector(264,279),new PVector(256,311),new PVector(248,333),new PVector(240,341),new PVector(1,339)};
PVector spawnPoint = new PVector(1,304);

class Cube
{
    PVector directionVec, position;
    int health, damage, speed, currentNode;
    int cubeSize = 32;
    Cube(int i_health, int i_damage, int i_speed)
    {
        this.health = i_health;
        this.damage = i_damage;
        this.speed = i_speed;
        this.directionVec = PVector.sub(mapNodes[0], spawnPoint).normalize();
        this.position = spawnPoint;
        this.currentNode = 0;
    }

    void updateCube()
    {
        square(position.x +directionVec.x *speed - cubeSize/ 2, position.y +directionVec.y *speed - cubeSize/2, cubeSize);        
        position = PVector.add(position, PVector.mult(directionVec, speed));
        checkMapNode();
    }
    void checkMapNode()
    {
    if (currentNode + 1 >=mapNodes.length) 
    {
        return;
    }
    
        println(PVector.dist(PVector.add(position, new PVector(cubeSize/ 2, cubeSize/2)), mapNodes[currentNode]));
        if(PVector.dist(position, mapNodes[currentNode])<= speed)
        {
            directionVec = PVector.sub(mapNodes[currentNode + 1], position). normalize();
            currentNode++;
        }
    }
}
