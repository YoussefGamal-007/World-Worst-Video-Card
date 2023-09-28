# World-Worst-Video-Card
  # Archeticture
![image](https://github.com/YoussefGamal-007/World-Worst-Video-Card/assets/131666523/cea60611-8d98-45d0-88bb-55a0b72ce193)


# VGA Controller Project - "World's Worst Video Card"

## The Bright Idea
The project embarked with the whimsical concept of creating the "World's Worst Video Card." Using VGA (Video Graphics Array) as the standard interface to connect between a computer and monitor for displaying graphics, we set out to build a VGA controller utilizing just two counters, emulating the behavior of cathode ray tubes found in old monitors.

## Basic Functionality
The VGA controller successfully displayed a single color from a palette of eight options, including Red, Blue, Green, and their combinations. The specifications were chosen according to the standard: 640x480 resolution at 60Hz, with a color depth of 1 bit for each color.

## Expanding Horizons
While displaying single colors was intriguing, our mission extended to showcasing more complex and realistic images, involving a series of additional steps.

## The Path to Complexity
To display intricate images, we first acquired the desired image, resizing it while adjusting the color depth to 3 bits to fit our FPGA. Subsequently, a Python script converted the image into raw binary data. For efficient data storage, we designed a memory system, allocating each pixel a specific location, with each location storing the RGB values of the pixel. The implemented counters facilitated access to the image data using the corresponding x and y positions.

## Overcoming Challenges
We encountered several difficulties along the way. A major challenge arose from our FPGA's limitations, as it couldn't handle memory exceeding 270KB. To surmount these obstacles, I resized the image to 256x256 to fit within the FPGA memory while maintaining the same timing expected by VGA. In the end, we successfully displayed any desired image.

## Acknowledgments
A special thanks to Mohammed Tarek for providing the FPGA and offering invaluable guidance throughout this incredible project.

