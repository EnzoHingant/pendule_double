import numpy as np
import matplotlib.pyplot as plt

# Declaration et initialisation des parametres de la simulation
nomFichier = "penduledouble.dat"
x0 = 1.0   # Position initiale du point materiel
v0 = 0.0   # Vitesse initiale du point materiel
w0 = 1.0   # pulsation de l'oscillateur harmonique
L1 = 1.0 # voir fortran 
L2 = 1.0 #voir fortran 

# Extraction des données à partir du fichier
data = np.genfromtxt(nomFichier)
t = data[:,0]
theta1 = data[:,1]
theta2 = data[:,3]

#coordonnées du premier pendule 
x1 = L1 * np.sin(theta1)
y1 = -L1 * np.cos(theta1)

#coordonnées du deuxieme pendule 
x2 = x1 + L2 * np.sin(theta2)
y2 = y1 - L2 * np.cos(theta2)



# Affichage 

plt.figure()
plt.plot(x2, y2, label='trajectoire CHAOTIQUE pendule 2 ') 
plt.plot(0,0,'ro', label ='point d attache') 
plt.xlabel('x en m ')                            # Legende de l'axe des x
plt.ylabel('y en m  ')                         # Legende de l'axe des y                          
plt.title('pendule double au mouvement chaotique ')
plt.axis('equal') 
plt.grid() 
plt.legend()
plt.show()

