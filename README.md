

# Aircraft Performance Analysis Tool ✈️

Author: Abu Sayed Mahin | Course: BEng Aerospace Engineering (Year 1) | University: UWE Bristol

[![MATLAB](https://img.shields.io/badge/MATLAB-R2025b%2B-orange)](https://uk.mathworks.com/)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/AbuSayedMahin/aircraft-performance-tool)


## 📌 Project Overview

This technical project demonstrates my aerospace engineering capabilities through computational aircraft performance analysis. The tool simulates and visualizes key performance characteristics across multiple aircraft configurations, showcasing my proficiency in:

- **Aerodynamic analysis** (drag polar estimation, lift-drag relationships)
- **Propulsion-performance integration** (thrust/power requirements)
- **Atmospheric modeling** (ISA standard atmosphere up to 15,000m)
- **Technical MATLAB programming** & data visualization

This MATLAB-based tool analyzes aircraft performance for multiple aircraft configurations under various altitudes and flight conditions. It generates:

- Thrust required & power required curves 
- Drag polar curves  
- Take-off distance and climb performance estimates  

This v2.0 release introduces multi-aircraft comparison and high-altitude extension.

## 🎯 Why This Project?

This work demonstrates competencies highly valued in aerospace internships and placements:

| **Competency** | **Demonstrated Through** |
|----------------|--------------------------|
| **Analytical Thinking** | Multi-aircraft performance comparison methodology |
| **Technical Coding** | Structured MATLAB workflow with modular functions |
| **Aerodynamics Knowledge** | Drag polar analysis, lift-drag relationships |
| **Propulsion Understanding** | Thrust/power required calculations |
| **Professional Communication** | Portfolio-ready technical figures & documentation |
| **Initiative** | Extended project beyond coursework to 15,000m altitude |

## 🛠️ Technical Features

### Current Capabilities (v2.0)

| Feature | Technical Implementation | Status |
|---------|--------------------------|--------|
| **Multi-Aircraft Comparison** | Simultaneous analysis of up to 4 aircraft configurations | ✅ |
| **Drag Polar Analysis** | `C_D = C_D0 + K·C_L²` with aircraft-specific parameters | ✅ |
| **Altitude Effects** | ISA atmosphere model (0-15,000m) | ✅ |
| **Performance Curves** | Thrust/Power required vs velocity | ✅ |
| **Take-off Analysis** | Distance estimation based on thrust-to-weight | ✅ |
| **Climb Performance** | Rate of climb calculations | ✅ |

### Technical Parameters Analyzed:
- **Thrust Required** - Overcoming drag at various speeds/altitudes
- **Power Required** - Energy requirements for sustained flight  
- **Drag Polar** - Aerodynamic efficiency across configurations
- **Take-off Distance** - Ground roll estimation
- **Climb Gradient** - Initial climb capability

## 📊 Sample Output

All figures are automatically generated in the `figures/` directory:

| Figure | Description |
|--------|-------------|
| `aircraft_performance_multi_aircraft.png` | Thrust/Power curves (4 aircraft, 3 altitudes each) |
| `drag_polar_multi.png` | Drag polar comparison showing aerodynamic efficiency |
| `takeoff_climb_performance.png` | Take-off distances & climb rates |

*Example figures demonstrate professional-standard technical communication - essential for placement applications.*

## 🚀 Quick Start

```bash
git clone https://github.com/AbuSayedMahin/aircraft-performance-tool.git
cd aircraft-performance-tool/src
```
Then in MATLAB:
```matlab
>> main  # Runs complete analysis suite
```

**Required files** (all in `/src`):
- `main.m` - Master script
- `lift_drag.m` - Aerodynamic calculations
- `thrust_required.m` - Performance computations  
- `isa_atmosphere.m` - Atmospheric modeling

## 📈 Future Development 

- [ ] **Full take-off field length** (including balanced field length)
- [ ] **Climb trajectory simulation** (time/ fuel to altitude)
- [ ] **Payload-range diagrams** for mission analysis
- [ ] **Constraint analysis** for initial aircraft sizing
- [ ] **Non-standard atmospheres** (hot day, cold day conditions)

## 💡 Skills Demonstrated

| **Technical Skills** | **Professional Skills** |
|----------------------|------------------------|
| MATLAB proficiency | Project management |
| Aerodynamic analysis | Technical documentation |
| Performance calculations | Independent learning |
| Data visualization | Problem-solving |
| Engineering mathematics | Attention to detail |

## 📬 Contact

I'm actively seeking 2026/2027 aerospace engineering placements and welcome discussions about potential opportunities.

Abu Sayed Mahin - BEng Aerospace Engineering (Year 1) - UWE Bristol

- 📧 **Academic:** abu2.mahin@live.uwe.ac.uk  
- 📧 **Personal:** sayedmahin37@gmail.com
- 🔗 **LinkedIn:** [Abu Sayed Mahin](https://www.linkedin.com/in/abu-sayed-mahin-9b6b972a3/)
- 💻 **GitHub:** [@AbuSayedMahin](https://github.com/AbuSayedMahin)

---

This project demonstrates my readiness for an industrial placement by combining technical aerospace knowledge with professional software development practices. All code and documentation are maintained to industry standards.
