# World-Worst-Video-Card
  # Archeticture
![image](https://github.com/YoussefGamal-007/World-Worst-Video-Card/assets/131666523/cea60611-8d98-45d0-88bb-55a0b72ce193)
🌟 *The Bright Idea*
The project started with a whimsical concept: creating the "World's Worst Video Card." Using VGA (Video Graphics Array) which is a stadard to connect between computer and monitor to dispaly graphics , We set out to build a VGA controller consisting of just two counters, mimicking the behavior of the cathode ray tube found in old monitors.

💡 *Basic Functionality*
 The VGA controller successfully displayed a single color from a palette of eight options, including Red ,Blue ,Green, and their combinations. The specifications choosen according to the standard was 640x480 resolution  at 60Hz, with a color depth of 1 bit for each color.

🌈 *Expanding Horizons*
as far as its cool to dispaly and see a colorful screen the mission was to display more complex & real images , requiring a series of additional steps.

🖼️ *The Path to Complexity*
To showcase intricate images, First, we needed the desired image and resized it while adjusting the color depth to be 3 bit color depth to fit our FPGA. Next, a Python script converted the image into raw binary data. To store this data efficiently, we designed a memory system, assigning each pixel a specific location and each location has the RGB of the pixel. The counters implemented allowed to access the image data using the corresponding x and y positions.

🧗 *Overcoming Challenges*
we encountered many difficulties along the way. One major challenge was our FPGA limitations it couldn't handle memory exceeding 270Kb. To overcome these obstacles, I resized the image to be 256x256 to fit into the FPGA memory while still keeping the same timing the VGA expects at the end we were able to display any image we want.
