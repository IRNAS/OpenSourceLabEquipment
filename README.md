OpenSourceLabEquipment
======================

Open Source Lab Equipment project integrates the solutions from our development projects into standalone solutions to increase the flexibility, hackability and versatility of new and existing equipment in development & research laboratories. A set of solutions is introduced for linear precision positioning, mimicking the high-grade translation stages at a fraction of cost using low-cost 3D printing. Designs vary from fully 3D printed low-performance to hybrid 3D printing using teflon sliding surfaces. The designs can easily be motorized for precision remote control or the approach implemented on existing high-grade translation equipment.

![MotorizedLinearStage](https://raw.github.com/IRNAS/OpenSourceLabEquipment/master/LinearTranslationStages.jpg)

## Linear translation design overview
Linear translation stages generally consist of three main stages, the base which can be firmly mounted, the slider for mounting the experiment object and the adjustment mechanism commonly consisting of a fine-pitch threaded screw and a counter-spring.

Published design are generally independent of the adjustment mechanism, either a fine-pitch threaded micrometer screw can be used, for smaller resolutions M3 or M4 screws work equally well.

### Linear Translation Plastic Slider
This linear translation stage features a plastic-plastic slider, making the design very 3D printable as well as low-profile. Precise tolerances are required to achieve good sliding action with great accuracy.

### Linear Translation Teflon Slider
The improved translation stage features teflon tubing as the sliding element, improving the sliding action while slightly reducing 3D printing tolerances. This approach can be easily sopted by non-uniform shapes of sliding elements for most versatile use.

#### Assembly
Print the parts individually, use 4mm reamer to cut the holes for tubing to precise dimension, use 4mm outer 2mm inner teflon tubing. Adjust the size of the slider if the sliding aciton is not smooth by scaling it.

### Motorization
The designed stages can be easily motorized by adding a stepper motor for driving the precision screw, however the same approach may apply to high-grade manual translation stages, for a various number of axis. The developed application demonstrates this approach.


