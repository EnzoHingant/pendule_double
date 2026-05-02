program penduledouble
   
     use, intrinsic  :: iso_fortran_env, only : wp =>real64
     implicit none
     
     character(len=30) :: nomFichier = 'penduledouble.dat'
     
     real(wp),parameter :: pi = 4.0_wp * atan (1.0_wp)
     real(wp), parameter :: theta1_0=pi/2.0_wp !condition initiale pour l'angle 1
     real(wp),parameter :: theta2_0 = pi/4.0_wp !condition intiale pour l'angle 2
     real(wp), parameter :: wi = 0.0_wp
     real(wp), parameter :: tmax = 50_wp
     real(wp), parameter :: dt = 10e-3 
     real(wp), parameter :: g = 9.81_wp
     real(wp), parameter :: L1 = 1.0_wp, L2 = 1.0_wp !deux longueurs pour pendule double 
     real(wp), parameter :: m1 = 1.0_wp, m2 = 1.0_wp !deux masses pour pendule double 
     real(wp) :: t
     integer, parameter :: N = 4 !pendule double 4 dimensions 
     integer, parameter :: Npas = 5000
     integer :: io , i  
     real(wp), parameter :: w0 = sqrt(g/L1)
     real(wp), dimension(N) :: etat = [theta1_0, 0.0_wp ,theta2_0 ,0.0_wp]
       
     open(newunit=io, file=trim(nomFichier))
      write(io, *) 0.0_wp, '   ',etat(1) , '   ', 0.0_wp, '    ', etat(3), '    ', 0.0_wp
     
      do i=1, Npas
         t = i*dt
         etat = RK4(etat, dt)
         write(io, *) t, '   ', etat(1), '   ', etat(2),'    ',etat(3), '    ', etat(4)
      end do
     
     close(io) 
    
   contains 
   
   function derivee(y) result(dydt)
      real(wp), dimension(N), intent(in) :: y
      real(wp), dimension(N) :: dydt
      real(wp) :: delta,den1, den2 
      
      !différence entre les deux angles 
      delta = y(3) - y(1)
      
      !termes des dénominateurs communs 
      den1 = (m1 + m2) * L1 - m2 * L1 * cos(delta)**2
      den2= (L2/L1) * den1
      
      !dérivée des angles 
      dydt(1) = y(2)
      dydt(3) = y(4)
      
      !accéleration angulaire 1 
      dydt(2) = (m2*L1*y(2)**2*sin(delta)*cos(delta) + &
               m2*g*sin(y(3))*cos(delta) + &
               m2*L2*y(4)**2*sin(delta) - &
               (m1+m2)*g*sin(y(1))) / den1
               
      ! Accélération angulaire 2 (d(omega2)/dt)
    dydt(4) = (-m2*L2*y(4)**2*sin(delta)*cos(delta) + &
               (m1+m2)*g*sin(y(1))*cos(delta) - &
               (m1+m2)*L1*y(2)**2*sin(delta) - &
               (m1+m2)*g*sin(y(3))) / den2
               
   end function derivee
   
   
   function RK4(y,h) result(yNewRK4)
      real(wp), dimension(N), intent(in) :: y
      real(wp), intent(in) :: h
      real(wp), dimension(N) :: yNewRK4, yt, k1, k2, k3, k4
      k1 = derivee(y)
      yt = y + 0.5_wp*k1*h
      k2 = derivee(yt)
      yt = y + 0.5_wp*k2*h
      k3 = derivee(yt)
      yt = y + k3*h
      k4 = derivee(yt)
      yNewRK4 = y + (k1+2.0_wp*k2+2.0_wp*k3+k4)*h/6.0_wp
   end function RK4
   
endprogram penduledouble
