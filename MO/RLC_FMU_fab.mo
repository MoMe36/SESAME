model RLC_FMU_fab
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10)  annotation(
    Placement(visible = true, transformation(origin = {84, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-32, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {84, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-198, 62}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {-104, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Buck buck annotation(
    Placement(visible = true, transformation(origin = {-134, -12}, extent = {{-56, -56}, {56, 56}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-222, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 10)  annotation(
    Placement(visible = true, transformation(origin = {-222, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 10e-3) annotation(
    Placement(visible = true, transformation(origin = {32, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(inductor.p, buck.Out_p) annotation(
    Line(points = {{-42, 16}, {-85, 16}}, color = {0, 0, 255}));
  connect(buck.Out_n, ground.p) annotation(
    Line(points = {{-84, -40}, {84, -40}, {84, -44}}, color = {0, 0, 255}));
  connect(u, buck.alpha) annotation(
    Line(points = {{-198, 62}, {-150, 62}, {-150, 36}}, color = {0, 0, 127}));
  connect(constantVoltage.n, ground1.p) annotation(
    Line(points = {{-222, -18}, {-222, -52}}, color = {0, 0, 255}));
  connect(constantVoltage.p, buck.In_p) annotation(
    Line(points = {{-222, 2}, {-222, 16}, {-184, 16}}, color = {0, 0, 255}));
  connect(buck.In_n, ground1.p) annotation(
    Line(points = {{-184, -40}, {-222, -40}, {-222, -52}}, color = {0, 0, 255}));
  connect(inductor.n, capacitor.p) annotation(
    Line(points = {{-22, 16}, {32, 16}, {32, 4}}, color = {0, 0, 255}));
  connect(capacitor.n, ground.p) annotation(
    Line(points = {{32, -16}, {32, -40}, {84, -40}, {84, -44}}, color = {0, 0, 255}));
  connect(resistor.n, ground.p) annotation(
    Line(points = {{84, -16}, {84, -44}}, color = {0, 0, 255}));
  connect(resistor.p, inductor.n) annotation(
    Line(points = {{84, 4}, {84, 16}, {-22, 16}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(extent = {{-500, -300}, {500, 300}})),
    Diagram(coordinateSystem(extent = {{-500, -300}, {500, 300}})),
    uses(Modelica(version = "4.0.0")));
end RLC_FMU_fab;
