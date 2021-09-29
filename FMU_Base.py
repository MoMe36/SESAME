from pyfmi import load_fmu
import matplotlib.pyplot as plt
import numpy as N

# Load the FMU
# model = load_fmu('RLC_FMU.fmu')

 # Generate input
t = N.linspace(0.,10.,10000) 
u = N.full_like(t,0.5)                  # Constante de la forme de t
u_traj = N.transpose(N.vstack((t,u)))
print(u_traj.shape)

# Create input object
input_object = ('u', u_traj)
    
# Set the first input value to the model
model.set('u',u[0])

#Simulate an FMU
res = model.simulate(start_time=1,final_time=10 , input=input_object)

# Retrieve the result for the variables
Vin  = res['constantVoltage.v']
Vcap = res['capacitor.v']
Vres = res['resistor.v']
Vind = res['inductor.v']
Vtot = Vcap + Vres + Vind
t    = res['time']

# Plot
fig, ax = plt.subplots()
ax.plot(t, Vin, t, Vres)

ax.set(xlabel='time (s)', ylabel='voltage (V)',
       title='Tension')
ax.grid()

fig.savefig("test.png")
plt.show()
