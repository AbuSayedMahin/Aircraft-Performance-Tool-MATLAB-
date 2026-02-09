 Aircraft Performance Analysis Tool (MATLAB)

 ✈️ Overview
This project presents a MATLAB-based aircraft performance analysis tool
developed as part of my personal engineering portfolio alongside my
BEng Aerospace Engineering studies.

The tool models thrust and power required across a range of flight
velocities and altitudes using fundamental aerodynamic theory and the
International Standard Atmosphere (ISA). The results provide insight
into aircraft performance trends and endurance conditions.

🛠 Tools & Skills
- MATLAB
- Aircraft performance fundamentals
- ISA atmospheric modelling
- Data visualisation & engineering interpretation

 📐 Engineering Theory
Aerodynamic forces are computed using classical relations:

Lift:
L = 0.5 · ρ · V² · S · C_L

Drag:
D = 0.5 · ρ · V² · S · C_D

For steady, level flight:
Thrust Required = Drag  
Power Required = Thrust × Velocity  

Atmospheric properties are calculated using the ISA tropospheric model
(up to 11 km altitude).

 ▶️ How to Run
1. Open MATLAB
2. Navigate to the `src` directory
3. Run `main.m`
4. Generated figures are saved automatically in the `figures` folder

 📈 Results & Insights
The final analysis includes:
- Thrust required vs velocity at multiple altitudes
- Power required vs velocity at sea level
- Identification of the best endurance flight condition
- Visual comparison of altitude effects due to air density variation

These results demonstrate how fundamental aerodynamic theory translates
into practical aircraft performance analysis.

🔮 Future Improvements
- Drag polar estimation (C_D vs C_L)
- Take-off distance and climb performance
- Multi-aircraft configuration comparison
- Extension to higher-altitude atmosphere models

⚠️ Academic Integrity Notice
This project is a personal portfolio work inspired by university-level
learning. All problem statements have been generalised and no official
coursework questions or assessment solutions are included.
