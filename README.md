Aircraft Performance Tool (v2.0) 🛫

Author: Abu Sayed Mahin
Domain: Aerospace Engineering | Aircraft Performance Analysis
GitHub: github.com/AbuSayedMahin

Overview

This MATLAB project simulates and visualizes aircraft performance for multiple aircraft configurations under various altitudes and flight conditions.
It generates portfolio-ready figures for:

Thrust required vs velocity

Power required vs velocity

Drag polar comparison

Take-off and climb performance

This v2.0 release includes multi-aircraft comparison, high-altitude extension (up to 15,000 m), and improved figure presentation — perfect for UK aerospace internship or placement applications.


           Features                                         Feature	Status
Drag polar estimation (C_D vs C_L)	                ✅ Multi-aircraft included
Take-off distance & climb performance	             ✅ Figure generated (takeoff_climb.png)
Multi-aircraft configuration comparison           	✅ Included in all plots
High-altitude extension	                           ✅ Altitudes up to 15,000 m included
 
 Figures:
All figures are saved in the figures/ folder:
(aircraft_performance_multi_aircraft.png) – Thrust & Power curves for multiple aircraft and altitudes
(drag_polar_multi.png) – Drag polar comparison
(takeoff_climb_performance.png) – Take-off & climb performance


How to Run
Clone the repository:
git clone https://github.com/AbuSayedMahin/aircraft-performance-tool.git

Open MATLAB and navigate to src/.
Ensure these files exist:

main.m

lift_drag.m

thrust_required.m

isa_atmosphere.m

Run main.m → Figures will automatically generate in figures/.

Future Improvements

While this version covers multi-aircraft performance, drag polar, take-off/climb, and high-altitude extension, potential next steps include:

Take-off runway distance calculations
Full climb trajectory simulations
Multi-engine or hybrid propulsion models
Extending to even higher altitudes and complex atmosphere models

Tech Stack

MATLAB – Core calculations & plotting
Structured multi-aircraft workflow – Easily extendable
Portfolio-ready figures – Professional-quality visualizations

Contact

Abu Sayed Mahin
LinkedIn - https://www.linkedin.com/in/abu-sayed-mahin-9b6b972a3/ 
  GitHub - https://github.com/AbuSayedMahin
  Mail - sayedmahin37@gmail.com (Personal)
         abu2.mahin@live.uwe.ac.uk (UNI)
