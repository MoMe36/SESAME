block Buck
parameter Real L;
parameter Real Losses;
  Modelica.Electrical.Analog.Interfaces.PositivePin In_p annotation(
    Placement(visible = true, transformation(origin = {-124, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin Out_p annotation(
    Placement(visible = true, transformation(origin = {130, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin In_n annotation(
    Placement(visible = true, transformation(origin = {-124, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin Out_n annotation(
    Placement(visible = true, transformation(origin = {130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput alpha annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-30, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent Ie annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = Ve.v * alpha * (1 - Losses / 2)) annotation(
    Placement(visible = true, transformation(origin = {-26, 26}, extent = {{-32, -10}, {32, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = Is.i * alpha * (1 + Losses / 2)) annotation(
    Placement(visible = true, transformation(origin = {33, -71}, extent = {{33, -11}, {-33, 11}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor Ve annotation(
    Placement(visible = true, transformation(origin = {-60, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor Is annotation(
    Placement(visible = true, transformation(origin = {60, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage Vs annotation(
    Placement(visible = true, transformation(origin = {34, -20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = L) annotation(
    Placement(visible = true, transformation(origin = {88, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Loss annotation(
    Placement(visible = true, transformation(origin = {82, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {38, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = Vs.v * Is.i - Ve.v * Ie.i)  annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-22, -10}, {22, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs Pertes_joules annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Vs.p, Is.p) annotation(
    Line(points = {{34, -10}, {34, 14}, {50, 14}}, color = {0, 0, 255}));
  connect(realExpression1.y, Vs.v) annotation(
    Line(points = {{9, 26}, {14, 26}, {14, -20}, {22, -20}}, color = {0, 0, 127}));
  connect(Ve.p, In_p) annotation(
    Line(points = {{-60, -12}, {-60, 14}, {-124, 14}}, color = {0, 0, 255}));
  connect(Ve.n, In_n) annotation(
    Line(points = {{-60, -32}, {-60, -50}, {-124, -50}}, color = {0, 0, 255}));
  connect(Out_n, Vs.n) annotation(
    Line(points = {{130, -50}, {34, -50}, {34, -30}}, color = {0, 0, 255}));
  connect(inductor.p, Is.n) annotation(
    Line(points = {{78, 14}, {70, 14}}, color = {0, 0, 255}));
  connect(inductor.n, Out_p) annotation(
    Line(points = {{98, 14}, {130, 14}}, color = {0, 0, 255}));
  connect(Ie.n, In_p) annotation(
    Line(points = {{-30, -10}, {-30, 14}, {-124, 14}}, color = {0, 0, 255}));
  connect(Ie.p, In_n) annotation(
    Line(points = {{-30, -30}, {-30, -50}, {-124, -50}}, color = {0, 0, 255}));
  connect(realExpression2.y, Ie.i) annotation(
    Line(points = {{-3, -71}, {-12, -71}, {-12, -20}, {-18, -20}}, color = {0, 0, 127}));
  connect(Pertes_joules.u, realExpression.y) annotation(
    Line(points = {{38, 70}, {24, 70}}, color = {0, 0, 127}));
  connect(Pertes_joules.y, Loss) annotation(
    Line(points = {{61, 70}, {82, 70}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {-1, -1}, fillColor = {120, 120, 120}, fillPattern = FillPattern.Solid, extent = {{-79, 77}, {79, -77}}), Text(origin = {1, 26}, lineColor = {255, 255, 255}, extent = {{-57, 26}, {57, -26}}, textString = "DC/DC"), Text(origin = {2, -89}, extent = {{-56, 9}, {56, -9}}, textString = "%name"), Text(origin = {2, -14}, extent = {{-40, 16}, {40, -16}}, textString = "Buck"), Text(origin = {-29, 69}, extent = {{-17, 7}, {17, -7}}, textString = "Alpha"), Text(origin = {37, 69}, extent = {{-17, 9}, {17, -9}}, textString = "Losses"), Polygon(origin = {28, -62}, fillPattern = FillPattern.Solid, points = {{-8, 10}, {-8, -10}, {8, 0}, {8, 0}, {8, 0}, {-8, 10}}), Rectangle(origin = {-1, -62}, fillPattern = FillPattern.Solid, extent = {{-33, 2}, {33, -2}}), Text(origin = {-54, -59}, extent = {{-16, 13}, {16, -13}}, textString = "HV"), Text(origin = {52, -59}, extent = {{-16, 13}, {16, -13}}, textString = "LV")}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    version = "",
    uses(Modelica(version = "4.0.0")));
end Buck;
