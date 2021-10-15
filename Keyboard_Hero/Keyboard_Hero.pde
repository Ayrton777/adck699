import processing.sound.*;
import processing.video.*;

int title; //check if on title screen, select song screen or game
int select;
int game;
int timer;
int easy;
int hard;
int difficulty;

float[] JN; //note arrays
float[] KN;
float[] LN;

float JNote; // input 1 (x)
float KNote; // input 2 (x)
float LNote; // input 3 (x)

float JNoteX; //starting points of each note and note size
float JNoteY;
float KNoteX;
float KNoteY;
float LNoteX;
float LNoteY;
float NoteSize;

PFont scoreFont;
PFont startFont;
PImage titlescr;
PImage difficultyscr;
PImage selectscr;
int score;

boolean nice;  //check if notes hit
boolean fail;

Movie myVideo;
SoundFile song;
SoundFile songfast;
SoundFile intro;

//

void setup()
{
  size(600, 900);

  nice = false;
  score = 0;

  JNote = 150;
  KNote = 300;
  LNote = 450;

  NoteSize = 80;
  JNoteX = 150;
  JNoteY = 30;
  KNoteX = 300;
  KNoteY = 30;
  LNoteX = 450;
  LNoteY = 30;

  scoreFont = createFont("Arial Bold", 60);
  startFont = createFont("Impact", 80);
  titlescr = loadImage("startscr.jpg");
  selectscr = loadImage("selectscr.jpg");
  difficultyscr = loadImage("Difficulty.jpg");


  intro  = new SoundFile(this, "intro.mp3");
  intro.play();
  song  = new SoundFile(this, "TetrisSlow.mp3");
  songfast = new SoundFile(this, "TetrisFast.mp3");
  myVideo = new Movie(this, "TetrisGame.mp4");
  myVideo.play();
  //variables to change screen
  title = 1;
  select = 0;
  game = 0;
  difficulty = 0;
  easy = 0;
  hard = 0;
}

