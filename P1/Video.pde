import processing.video.*;
Movie movie;

void video() {

  movie = new Movie(this, "test.mp4");
  movie.play();
  
}
