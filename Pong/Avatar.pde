class Avatar {

  int avatarX;
  int avatarY;
  int avatarVX;
  int avatarVY;
  int avatarSpeed;
  int avatarSize;
  int avatarColor = color(250);

  Avatar (int _avatarX, int _avatarY, int _avatarSize) {
    avatarX = _avatarX;
    avatarY = _avatarY;
    avatarSize = _avatarSize;
  }

  void update() {
    // First update the location based on the velocity (so the avatar moves)
    avatarX += avatarVX;
    avatarY += avatarVY;

    avatarY = constrain(avatarY, 0 + avatarSize/2, height - avatarSize/2);
    avatarX = constrain(avatarX, 0 + avatarSize/2, width - avatarSize/2);
  }


void display() {
  // Set up the body of the avatar
  noStroke();
  fill(avatarColor);
  rectMode(CENTER);


  // Draw the avatar (as a rectangle because we will put an image)
  rect(avatarX, avatarY, avatarSize, avatarSize);
}
}