void draw()
{
  background(255);
  //START SCREEN

  if (title== 1)
  {
    image(titlescr, 0, 0);
  } else if (select==1)
  {
    background(255, 255, 255);
    image(selectscr, 0, 0);

    fill(255, 255, 255);
    rect(200, 170, 300, 150);
    rect(200, 370, 300, 150);
    rect(200, 570, 300, 150);
    fill(0, 0, 0);

    textSize(80);
    text("SELECT SONG", 100, 120);
    fill(40, 70, 255);
    text("TETRIS", 230, 280);
    fill(255, 50, 80);
    text("MARIO", 230, 480);
    fill(255, 223, 0);
    text("ZELDA", 230, 680);

    if ((mouseX>200 && mouseX<500)&&(mouseY>370 && mouseY<520))
    {
      fill(139, 0, 0);
      textSize(60);
      rotate(radians(10));
      text("COMING SOON", 270, 410);
    }

    if ((mouseX>200 && mouseX<500)&&(mouseY>570 && mouseY<720))
    {
      fill(139, 0, 0);
      textSize(60);
      rotate(radians(10));
      text("COMING SOON", 290, 600);
    }
  } else if (difficulty ==1)
  {
    background(255, 255, 255);
    image(difficultyscr, 0, 0);
    fill(255, 255, 255);
    rect(200, 570, 300, 150);
    rect(200, 370, 300, 150);
    fill(0, 0, 0);
    text("DIFFICULTY", 100, 120);
    text("EASY", 230, 480);
    text("HARD", 230, 680);
  } else if (hard==1&&easy==0) //HARD MODE
  {
    background(255, 255, 255);
    image(myVideo, 0, 0, 600, 900);
    textFont(scoreFont);
    fill(0, 0, 0);
    text("J", 135, 817);
    text("K", 278, 818);
    text("L", 433, 818);
    textSize(35);
    fill(255, 165, 0);
    text("Score:" + score, 400, 100);

    fill(255, 0, 0, 80);
    circle(JNote, 800, NoteSize);

    fill(0, 255, 0, 80);
    circle(KNote, 800, NoteSize);

    fill(0, 0, 255, 80);
    circle(LNote, 800, NoteSize);

    JN = new float[24];
    JN[0] = JNoteY-350;
    JN[1] = JNoteY - 465;
    JN[2] = JNoteY  -915;
    JN[3] = JNoteY - 1100;
    JN[4] = JNoteY-1200;
    JN[5] = JNoteY - 1400;
    JN[6] = JNoteY-2450;
    JN[7] = JNoteY - 2600;
    JN[8] = JNoteY-2800;
    JN[9] = JNoteY - 2950;
    JN[10] = JNoteY-3400;
    JN[11] = JNoteY - 3950;
    JN[12] = JNoteY-4050;
    JN[13] = JNoteY - 350 -4050;
    JN[14] = JNoteY - 465 - 4050;
    JN[15]= JNoteY - 915 - 4050;
    JN[16] = JNoteY - 1100 - 4050;
    JN[17] = JNoteY - 1200 -4050;
    JN[18] = JNoteY - 1400 -4050;
    JN[19] = JNoteY - 2450 -4050;
    JN[20]= JNoteY - 2600- 4050;
    JN[21]= JNoteY - 2800 - 4050;
    JN[22] = JNoteY - 2950 - 4050;
    JN[23] = JNoteY - 3400 - 4050;

    KN = new float[32];
    KN[0] =KNoteY-35;
    KN[1] =KNoteY - 295;
    KN[2] = KNoteY - 535;
    KN[3] = KNoteY-851;
    KN[4] = KNoteY-1300;
    KN[5] = KNoteY-1500;
    KN[6] = KNoteY-1650;
    KN[7] = KNoteY-2050;
    KN[8] = KNoteY-2150;
    KN[9] = KNoteY-2350;
    KN[10] = KNoteY-2700;
    KN[11] = KNoteY-2900;
    KN[12]= KNoteY-3020;
    KN[13]= KNoteY-3300;
    KN[14]= KNoteY-3500;
    KN[15]= KNoteY-3600;
    KN[16]= KNoteY-35-4050;
    KN[17]= KNoteY-295-4050;
    KN[18]= KNoteY-535-4050;
    KN[19]= KNoteY-851-4050;
    KN[20]= KNoteY-1300-4050;
    KN[21]= KNoteY-1500-4050;
    KN[22]= KNoteY-1650-4050;
    KN[23]= KNoteY-2050-4050;
    KN[24] = KNoteY-2150-4050;
    KN[25]= KNoteY-2350-4050;
    KN[26]= KNoteY-2700-4050;
    KN[27]= KNoteY-2900-4050;
    KN[28]= KNoteY-3020-4050;
    KN[29]=  KNoteY-3300-4050;
    KN[30]= KNoteY-3500-4050;
    KN[31]= KNoteY-3600-4050;

    LN = new float[18];
    LN[0]= LNoteY-44;
    LN[1]= LNoteY-230;
    LN[2]= LNoteY-600;
    LN[3]= LNoteY-786;
    LN[4]= LNoteY-1950;
    LN[5]= LNoteY-2250;
    LN[6]= LNoteY-2950;
    LN[7]= LNoteY-3100;
    LN[8]= LNoteY-3200;
    LN[9]= LNoteY-44-4050;
    LN[10]= LNoteY-230-4050;
    LN[11]= LNoteY-600-4050;
    LN[12]= LNoteY-786-4050;
    LN[13]= LNoteY-1950-4050;
    LN[14]= LNoteY-2250-4050;
    LN[15]= LNoteY-2950-4050;
    LN[16]= LNoteY-3100-4050;
    LN[17]= LNoteY-3200-4050;


    //J NOTES
    fill(255, 0, 0);
    circle(JNoteX, JNoteY, NoteSize);
    for (int i =0; i<JN.length; i++)
    {
      circle(JNoteX, JN[i], NoteSize);
    }
    JNoteY = JNoteY + 12.5;

    //K NOTES
    fill(0, 250, 0);
    for (int i = 0; i<KN.length; i++)
    {
      circle(KNoteX, KN[i], NoteSize);
    }
    KNoteY = KNoteY + 12.5;

    //L NOTES
    fill(0, 0, 255);
    for (int i = 0; i<LN.length; i++)
    {
      circle(LNoteX, LN[i], NoteSize);
    }
    LNoteY = LNoteY + 12.5;
    println(easy);
    println(hard);

    //start song
    if (JNoteY==630)
    {
      songfast.play();
    }
    //end song
    if (JNoteY==8525)
    {
      songfast.pause();
      hard = 0;
      myVideo.pause();
    }


    if (nice == true)
    {
      fill(0, 255, 0);
      text("NICE!", 300, 450);
    }
  } else if (easy==1&&hard==0) //EASY MODE
  {
    //MAIN GAME
    background(255, 255, 255);
    image(myVideo, 0, 0, 600, 900);
    textFont(scoreFont);
    fill(0, 0, 0);
    text("J", 135, 817);
    text("K", 278, 818);
    text("L", 433, 818);
    textSize(35);
    fill(255, 165, 0);
    text("Score:" + score, 400, 100);

    fill(255, 0, 0, 80);
    circle(JNote, 800, NoteSize);

    fill(0, 255, 0, 80);
    circle(KNote, 800, NoteSize);

    fill(0, 0, 255, 80);
    circle(LNote, 800, NoteSize);

    JN = new float[24];
    JN[0] = JNoteY-350;
    JN[1] = JNoteY - 465;
    JN[2] = JNoteY  -915;
    JN[3] = JNoteY - 1100;
    JN[4] = JNoteY-1200;
    JN[5] = JNoteY - 1400;
    JN[6] = JNoteY-2450;
    JN[7] = JNoteY - 2600;
    JN[8] = JNoteY-2800;
    JN[9] = JNoteY - 2950;
    JN[10] = JNoteY-3400;
    JN[11] = JNoteY - 3950;
    JN[12] = JNoteY-4050;
    JN[13] = JNoteY - 350 -4050;
    JN[14] = JNoteY - 465 - 4050;
    JN[15]= JNoteY - 915 - 4050;
    JN[16] = JNoteY - 1100 - 4050;
    JN[17] = JNoteY - 1200 -4050;
    JN[18] = JNoteY - 1400 -4050;
    JN[19] = JNoteY - 2450 -4050;
    JN[20]= JNoteY - 2600- 4050;
    JN[21]= JNoteY - 2800 - 4050;
    JN[22] = JNoteY - 2950 - 4050;
    JN[23] = JNoteY - 3400 - 4050;

    KN = new float[32];
    KN[0] =KNoteY-35;
    KN[1] =KNoteY - 295;
    KN[2] = KNoteY - 535;
    KN[3] = KNoteY-851;
    KN[4] = KNoteY-1300;
    KN[5] = KNoteY-1500;
    KN[6] = KNoteY-1650;
    KN[7] = KNoteY-2050;
    KN[8] = KNoteY-2150;
    KN[9] = KNoteY-2350;
    KN[10] = KNoteY-2700;
    KN[11] = KNoteY-2900;
    KN[12]= KNoteY-3020;
    KN[13]= KNoteY-3300;
    KN[14]= KNoteY-3500;
    KN[15]= KNoteY-3600;
    KN[16]= KNoteY-35-4050;
    KN[17]= KNoteY-295-4050;
    KN[18]= KNoteY-535-4050;
    KN[19]= KNoteY-851-4050;
    KN[20]= KNoteY-1300-4050;
    KN[21]= KNoteY-1500-4050;
    KN[22]= KNoteY-1650-4050;
    KN[23]= KNoteY-2050-4050;
    KN[24] = KNoteY-2150-4050;
    KN[25]= KNoteY-2350-4050;
    KN[26]= KNoteY-2700-4050;
    KN[27]= KNoteY-2900-4050;
    KN[28]= KNoteY-3020-4050;
    KN[29]=  KNoteY-3300-4050;
    KN[30]= KNoteY-3500-4050;
    KN[31]= KNoteY-3600-4050;

    LN = new float[18];
    LN[0]= LNoteY-44;
    LN[1]= LNoteY-230;
    LN[2]= LNoteY-600;
    LN[3]= LNoteY-786;
    LN[4]= LNoteY-1950;
    LN[5]= LNoteY-2250;
    LN[6]= LNoteY-2950;
    LN[7]= LNoteY-3100;
    LN[8]= LNoteY-3200;
    LN[9]= LNoteY-44-4050;
    LN[10]= LNoteY-230-4050;
    LN[11]= LNoteY-600-4050;
    LN[12]= LNoteY-786-4050;
    LN[13]= LNoteY-1950-4050;
    LN[14]= LNoteY-2250-4050;
    LN[15]= LNoteY-2950-4050;
    LN[16]= LNoteY-3100-4050;
    LN[17]= LNoteY-3200-4050;


    //J NOTES
    fill(255, 0, 0);
    circle(JNoteX, JNoteY, NoteSize);
    for (int i =0; i<JN.length; i++)
    {
      circle(JNoteX, JN[i], NoteSize);
    }
    JNoteY = JNoteY + 8;

    //K NOTES
    fill(0, 250, 0);
    for (int i = 0; i<KN.length; i++)
    {
      circle(KNoteX, KN[i], NoteSize);
    }
    KNoteY = KNoteY + 8;

    //L NOTES
    fill(0, 0, 255);
    for (int i = 0; i<LN.length; i++)
    {
      circle(LNoteX, LN[i], NoteSize);
    }
    LNoteY = LNoteY + 8;

    println(easy);
    println(hard);
    //start song
    if (JNoteY==630)
    {
      song.play();
    }
    //end song
    if (JNoteY==8526)
    {
      song.pause();
      easy = 0;
      myVideo.pause();
    }


    if (nice == true)
    {
      fill(0, 255, 0);
      text("NICE!", 300, 450);
    }
  } else {
    background(0, 0, 0);
    fill(255, 255, 255);

    text("Thanks for playing!", 200, 300);
    text("Your score is  " + score, 200, 500);
  }
}





