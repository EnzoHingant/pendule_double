# 🌀 Double Pendule : Simulation de Systèmes Chaotiques

Ce projet vise à modéliser et simuler le comportement complexe et chaotique d'un double pendule en utilisant une approche hybride **Fortran/Python**.

## 🚀 Présentation du projet
L'objectif est de répondre à la problématique de la sensibilité aux conditions initiales dans les systèmes non-linéaires. Ce projet a été réalisé suite aux conseils de mon professeur **P.E. Durand** pour explorer les limites de l'approximation des petites angles et la transition vers le chaos.

### Points clés :
*   **Moteur physique :** Implémenté en **Fortran** pour une performance de calcul optimale.
*   **Algorithme :** Résolution des équations de Lagrange par la méthode de **Runge-Kutta d'ordre 4 (RK4)**.
*   **Visualisation :** Traitement des données et rendu graphique avec **Python (Matplotlib/NumPy)**.

## 🛠️ Structure du Code

1. **`simulation.f90`** : 
   - Définition du vecteur d'état à 4 dimensions ($\theta_1, \omega_1, \theta_2, \omega_2$).
   - Implémentation du système d'équations différentielles couplées.
   - Exportation des résultats dans un fichier `.dat`.
2. **`visualisation.py`** :
   - Lecture des données calculées.
   - Conversion des angles en coordonnées cartésiennes $(x, y)$.
   - Génération de la trajectoire chaotique.

## 📊 Résultats
La simulation permet d'observer la trajectoire imprévisible de la seconde masse.

![Trajectoire du double pendule](Capture%20d’écran%202026-05-02%20à%2021.25.09.jpg)

*Exemple de trajectoire obtenue avec $L_1=1.0, L_2=2.0$ et des angles initiaux de $90^\circ$ et $45^\circ$.*

## 🏁 Comment lancer la simulation ?

### Prérequis
- Un compilateur Fortran (`gfortran`)
- Python 3 avec `numpy` et `matplotlib`

### Exécution
1. **Compiler le moteur Fortran :**
   ```bash
   gfortran simulation.f90 -o double_pendule
