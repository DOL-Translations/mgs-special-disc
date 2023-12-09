// GameCube "Metal Gear Solid: Special Disc" Japanese To English Translation
// Credits to AfroJackX for the translation
// Inserts US Metal Gear (NES) into JP .tgc

endian msb // GameCube PPC requires Big-Endian Encoding (Most Significant Bit)
output "../src/fs/local/tgc/JPN_JPN_METALGEAR.tgc", create
origin $000000; insert "../src/fs/local/tgc/JPN_JPN_METALGEAR_no_rom.tgc" // Include English Metal Gear NES ROM

//Not a real assert, just prints the error message in console and doesn't compile further
macro Assert(MESSAGE) {
  "{MESSAGE}\n"
}

macro ReplaceAsset(ORIGIN, FILE, SIZE) {
  if !file.exists({FILE}) {
    print "{FILE} doesn't exist!"
  } else if file.exists({FILE}) {
    if (file.size({FILE}) > {SIZE} && {SIZE} != -1) {
      Assert("File {FILE} is bigger than Size {SIZE}")
    } else if (file.size({FILE}) <= {SIZE}) {
      origin {ORIGIN}
      insert {FILE}
      fill {SIZE} - file.size({FILE})
    }
  }
}

ReplaceAsset($833E0, "../input/Metal Gear [U].nes", 131088)
ReplaceAsset($163B20, "../input/Metal Gear [U].nes", 131088)