void keyPressed()
{
  if (key == ' ')
  {
    title=0;
    select=1;
  }

  for (int i =0; i<24; i++)
  {
    if (key == 'j')
    {
      if (dist(JNote, 800, JNoteX, JN[i])<NoteSize)
      {
        score = score + 50;
        nice = true;
      }
    }
  }
  for (int i =0; i<32; i++)
  {
    if (key == 'k')
    {
      if (dist(KNote, 800, KNoteX, KN[i])<NoteSize)
      {
        score = score + 50;
        nice = true;
      }
    }
  }
  for (int i =0; i<18; i++)
  {
    if (key == 'l')
    {
      if (dist(LNote, 800, LNoteX, LN[i])<NoteSize)
      {
        score = score + 50;
        nice = true;
      }
    }
  }
}

//check
void mouseClicked() {
  if ((mouseButton == LEFT)&&(mouseX>200 && mouseX<500)&&(mouseY>170 && mouseY<320)&&(game==0)) {
    title = 0;
    select = 0;
    difficulty = 1;
    game = 1;
  }
  if ((mouseButton == LEFT)&&(mouseX>200 && mouseX<500)&&(mouseY>370 && mouseY<520)&&(game==1)) {
    difficulty = 0;
    easy = 1;
    hard = 0;
    intro.pause();
  }
  if ((mouseButton == LEFT)&&(mouseX>200 && mouseX<500)&&(mouseY>570 && mouseY<720)&&(game==1)) {
    difficulty = 0;
    easy = 0;
    hard = 1;
    intro.pause();
  }
}

void movieEvent(Movie videoBuffer)
{
  videoBuffer.read();
}

//not being used right now
void countdown() {
  int m = millis();
  background(0, 0, 0);
  fill(255, 255, 255);
  textSize(70);

  if (m<2500)
  {
    text("3", 300, 450);
  }
  if (m>2500 && m<5000)
  {
    text("2", 300, 450);
  }

  if (m>5000 && m<7500)
  {
    text("1", 300, 450);
  }
  println(m);
}
