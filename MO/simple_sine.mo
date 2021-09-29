model simple_sine
  Modelica.Blocks.Math.Sin sin annotation(
    Placement(visible = true, transformation(origin = {4, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-84, 16}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, 18}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {57, 9}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {74, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, sin.u) annotation(
    Line(points = {{-84, 16}, {-45, 16}, {-45, 30}, {-8, 30}}, color = {0, 0, 127}));
  connect(sin.y, y) annotation(
    Line(points = {{16, 30}, {57, 30}, {57, 9}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end simple_sine;