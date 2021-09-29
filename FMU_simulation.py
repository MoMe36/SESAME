# -*- coding: utf-8 -*-
"""
Created on Mon Jun  7 16:40:08 2021

@author: fabien.medard
"""

from pyfmi import load_fmu
import matplotlib.pyplot as plt
import numpy as N

# Load the FMU
model = load_fmu('MO/RLC_FMU_fab/RLC_FMU_fab.fmu')
# model = load_fmu('MO/simple_sine/simple_sine.fmu')

 # Generate input
t = N.linspace(0.1,10.,100) 
u = N.full_like(t,0.5)                  # Constante de la forme de t
u_traj = N.transpose(N.vstack((t,u)))
 
# Create input object
input_object = ('u', u_traj)
    
# Set the first input value to the model
model.set('u',u[0])

#Simulate an FMU
opts = model.simulate_options()
opts["CVode_options"]["atol"] = 1e-6 #Change the absolute tolerance
opts["CVode_options"]["discr"] = "Adams" #Change the discretization from BDF to Adams
opts["ncp"] = 100 #One hundred output points
#opts["CVode_options"]["solver"] = "IDA"

res = model.simulate(final_time=1. , input=input_object, 
    options = opts)

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
