Table table;
int elem_1;
int elem_2;
int elem_3;
int elem_4;
int elem_5;
int elem_6;
int elem_7;
int elem_8;

void loadData() {
  table = loadTable("csvfile.csv", "header");
  
  int i = int(random(0,4));
    TableRow row = table.getRow(i);
    // You can access the fields via their column name (or index)
    elem_1 = row.getInt("1");
    elem_2 = row.getInt("2");
    elem_3 = row.getInt("3");
    elem_4 = row.getInt("4");
    elem_5 = row.getInt("5");
    elem_6 = row.getInt("6");
    elem_7 = row.getInt("7");
    elem_8 = row.getInt("8");
    print(elem_1,elem_2,elem_3,elem_4,elem_5,elem_6,elem_7,elem_8);

}
void setup() {
    loadData();

  // The text from the file is loaded into an array. 
  size(600, 600);
  background(100);
  smooth();
  noStroke();

  //
  int diameter = 450;
  int[] angs = {elem_1, elem_2, elem_3, elem_4, elem_5, elem_6, elem_7, elem_8};

  float lastAng = 0;

  //pie chart 

  for (int i=0; i< angs.length; i++) {
    //makes colors different randomly everytime
    fill(angs[i]*random(1, 9), angs[i]*random(1, 9), angs[i]*random(1, 9));
    arc(width/2, height/2, diameter, diameter, lastAng, lastAng+radians(angs[i]));
    lastAng += radians(angs[i]);
  }
}
