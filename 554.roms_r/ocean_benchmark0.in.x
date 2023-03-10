!
!  ROMS/TOMS Standard Input parameters.
!
!svn $Id: ocean_benchmark1.in 404 2009-10-06 20:18:53Z arango $
!========================================================= Hernan G. Arango ===
!  Copyright (c) 2002-2009 The ROMS/TOMS Group                                !
!    Licensed under a MIT/X style license                                     !
!    See License_ROMS.txt                                                     !
!==============================================================================
!                                                                             !
! Input parameters can be entered in ANY order, provided that the parameter   !
! KEYWORD (usually, upper case) is typed correctly followed by "="  or "=="   !
! symbols. Any comment lines are allowed and must begin with an exclamation   !
! mark (!) in column one.  Comments may  appear to the right of a parameter   !
! specification to improve documentation.  Comments will be ignored  during   !
! reading.  Blank lines are also allowed and ignored. Continuation lines in   !
! a parameter specification are allowed and must be preceded by a backslash   !
! (\).  In some instances, more than one value is required for a parameter.   !
! If fewer values are provided, the  last value  is assigned for the entire   !
! parameter array.  The multiplication symbol (*),  without blank spaces in   !
! between, is allowed for a parameter specification.  For example, in a two   !
! grids nested application:                                                   !
!                                                                             !
!    AKT_BAK == 2*1.0d-6  2*5.0d-6              ! m2/s                        !
!                                                                             !
! indicates that the first two entries of array AKT_BAK,  in fortran column-  !
! major order, will have the same value of "1.0d-6" for grid 1,  whereas the  !
! next two entries will have the same value of "5.0d-6" for grid 2.           !
!                                                                             !
! In multiple levels of nesting and/or multiple connected domains  step-ups,  !
! "Ngrids" entries are expected for some of these parameters.  In such case,  !
! the order of the entries for a parameter is extremely important.  It  must  !
! follow the same order (1:Ngrids) as in the state variable declaration. The  !
! USER may follow the above guidelines for specifying his/her values.  These  !
! parameters are marked by "==" plural symbol after the KEYWORD.              !
!                                                                             !
!==============================================================================
!
! Application title.

       TITLE = Benchmark Test, Idealized Southern Ocean, Small Grid

! C-preprocessing Flag.

    MyAppCPP = BENCHMARK

! Input variable information file name.  This file needs to be processed
! first so all information arrays can be initialized properly.

     VARNAME = varinfo.dat

! Grid dimension parameters. See notes below in the Glossary for how to set
! these parameters correctly.

          Lm == 512           ! Number of I-direction INTERIOR RHO-points
          Mm == 64            ! Number of J-direction INTERIOR RHO-points
           N == 30            ! Number of vertical levels

        Nbed =  0             ! Number of sediment bed layers

         NAT =  2             ! Number of active tracers (usually, 2)
         NPT =  0             ! Number of inactive passive tracers
         NCS =  0             ! Number of cohesive (mud) sediment tracers
         NNS =  0             ! Number of non-cohesive (sand) sediment tracers

! Domain decomposition parameters for serial, distributed-memory or
! shared-memory configurations used to determine tile horizontal range
! indices (Istr,Iend) and (Jstr,Jend), [1:Ngrids].

      NtileI == 4                               ! I-direction partition
      NtileJ == 2                               ! J-direction partition

! Time-Stepping parameters.

      NTIMES == 5
          DT == 500.0d0
     NDTFAST == 20

! Model iteration loops parameters.

       ERstr =  1
       ERend =  1
      Nouter =  1
      Ninner =  1
  Nintervals =  1

! Number of eigenvalues (NEV) and eigenvectors (NCV) to compute for the
! Lanczos/Arnoldi problem in the Generalized Stability Theory (GST)
! analysis. NCV must be greater than NEV (see documentation below).

         NEV =  2                               ! Number of eigenvalues
         NCV =  10                              ! Number of eigenvectors

! Input/Output parameters.

       NRREC == 0
   LcycleRST == T
        NRST == 1000
        NSTA == 1
        NFLT == 1
       NINFO == 1

! Output history, average, diagnostic files parameters.

     LDEFOUT == T
        NHIS == 1000
     NDEFHIS == 0
      NTSAVG == 1
        NAVG == 1000
     NDEFAVG == 0
      NTSDIA == 1
        NDIA == 1000
     NDEFDIA == 0

! Output tangent linear and adjoint models parameters.

   LcycleTLM == F
        NTLM == 1000
     NDEFTLM == 0
   LcycleADJ == F
        NADJ == 1000
     NDEFADJ == 0
        NSFF == 1000
        NOBC == 1000

! Output check pointing GST restart parameters.

     LrstGST =  F                               ! GST restart switch
  MaxIterGST =  500                             ! maximun number of iterations
        NGST =  10                              ! check pointing interval

! Relative accuracy of the Ritz values computed in the GST analysis.

    Ritz_tol =  1.0d-15

! Harmonic/biharmonic horizontal diffusion of tracer: [1:NAT+NPT,Ngrids].

        TNU2 == 500.0d0  500.0d0                ! m2/s
        TNU4 == 2*0.0d0                         ! m4/s

! Harmononic/biharmonic, horizontal viscosity coefficient: [Ngrids].

       VISC2 == 5000.0d0                        ! m2/s
       VISC4 == 0.0d0                           ! m4/s

! Vertical mixing coefficients for active tracers: [1:NAT+NPT,Ngrids]

     AKT_BAK == 1.0d-5 1.0d-5                   ! m2/s

! Vertical mixing coefficient for momentum: [Ngrids].

     AKV_BAK == 1.0d-4                          ! m2/s

! Turbulent closure parameters.

     AKK_BAK == 5.0d-6                          ! m2/s
     AKP_BAK == 5.0d-6                          ! m2/s
      TKENU2 == 0.0d0                           ! m2/s
      TKENU4 == 0.0d0                           ! m4/s

! Generic length-scale turbulence closure parameters.

       GLS_P == 3.0d0                           ! K-epsilon
       GLS_M == 1.5d0
       GLS_N == -1.0d0
    GLS_Kmin == 7.6d-6
    GLS_Pmin == 1.0d-12

    GLS_CMU0 == 0.5477d0
      GLS_C1 == 1.44d0
      GLS_C2 == 1.92d0
     GLS_C3M == -0.4d0
     GLS_C3P == 1.0d0
    GLS_SIGK == 1.0d0
    GLS_SIGP == 1.30d0

! Constants used in surface turbulent kinetic energy flux computation.

  CHARNOK_ALPHA == 1400.0d0         ! Charnok surface roughness
 ZOS_HSIG_ALPHA == 0.5d0            ! roughness from wave amplitude
       SZ_ALPHA == 0.25d0           ! roughness from wave dissipation
      CRGBAN_CW == 100.0d0          ! Craig and Banner wave breaking

! Constants used in momentum stress computation.

        RDRG == 3.0d-04                    ! m/s
       RDRG2 == 3.0d-03                    ! nondimensional
         Zob == 0.02d0                     ! m
         Zos == 0.02d0                     ! m

! Height (m) of atmospheric measurements for Bulk fluxes parameterization.

      BLK_ZQ == 10.0d0                     ! air humidity
      BLK_ZT == 10.0d0                     ! air temperature
      BLK_ZW == 10.0d0                     ! winds

! Minimum depth for wetting and drying.

       DCRIT == 0.10d0                     ! m

! Various parameters.

       WTYPE == 1
     LEVSFRC == 15
     LEVBFRC == 1

! Set vertical, terrain-following coordinates transformation equation and
! stretching function (see below for details), [1:Ngrids].

  Vtransform == 1                          ! transformation equation
 Vstretching == 1                          ! stretching function

! Vertical S-coordinates parameters, [1:Ngrids].

     THETA_S == 5.0d0                      ! surface stretching parameter
     THETA_B == 0.4d0                      ! bottom  stretching parameter
      TCLINE == 200.0d0                    ! critical depth (m)

! Mean Density and Brunt-Vaisala frequency.

        RHO0 =  1025.0d0                   ! kg/m3
     BVF_BAK =  1.0d-5                     ! 1/s2

! Time-stamp assigned for model initialization, reference time
! origin for tidal forcing, and model reference time for output
! NetCDF units attribute.

      DSTART =  0.0d0                      ! days
  TIDE_START =  0.0d0                      ! days
    TIME_REF =  0.0d0                      ! yyyymmdd.dd

! Nudging/relaxation time scales, inverse scales will be computed
! internally, [1:Ngrids].

       TNUDG == 2*0.0d0                    ! days
       ZNUDG == 0.0d0                      ! days
      M2NUDG == 0.0d0                      ! days
      M3NUDG == 0.0d0                      ! days

! Factor between passive (outflow) and active (inflow) open boundary
! conditions, [1:Ngrids]. If OBCFAC > 1, nudging on inflow is stronger
! than on outflow (recommended).

      OBCFAC == 0.0d0                      ! nondimensional

! Linear equation of State parameters:

          R0 == 1027.0d0                   ! kg/m3
          T0 == 10.0d0                     ! Celsius
          S0 == 35.0d0                     ! PSU
       TCOEF == 1.7d-4                     ! 1/Celsius
       SCOEF == 7.6d-4                     ! 1/PSU

! Slipperiness parameter: 1.0 (free slip) or -1.0 (no slip)

      GAMMA2 == 1.0d0

! Starting (DstrS) and ending (DendS) day for adjoint sensitivity forcing.
! DstrS must be less or equal to DendS. If both values are zero, their
! values are reset internally to the full range of the adjoint integration.

       DstrS == 0.0d0                      ! starting day
       DendS == 0.0d0                      ! ending day

! Starting and ending vertical levels of the 3D adjoint state variables
! whose sensitivity is required.

       KstrS == 1                          ! starting level
       KendS == 1                          ! ending level

! Logical switches (TRUE/FALSE) to specify the adjoint state variables
! whose sensitivity is required.

Lstate(isFsur) == F                        ! free-surface
Lstate(isUbar) == F                        ! 2D U-momentum
Lstate(isVbar) == F                        ! 2D V-momentum
Lstate(isUvel) == F                        ! 3D U-momentum
Lstate(isVvel) == F                        ! 3D V-momentum

! Logical switches (TRUE/FALSE) to specify the adjoint state tracer
! variables whose sensitivity is required (NT values are expected).

Lstate(isTvar) == F F                      ! tracers

! Stochastic optimals time decorrelation scale (days) assumed for
! red noise processes.

    SO_decay == 2.0d0                      ! days

! Logical switches (TRUE/FALSE) to specify the state surface forcing
! variable whose stochastic optimals is required.

SOstate(isUstr) == T                       ! surface u-stress
SOstate(isVstr) == T                       ! surface v-stress

! Logical switches (TRUE/FALSE) to specify the surface tracer forcing
! variable whose stochastic optimals is required (NT values are expected).

SOstate(isTsur) == F F                     ! surface tracer flux

! Stochastic optimals surface forcing standard deviation for
! dimensionalization.

SO_sdev(isUstr) == 1.0d0                   ! surface u-stress
SO_sdev(isVstr) == 1.0d0                   ! surface v-stress
SO_sdev(isTsur) == 1.0d0 1.0d0             ! NT surface tracer flux

! Logical switches (TRUE/FALSE) to activate writing of fields into
! HISTORY output file.

Hout(idUvel) == F                          ! 3D U-velocity
Hout(idVvel) == F                          ! 3D V-velocity
Hout(idWvel) == F                          ! 3D W-velocity
Hout(idOvel) == F                          ! omega vertical velocity
Hout(idUbar) == F                          ! 2D U-velocity
Hout(idVbar) == F                          ! 2D V-velocity
Hout(idFsur) == F                          ! free-surface
Hout(idBath) == F                          ! time-dependent bathymetry

Hout(idTvar) == F F                        ! temperature and salinity

Hout(idUsms) == F                          ! surface U-stress
Hout(idVsms) == F                          ! surface V-stress
Hout(idUbms) == F                          ! bottom U-stress
Hout(idVbms) == F                          ! bottom V-stress

Hout(idUbrs) == F                          ! bottom U-current stress
Hout(idVbrs) == F                          ! bottom V-current stress
Hout(idUbws) == F                          ! bottom U-wave stress
Hout(idVbws) == F                          ! bottom V-wave stress
Hout(idUbcs) == F                          ! bottom max wave-current U-stress
Hout(idVbcs) == F                          ! bottom max wave-current V-stress

Hout(idUbot) == F                          ! bed wave orbital U-velocity
Hout(idVbot) == F                          ! bed wave orbital V-velocity
Hout(idUbur) == F                          ! bottom U-velocity above bed
Hout(idVbvr) == F                          ! bottom V-velocity above bed

Hout(idW2xx) == F                          ! 2D radiation stress, Sxx component
Hout(idW2xy) == F                          ! 2D radiation stress, Sxy component
Hout(idW2yy) == F                          ! 2D radiation stress, Syy component
Hout(idU2rs) == F                          ! 2D radiation U-stress
Hout(idV2rs) == F                          ! 2D radiation V-stress
Hout(idU2Sd) == F                          ! 2D U-Stokes velocity
Hout(idV2Sd) == F                          ! 2D V-Stokes velocity

Hout(idW3xx) == F                          ! 3D radiation stress, Sxx component
Hout(idW3xy) == F                          ! 3D radiation stress, Sxy component
Hout(idW3yy) == F                          ! 3D radiation stress, Syy component
Hout(idW3zx) == F                          ! 3D radiation stress, Szx component
Hout(idW3zy) == F                          ! 3D radiation stress, Szy component
Hout(idU3rs) == F                          ! 3D U-radiation stress
Hout(idV3rs) == F                          ! 3D V-radiation stress
Hout(idU3Sd) == F                          ! 3D U-Stokes velocity
Hout(idV3Sd) == F                          ! 3D V-Stokes velocity

Hout(idWamp) == F                          ! wave height
Hout(idWlen) == F                          ! wave length
Hout(idWdir) == F                          ! wave direction

Hout(idTsur) == F F                        ! surface net heat and salt flux
Hout(idLhea) == F                          ! latent heat flux
Hout(idShea) == F                          ! sensible heat flux
Hout(idLrad) == F                          ! longwave radiation flux
Hout(idSrad) == F                          ! shortwave radiation flux
Hout(idEmPf) == F                          ! E-P flux
Hout(idevap) == F                          ! evaporation rate
Hout(idrain) == F                          ! precipitation rate

Hout(idDano) == F                          ! density anomaly
Hout(idVvis) == F                          ! vertical viscosity
Hout(idTdif) == F                          ! vertical T-diffusion
Hout(idSdif) == F                          ! vertical Salinity diffusion
Hout(idHsbl) == F                          ! depth of surface boundary layer
Hout(idHbbl) == F                          ! depth of bottom boundary layer
Hout(idMtke) == F                          ! turbulent kinetic energy
Hout(idMtls) == F                          ! turbulent length scale

! Logical switches (TRUE/FALSE) to activate writing of extra inert passive
! tracers other than biological and sediment tracers. An inert passive tracer
! is one that it is only advected and diffused. Other processes are ignored.
! These tracers include, for example, dyes, pollutants, oil spills, etc.
! NPT values are expected. However, these switches can be activated using
! compact parameter specification.

 Hout(inert) == T                          ! inert passive tracers

! Logical switches (TRUE/FALSE) to activate writing of exposed sediment
! layer properties into HISTORY output file.  Currently, MBOTP properties
! are expected for the bottom boundary layer and/or sediment models:
!
!   Hout(idBott(isd50)),  isd50 = 1        ! mean grain diameter
!   Hout(idBott(idens)),  idens = 2        ! mean grain density
!   Hout(idBott(iwsed)),  iwsed = 3        ! mean settling velocity
!   Hout(idBott(itauc)),  itauc = 4        ! critical erosion stress
!   Hout(idBott(irlen)),  irlen = 5        ! ripple length
!   Hout(idBott(irhgt)),  irhgt = 6        ! ripple height
!   Hout(idBott(ibwav)),  ibwav = 7        ! wave excursion amplitude
!   Hout(idBott(izdef)),  izdef = 8        ! default bottom roughness
!   Hout(idBott(izapp)),  izapp = 9        ! apparent bottom roughness
!   Hout(idBott(izNik)),  izNik = 10       ! Nikuradse bottom roughness
!   Hout(idBott(izbio)),  izbio = 11       ! biological bottom roughness
!   Hout(idBott(izbfm)),  izbfm = 12       ! bed form bottom roughness
!   Hout(idBott(izbld)),  izbld = 13       ! bed load bottom roughness
!   Hout(idBott(izwbl)),  izwbl = 14       ! wave bottom roughness
!   Hout(idBott(iactv)),  iactv = 15       ! active layer thickness
!   Hout(idBott(ishgt)),  ishgt = 16       ! saltation height
!
!                                 1 1 1 1 1 1 1
!               1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6

Hout(idBott) == T T T T T T T T T F F F F F F F

! Generic User parameters, [1:NUSER].

       NUSER =  0
        USER =  0.d0

! Input NetCDF file names, [1:Ngrids].

     GRDNAME == ocean_grd.nc
     ININAME == ocean_ini.nc
     ITLNAME == ocean_itl.nc
     IRPNAME == ocean_irp.nc
     IADNAME == ocean_iad.nc
     CLMNAME == ocean_clm.nc
     BRYNAME == ocean_bry.nc
     FWDNAME == ocean_fwd.nc
     ADSNAME == ocean_ads.nc

! Input forcing NetCDF file name(s).  The USER has the option to enter
! several file names for each nested grid.  For example, the USER may
! have different files for wind products, heat fluxes, rivers, tides,
! etc.  The model will scan the file list and will read the needed data
! from the first file in the list containing the forcing field. Therefore,
! the order of the file names is very important. If using multiple forcing
! files per grid, first enter all the file names for grid 1, then grid 2,
! and so on.  Use a single line per entry with a continuation (\) symbol
! at the each entry, except the last one.

     NFFILES == 1                          ! number of forcing files

     FRCNAME == ocean_frc.nc               ! forcing file 1, grid 1

! Output NetCDF file names, [1:Ngrids].

     GSTNAME == ocean_gst.nc
     RSTNAME == ocean_rst.nc
     HISNAME == ocean_his.nc
     TLMNAME == ocean_tlm.nc
     TLFNAME == ocean_tlf.nc
     ADJNAME == ocean_adj.nc
     AVGNAME == ocean_avg.nc
     DIANAME == ocean_dia.nc
     STANAME == ocean_sta.nc
     FLTNAME == ocean_flt.nc

! Input ASCII parameter filenames.

     APARNAM =  ROMS/External/s4dvar.in
     SPOSNAM =  ROMS/External/stations.in
     FPOSNAM =  ROMS/External/floats.in
     BPARNAM =  ROMS/External/bio_Fennel.in
     SPARNAM =  ROMS/External/sediment.in
     USRNAME =  ROMS/External/MyFile.dat

!
!  GLOSSARY:
!  =========
!
!------------------------------------------------------------------------------
! Application tile (string with a maximum of eighty characters) and
! C-preprocessing flag.
!------------------------------------------------------------------------------
!
!  TITLE       Application title.
!
!  MyAppCPP    Application C-preprocessing option.
!
!------------------------------------------------------------------------------
! Variable information file name (string with a maximum of eighty characters).
!------------------------------------------------------------------------------
!
!  VARNAME     Input/Output variable information file name.  This file needs to
!              be processed first so all information arrays and indices can be
!              initialized properly in "mod_ncparam.F".
!
!------------------------------------------------------------------------------
! Grid dimension parameters.
!------------------------------------------------------------------------------
!
! These parameters are very important since they determine the grid of the
! application to solve. They need to be read first in order to dynamically
! allocate all model variables.
!
! WARNING: It is trivial and possible to change these dimension parameters in
! -------  idealized applications via analytical expressions.  However, in
! realistic applications any change to these parameters requires redoing all
! input NetCDF files.
!
!  Lm          Number of INTERIOR grid RHO-points in the XI-direction for
!                each nested grid, [1:Ngrids]. If using NetCDF files as
!                input, Lm=xi_rho-2 where "xi_rho" is the NetCDF file
!                dimension of RHO-points. Recall that all RHO-point
!                variables have a computational I-range of [0:Lm+1].
!
!  Mm          Number of INTERIOR grid RHO-points in the ETA-direction for
!                each nested grid, [1:Ngrids]. If using NetCDF files as
!                input, Mm=eta_rho-2 where "eta_rho" is the NetCDF file
!                dimension of RHO-points. Recall that all RHO-point
!                variables have a computational J-range of [0:Mm+1].
!
!  N           Number of vertical terrain-following levels at RHO-points,
!                [1:Ngrids].
!
!  Nbed        Number of sediment bed layers, [1:Ngrids]. This parameter
!                is only relevant if CPP option SEDIMENT is activated.
!
!                Mm+1  ___________________                _______  Kw = N
!                     |                   |              |       |
!                  Mm |   _____________   |              |       | Kr = N
!                     |  |             |  |              |_______|
!                     |  |             |  |              |       |
!                  Jr |  |             |  |              |       |
!                     |  |             |  |              |_______|
!                     |  |             |  |              |       |
!                   1 |  |_____________|  |              |       |
!                     |                   |              |_______|
!                   0 |___________________|              |       |
!                              Ir                        |       | 1
!                     0  1            Lm  Lm+1    h(i,j) |_______|
!                                                        ::::::::: 0
!                                                        :::::::::
!                                                        ::::::::: Nbed-1
!                                                        ::::::::: Nbed
!
!  NAT         Number of active tracer type variables. Usually, NAT=2 for
!                potential temperature and salinity.
!
!  NPT         Number of inert (dyes, age, etc) passive tracer type variables
!                to advect and diffuse only. This parameter is only relevant
!                if CPP option T_PASSIVE is activated.
!
!  NCS         Number of cohesive (mud) sediment tracer type variables. This
!                parameter is only relevant if CPP option SEDIMENT is
!                activated.
!
!  NNS         Number of non-cohesive (sand) sediment tracer type variables.
!                This parameter is only relevant if CPP option SEDIMENT is
!                activated.
!
!              The total number of sediment tracers is NST=NCS+NNS.  Notice
!              that NST must be greater than zero (NST>0).
!
!------------------------------------------------------------------------------
! Domain tile partition parameters.
!------------------------------------------------------------------------------
!
! Model tile decomposition parameters for serial and parallel configurations
! which are used to determine tile horizontal range indices (Istr,Iend) and
! (Jstr,Jend). In some computers, it is advantageous to have tile partitions
! in serial applications.
!
!  NtileI      Number of domain partitions in the I-direction (XI-coordinate).
!              It must be equal to or greater than one.
!
!  NtileJ      Number of domain partitions in the J-direction (ETA-coordinate).
!              It must be equal to or greater than one.
!
!  WARNING:    In shared-memory (OpenMP), the product of NtileI and NtileJ must
!              be a MULTIPLE of the number of parallel threads specified with
!              the OpenMP environmental variable OMP_NUM_THREADS.
!
!              In distributed-memory (MPI), the product of NtileI and NtileJ
!              must be EQUAL to the number of parallel nodes specified during
!              execution with the "mprun" or "mpirun" command.
!
!------------------------------------------------------------------------------
! Time-Stepping parameters.
!------------------------------------------------------------------------------
!
!  NTIMES      Total number time-steps in current run.  If 3D configuration,
!              NTIMES is the total of baroclinic time-steps.  If only 2D
!              configuration, NTIMES is the total of barotropic time-steps.
!
!  DT          Time-Step size in seconds.  If 3D configuration, DT is the
!              size of the baroclinic time-step.  If only 2D configuration,
!              DT is the size of the barotropic time-step.
!
!  NDTFAST     Number of barotropic time-steps between each baroclinic time
!              step. If only 2D configuration, NDTFAST should be unity since
!              there is no need to split time-stepping.
!
!------------------------------------------------------------------------------
! Model iteration loops parameters.
!------------------------------------------------------------------------------
!
!  ERstr       Starting ensemble run (perturbation or iteration) number.
!
!  ERend       Ending   ensemble run (perturbation or iteration) number.
!
!  Nouter      Maximum number of 4DVAR outer loop iterations.
!
!  Ninner      Maximum number of 4DVAR inner loop iterations.
!
!  Nintervals  Number of time interval divisions for stochastic optimals
!              computations. It must be a multiple of NTIMES. The tangent
!              linear model (TLM) and the adjoint model (ADM) are integrated
!              forward and backward at different intervals.  For example,
!              if Nintervals=3,
!
!              1               NTIMES/3         2*NTIMES/3           NTIMES
!              +..................+..................+..................+
!              <========================================================> (1)
!                                 <=====================================> (2)
!                                                    <==================> (3)
!
!              In the first iteration (1), the TLM is integrated forward from
!              1 to NTIMES and the ADM is integrated backward from NTIMES to 1.
!              In the second iteration (2), the TLM is integrated forward from
!              NTIMES/3 to NTIMES and the ADM is integrated backward from
!              NTIMES to NTIMES/3. And so on.
!
!------------------------------------------------------------------------------
!  Eigenproblem parameters.
!------------------------------------------------------------------------------
!
!  NEV         Number of eigenvalues to compute for the Lanczos/Arnoldi
!              problem.  Notice that the model memory requirement increases
!              substantially as NEV increases.  The GST requires NEV+1
!              copies of the model state vector.  The memory requirements
!              are decreased in distributed-memory applications.
!
!  NCV         Number of eigenvectors to compute for the Lanczos/Arnoldi
!              problem. NCV must be greater than NEV.
!
!  At present, there is no a-priori analysis to guide the selection of NCV
!  relative to NEV.  The only formal requirement is that NCV > NEV. However
!  in optimal perturbations, it is recommended to have NCV greater than or
!  equal to 2*NEV. In Finite Time Eigenmodes (FTE) and Adjoint Finite Time
!  Eigenmodes (AFTE) the requirement is to have NCV greater than or equal to
!  2*NEV+1.
!
!  The efficiency of calculations depends critically on the combination of
!  NEV and NCV.  If NEV is large (greater than 10 say), you can use NCV=2*NEV+1
!  but for NEV small (less than 6) it will be inefficient to use NCV=2*NEV+1.
!  In complicated applications, you can start with NEV=2 and NCV=10. Otherwise,
!  it will iterate for a very long time.
!
!------------------------------------------------------------------------------
! Input/Output parameters.
!------------------------------------------------------------------------------
!
!  NRREC       Switch to indicate re-start from a previous solution.  Use
!              NRREC=0 for new solutions. In a re-start solution, NRREC
!              is the time index of the re-start NetCDF file assigned for
!              initialization.  If NRREC is negative (say NRREC=-1), the
!              model will re-start from the most recent time record. That
!              is, the initialization record is assigned internally.
!              Notice that it is also possible to re-start from a history
!              or time-averaged NetCDF file.  If a history file is used
!              for re-start, it must contains all the necessary primitive
!              variables at all levels.
!
!  LcycleRST   Logical switch (T/F) used to recycle time records in output
!              re-start file.  If TRUE,  only the latest two re-start time
!              records are maintained.  If FALSE, all re-start fields are
!              saved every NRST time-steps without recycling.  The re-start
!              fields are written at all levels in double precision.
!
!  NRST        Number of time-steps between writing of re-start fields.
!
!  NSTA        Number of time-steps between writing data into stations file.
!              Station data is written at all levels.
!
!  NFLT        Number of time-steps between writing data into floats file.
!
!  NINFO       Number of time-steps between print of single line information
!              to standard output.  It also determines the interval between
!              computation of global energy diagnostics.
!
!------------------------------------------------------------------------------
!  Output history and average files parameters.
!------------------------------------------------------------------------------
!
!  LDEFOUT     Logical switch (T/F) used to create new output files when
!              initializing from a re-start file, abs(NRREC) > 0.  If TRUE
!              and applicable, a new history, average, diagnostic and
!              station files are created during the initialization stage.
!              If FALSE and applicable, data is appended to existing
!              history, average, diagnostic and station files.  See also
!              parameters NDEFHIS, NDEFAVG and NDEFDIA below.
!
!  NHIS        Number of time-steps between writing fields into history file.
!
!  NDEFHIS     Number of time-steps between the creation of new history file.
!              If NDEFHIS=0, the model will only process one history file.
!              This feature is useful for long simulations when history files
!              get too large; it creates a new file every NDEFHIS time-steps.
!
!  NTSAVG      Starting time-step for the accumulation of output time-averaged
!              data.
!
!  NAVG        Number of time-steps between writing time-averaged data
!              into averages file.  Averaged date is written for all fields.
!
!  NDEFAVG     Number of time-steps between the creation of new average
!              file.  If NDEFAVG=0, the model will only process one average
!              file.  This feature is useful for long simulations when
!              average files get too large; it creates a new file every
!              NDEFAVG time-steps.
!
!  NTSDIA      Starting time-step for the accumulation of output time-averaged
!              diagnostics data.
!
!  NDIA        Number of time-steps between writing time-averaged diagnostics
!              data into diagnostics file.  Averaged date is written for all
!              fields.
!
!  NDEFDIA     Number of time-steps between the creation of new time-averaged
!              diagnostics file.  If NDEFDIA=0, the model will only process one
!              diagnostics file.  This feature is useful for long simulations
!              when diagnostics files get too large; it creates a new file
!              every NDEFDIA time-steps.
!
!------------------------------------------------------------------------------
!  Output tangent linear and adjoint model parameters.
!------------------------------------------------------------------------------
!
!  LcycleTLM   Logical switch (T/F) used to recycle time records in output
!              tangent linear file.  If TRUE, only the latest two time
!              records are maintained.  If FALSE, all tangent linear fields
!              are saved every NTLM time-steps without recycling.
!
!  NTLM        Number of time-steps between writing fields into tangent linear
!              model file.
!
!  NDEFTLM     Number of time-steps between the creation of new tangent linear
!              file. If NDEFTLM=0, the model will only process one tangent
!              linear file. This feature is useful for long simulations when
!              output NetCDF files get too large; it creates a new file every
!              NDEFTLM time-steps.
!
!  LcycleADJ   Logical switch (T/F) used to recycle time records in output
!              adjoint file.  If TRUE, only the latest two time records are
!              maintained.  If FALSE, all tangent linear fields re saved
!              every NADJ time-steps without recycling.
!
!  NADJ        Number of time-steps between writing fields into adjoint model
!              file.
!
!  NDEFADJ     Number of time-steps between the creation of new adjoint file.
!              If NDEFADJ=0, the model will only process one adjoint file.
!              This feature is useful for long simulations when output NetCDF
!              files get too large; it creates a new file every NDEFADJ
!              time-steps.
!
!  NSFF        Number of time-steps between 4DVAR adjustment of surface forcing
!              fluxes. In strong constraint 4DVAR, it is possible to adjust
!              surface forcing at other time intervals in addition to initial
!              time.  This parameter is used to store the appropriate number
!              of surface forcing records in the output history NetCDF files:
!              1+NTIMES/NSFF records. NSFF must be a factor of NTIMES or
!              greater than NTIMES. If NSFF > NTIMES, only one record is
!              stored in the NetCDF files and the adjustment is for constant
!              forcing with constant correction. This parameter is only
!              relevant in 4DVAR when activating either ADJUST_STFLUX or
!              ADJUST_WSTRESS.
!
!  NOBC        Number of time-steps between 4DVAR adjustment of open boundary
!              fields. In strong constraint 4DVAR, it is possible to adjust
!              open boundaries at other time intervals in addition to initial
!              time.  This parameter is used to store the appropriate number
!              of open boundary records in the output history NetCDF files:
!              1+NTIMES/NOBC records. NOBC must be a factor of NTIMES or
!              greater than NTIMES. If NOBC > NTIMES, only one record is
!              stored in the NetCDF files and the adjustment is for constant
!              forcing with constant correction. This parameter is only
!              relevant in 4DVAR when activating ADJUST_BOUNDARY.
!
!------------------------------------------------------------------------------
!  Generalized Stability Theory (GST) analysis parameters.
!------------------------------------------------------------------------------
!
!  LrstGST     Logical switch (TRUE/FALSE) to restart GST analysis. If TRUE,
!              the check pointing data is read in from the GST restart NetCDF
!              file.  If FALSE and applicable, the check pointing GST data is
!              saved and overwritten every NGST iterations of the algorithm.
!
!  MaxIterGST  Maximum number of GST algorithm iterations.
!
!  NGST        Number of GST iterations between storing of check pointing
!              data into NetCDF file. The restart data is always saved if
!              MaxIterGST is reached without convergence. It is also saved
!              when convergence is achieved. It is always a good idea to
!              save the check pointing data at regular intervals so there
!              is a mechanism to recover from an unexpected interruption
!              in this very expensive computation. The check pointing data
!              can be used also to recompute the Ritz vectors by changing
!              some of the parameters, like convergence criteria (Ritz_tol)
!              and number of Arnoldi iterations (iparam(3)).
!
!  Ritz_tol    Relative accuracy of the Ritz values computed in the GST
!              analysis.
!
!------------------------------------------------------------------------------
! Harmonic/Biharmonic horizontal diffusion for active tracers.
!------------------------------------------------------------------------------
!
!  TNU2        Lateral, harmonic, constant, mixing coefficient (m2/s) for
!              active (NAT) and inert (NPT) tracer variables.  If variable
!              horizontal diffusion is activated, TNU2 is the mixing
!              coefficient for the largest grid-cell in the domain.
!
!  TNU4        Lateral, biharmonic, constant, mixing coefficient (m4/s) for
!              active (NAT) and inert (NPT) tracer variables.  If variable
!              horizontal diffusion is activated, TNU4 is the mixing
!              coefficient for the largest grid-cell in the domain.
!
!------------------------------------------------------------------------------
! Harmonic/biharmonic horizontal viscosity coefficients.
!------------------------------------------------------------------------------
!
!  VISC2       Lateral, harmonic, constant, mixing coefficient (m2/s) for
!              momentum.  If variable horizontal viscosity is activated, UVNU2
!              is the mixing coefficient for the largest grid-cell in the
!              domain.
!
!  VISC4       Lateral, biharmonic, constant mixing coefficient (m4/s) for
!              momentum. If variable horizontal viscosity is activated, UVNU4
!              is the mixing coefficient for the largest grid-cell in the
!              domain.
!
!------------------------------------------------------------------------------
! Vertical mixing coefficients for active tracers.
!------------------------------------------------------------------------------
!
!  AKT_BAK     Background vertical mixing coefficient (m2/s) for active
!              (NAT) and inert (NPT) tracer variables.
!
!------------------------------------------------------------------------------
! Vertical mixing coefficient for momentum.
!------------------------------------------------------------------------------
!
!  AKV_BAK     Background vertical mixing coefficient (m2/s) for momentum.
!
!------------------------------------------------------------------------------
! Turbulent closure parameters.
!------------------------------------------------------------------------------
!
!  AKK_BAK     Background vertical mixing coefficient (m2/s) for turbulent
!              kinetic energy.
!
!  AKP_BAK     Background vertical mixing coefficient (m2/s) for turbulent
!              generic statistical field, "psi".
!
!  TKENU2      Lateral, harmonic, constant, mixing coefficient (m2/s) for
!              turbulent closure variables.
!
!  TKENU4      Lateral, biharmonic, constant mixing coefficient (m4/s) for
!              turbulent closure variables.
!
!------------------------------------------------------------------------------
! Generic length-scale turbulence closure parameters.
!------------------------------------------------------------------------------
!
!  GLS_P       Stability exponent (non-dimensional).
!
!  GLS_M       Turbulent kinetic energy exponent (non-dimensional).
!
!  GLS_N       Turbulent length scale exponent (non-dimensional).
!
!  GLS_Kmin    Minimum value of specific turbulent kinetic energy
!
!  GLS_Pmin    Minimum Value of dissipation.
!
! Closure independent constraint parameters (non-dimensional):
!
!  GLS_CMU0    Stability coefficient.
!
!  GLS_C1      Shear production coefficient.
!
!  GLS_C2      Dissipation coefficient.
!
!  GLS_C3M     Buoyancy production coefficient (minus).
!
!  GLS_C3P     Buoyancy production coefficient (plus).
!
!  GLS_SIGK    Constant Schmidt number (non-dimensional) for turbulent
!              kinetic energy diffusivity.
!
!  GLS_SIGP    Constant Schmidt number (non-dimensional) for turbulent
!              generic statistical field, "psi".
!
! Suggested values for various parameterizations:
!
!              k-kl         k-epsilon    k-omega      gen
!
!      GLS_P = 0.d0          3.0d0       -1.0d0        2.0d0
!      GLS_M = 1.d0          1.5d0        0.5d0        1.0d0
!      GLS_N = 1.d0         -1.0d0       -1.0d0       -0.67d0
!   GLS_Kmin = 5.0d-6        7.6d-6       7.6d-6       1.0d-8
!   GLS_Pmin = 5.0d-6        1.0d-12      1.0d-12      1.0d-8
!
!   GLS_CMU0 = 0.5544d0      0.5477d0     0.5477d0     0.5544d0
!     GLS_C1 = 0.9d0         1.44d0       0.555d0      1.00d0
!     GLS_C2 = 0.52d0        1.92d0       0.833d0      1.22d0
!    GLS_C3M = 2.5d0        -0.4d0       -0.6d0        0.1d0
!    GLS_C3P = 1.0d0         1.0d0        1.0d0        1.0d0
!   GLS_SIGK = 1.96d0        1.0d0        2.0d0        0.8d0
!   GLS_SIGP = 1.96d0        1.30d0       2.0d0        1.07d0
!
!------------------------------------------------------------------------------
! Constants used in the various formulations of surface turbulent kinetic
! energy flux in the GLS.
!------------------------------------------------------------------------------
!
!  CHARNOK_ALPHA   Charnok surface roughness,
!                    Zos:   (charnok_alpha * u_star**2) / g
!
!  ZOS_HSIG_ALPHA  Roughness from wave amplitude,
!                    Zos:   zos_hsig_alpha * Hsig
!
!  SZ_ALPHA        Surface flux from wave dissipation,
!                    flux:  dt * sz_alpha * Wave_dissip
!
!  CRGBAN_CW       Surface flux due to Craig and Banner wave breaking,
!                    flux:  dt * crgban_cw * u_star**3
!
!------------------------------------------------------------------------------
! Constants used in the computation of momentum stress.
!------------------------------------------------------------------------------
!
!  RDRG        Linear bottom drag coefficient (m/s).
!
!  RDRG2       Quadratic bottom drag coefficient.
!
!  Zob         Bottom roughness (m).
!
!  Zos         Surface roughness (m).
!
!------------------------------------------------------------------------------
! Height of atmospheric measurements for bulk fluxes parameterization.
!------------------------------------------------------------------------------
!
!  BLK_ZQ      Height (m) of surface air humidity measurement. Usually,
!                recorded at 10 m.
!
!  BLK_ZT      Height (m) of surface air temperature measurement. Usually,
!                recorded at 2 or 10 m.
!
!  BLK_ZW      Height (m) of surface winds measurement. Usually, recorded
!                at 10 m.
!
!------------------------------------------------------------------------------
! Wetting and drying parameters.
!------------------------------------------------------------------------------
!
!  DCRIT       Minimum depth (m) for wetting and drying.
!
!------------------------------------------------------------------------------
! Jerlow Water type.
!------------------------------------------------------------------------------
!
!  WTYPE       Jerlov water type: an integer value from 1 to 5.
!
!------------------------------------------------------------------------------
! Body-force parameters. Used when CPP option BODYFORCE is activated.
!------------------------------------------------------------------------------
!
!  LEVSFRC     Deepest level to apply surface momentum stress as a body-force.
!
!  LEVBFRC     Shallowest level to apply bottom momentum stress as a body-force.
!
!------------------------------------------------------------------------------
! Vertical S-coordinates parameters.
!------------------------------------------------------------------------------
!
! The parameters below must be consistent in all input fields associated with
! the vertical grid.  The same vertical grid transformation (depths) needs to
! be used when preparing initial conditions, boundary conditions, climatology,
! observations, and so on. Please check
!
!   https://www.myroms.org/wiki/index.php/Vertical_S-coordinate
!
! for details, rules and examples.
!
!
!  Vtransform  Vertical transformation equation:
!
!                (1) Original formulation (Shchepetkin and McWilliams, 2005),
!                    Vtransform=1 (In ROMS since 1999)
!
!                      z(x,y,s,t)=Zo(x,y,s)+zeta(x,y,t)*[1+Zo(x,y,s)/h(x,y)]
!
!                    where
!
!                      Zo(x,y,s)=hc*s+[h(x,y)-hc]*C(s)
!
!                (2) New formulation (A. Shchepetkin),
!                    Vtransform=2
!
!                      z(x,y,s,t)=zeta(x,y,t)*[zeta(x,y,t)+h(x,y)]*Zo(x,y,s)
!
!                    where
!
!                      Zo(x,y,s)=[hc*s(k)+h(x,y)*C(k)]/[hc+h(x,y)]
!
!  Vstretching Vertical stretching function, C(s):
!
!                (1) Original function (Song and Haidvogel, 1994),
!                    Vstretching=1
!
!                    C(s)=(1-theta_b)*[SINH(s*theta_s)/SINH(theta_s)]+
!                         theta_b*[-0.5+0.5*TANH(theta_s*(s+0.5))/
!                                           TANH(0.5*theta_s)]
!
!                (2) A. Shchepetkin function,
!                    Vstretching=2
!
!                      C(s)=Cweight*Csur(s)+(1-Cweight)*Cbot(s)
!
!                    where
!
!                      Csur(s)=[1-COSH(theta_s*s)]/[COSH(theta_s)-1]
!
!                      Cbot(s)=-1+[1-SINH(theta_b*(s+1))]/SINH(theta_b)
!
!                      Cweight=(s+1)**alpha*
!                              (1+(alpha/beta)*(1-(s+1)**beta))
!
!                (3) R. Geyer function for shallow sediment applications,
!                    Vstretching=3
!
!                      C(s)=Cweight*Cbot(s)+(1-Cweight)*Csur(s)
!
!                    where
!
!                      Csur(s)=-LOG(COSH(Hscale*ABS(s)** alpha))/
!                               LOG(COSH(Hscale))
!
!                      Cbot(s)= LOG(COSH(Hscale*(s+1)** beta))/
!                               LOG(COSH(Hscale))-1
!
!                      Cweight=0.5*(1-TANH(Hscale*(s+0.5))
!
!              Many other stretching functions (Vstretching>3) are possible
!              provided that:
!
!                * C(s) is a dimensionless, nonlinear, monotonic function.
!                * C(s) is a continuous differentiable function, or
!                  a diffentiable piecewise function with smooth transition.
!                * The stretching vertical coordinate ,s, is constrained
!                  between -1 <= s <= 0, with s=0 corresponding to the
!                  free-surface and s=-1 corresponding to the bathymetry.
!                * Similarly, the stretching function, C(s), is constrained
!                  between -1 <= C(s) <= 0, with C(0)=0 corresponding to the
!                  free-surface and C(-1)=-1 corresponding to the bathymetry.
!
!              These functions are coded in routine "Utility/set_scoord.F".
!
!  THETA_S     S-coordinate surface control parameter. The range of optimal
!              values depends on the vertical stretching function, C(s).
!
!  THETA_B     S-coordinate bottom  control parameter. The range of optimal
!              values depends on the vertical stretching function, C(s).
!
!  TCLINE      Critical depth (hc) in meters (positive) contolling the
!              stretching. It can be interpreted as the width of surface or
!              bottom boundary layer in which higher vertical resolution
!              (levels) is required during stretching.
!
!------------------------------------------------------------------------------
! Mean Density and background Brunt-Vaisala frequency.
!------------------------------------------------------------------------------
!
!  RHO0        Mean density (Kg/m3) used when the Boussinesq approximation
!              is inferred.
!
!  BVF_BAK     Background Brunt-Vaisala frequency squared (1/s2). Typical
!              values for the ocean range (as a function of depth) from
!              1.0E-4 to 1.0E-6.
!
!------------------------------------------------------------------------------
! Time Stamps.
!------------------------------------------------------------------------------
!
!  DSTART      Time stamp assigned to model initialization (days).  Usually
!              a Calendar linear coordinate, like modified Julian Day.  For
!              Example:
!
!                       Julian Day = 1  for  Nov 25, 0:0:0 4713 BCE
!              modified Julian Day = 1  for  May 24, 0:0:0 1968  CE GMT
!
!              It is called truncated or modified Julian day because an offset
!              of 2440000 needs to be added.
!
!  TIDE_START  Reference time origin for tidal forcing (days). This is the
!              time used when processing input tidal model data. It is needed
!              in routine "set_tides" to compute the correct phase lag with
!              respect ROMS/TOMS initialization time.
!
!  TIME_REF    Reference time (yyyymmdd.f) used to compute relative time:
!              elapsed time interval since reference-time.  The "units"
!              attribute takes the form "time-unit since reference-time".
!              This parameter also provides information about the calendar
!              used:
!
!              If TIME_REF = -2, model time and DSTART are in modified Julian
!              days units.  The "units" attribute is:
!
!                      'time-units since 1968-05-23 00:00:00 GMT'
!
!              If TIME_REF = -1, model time and DSTART are in a calendar
!              with 360 days in every year (30 days each month).  The "units"
!              attribute is:
!
!                      'time-units since 0001-01-01 00:00:00'
!
!              If TIME_REF = 0, model time and DSTART are in a common year
!              calendar with 365.25 days.  The "units" attribute is:
!
!                      'time-units since 0001-01-01 00:00:00'
!
!              If TIME_REF > 0, model time and DSTART are the elapsed time
!              units since specified reference time.  For example,
!              TIME_REF=20020115.5 will yield the following attribute:
!
!                      'time-units since 2002-01-15 12:00:00'
!
!------------------------------------------------------------------------------
! Nudging/relaxation time scales, inverse scales will be computed internally.
!------------------------------------------------------------------------------
!
! When passive/active open boundary conditions are activated, these nudging
! values correspond to the passive (outflow) nudging time scales.
!
!  TNUDG       Nudging time scale (days) for active tracer variables.
!              (1:NAT+NPT,1:Ngrids) values are expected.
!
!  ZNUDG       Nudging time scale (days) for free-surface.
!
!  M2NUDG      Nudging time scale (days) for 2D momentum.
!
!  M3NUDG      Nudging time scale (days) for 3D momentum.
!
!  OBCFAC      Factor between passive (outflow) and active (inflow) open
!              boundary conditions.  The nudging time scales for the
!              active (inflow) conditions are obtained by multiplying
!              the passive values by OBCFAC. If OBCFAC > 1, nudging on
!              inflow is stronger than on outflow (recommended).
!
!------------------------------------------------------------------------------
! Linear equation of State parameters.
!------------------------------------------------------------------------------
!
! Ignoring pressure, the linear equation of state is:
!
!              rho(:,:,:) = R0 - R0 * TCOEF * (t(:,:,:,:,itemp) - T0)
!                              + R0 * SCOEF * (t(:,:,:,:,isalt) - S0)
!
!              Typical values:     R0 = 1027.0  kg/m3
!                                  T0 = 10.0    Celsius
!                                  S0 = 35.0    PSU
!                               TCOEF = 1.7d-4  1/Celsius
!                               SCOEF = 7.6d-4  1/PSU
!
!  R0          Background density value (Kg/m3) used in Linear Equation of
!              State.
!
!  T0          Background potential temperature (Celsius) constant.
!
!  S0          Background salinity (PSU) constant.
!
!  TCOEF       Thermal expansion coefficient in Linear Equation of State.
!
!  SCOEF       Saline contraction coefficient in Linear Equation of State.
!
!------------------------------------------------------------------------------
! Slipperiness parameter.
!------------------------------------------------------------------------------
!
!  GAMMA2      Slipperiness variable, either 1.0 (free slip) or -1.0 (no slip).
!
!------------------------------------------------------------------------------
!  Adjoint sensitivity parameters.
!------------------------------------------------------------------------------
!
!  DstrS       Starting day for adjoint sensitivity forcing.
!
!  DendS       Ending   day for adjoint sensitivity forcing.
!
!              The adjoint forcing is applied at every time step according to
!              desired state functional stored in the adjoint sensitivity
!              NetCDF file. DstrS must be less than or equal to DendS. If both
!              values are zero, their values are reset internally to the full
!              range of the adjoint integration.
!
!  KstrS       Starting vertical level of the 3D adjoint state variables whose
!                sensitivity is required.
!  KendS       Ending   vertical level of the 3D adjoint state variables whose
!                sensitivity is required.
!
!  Lstate      Logical switches (TRUE/FALSE) to specify the adjoint state
!                variables whose sensitivity is required.
!
!                Lstate(isFsur):   Free-surface
!                Lstate(isUbar):   2D U-momentum
!                Lstate(isVbar):   2D V-momentum
!                Lstate(isUvel):   3D U-momentum
!                Lstate(isVvel):   3D V-momentum
!                Lstate(isTvar):   Traces (NT values expected)
!
!------------------------------------------------------------------------------
!  Stochastic optimals parameters.
!------------------------------------------------------------------------------
!
!  SO_decay    Stochastic optimals time decorrelation scale (days) assumed
!                for red noise processes.
!
!  SOstate     Logical switches (TRUE/FALSE) to specify the state surface
!                forcing variable whose stochastic optimals is required.
!
!                SOstate(isUstr):  surface u-stress
!                SOstate(isVstr):  surface v-stress
!                SOstate(isTsur):  surface tracer flux (NT values expected)
!
!  SO_sdev     Stochastic optimals surface forcing standard deviation for
!                dimensionalization.
!
!                SO_sdev(isUstr):  surface u-stress
!                SO_sdev(isVstr):  surface v-stress
!                SO_sdev(isTsur):  surface tracer flux (NT values expected)
!
!------------------------------------------------------------------------------
! Logical switches (T/F) to activate writing of fields into HISTORY file.
!------------------------------------------------------------------------------
!
!  Hout(idUvel)  Write out 3D U-velocity component.
!  Hout(idVvel)  Write out 3D V-velocity component.
!  Hout(idWvel)  Write out 3D W-velocity component.
!  Hout(idOvel)  Write out 3D omega vertical velocity.
!  Hout(idUbar)  Write out 2D U-velocity component.
!  Hout(idVbar)  Write out 2D V-velocity component.
!  Hout(idFsur)  Write out free-surface.
!  Hout(idBath)  Write out time-dependent bathymetry.
!
!  Hout(idTvar)  Write out active (NAT) tracers: temperature and salinity.
!
!  Hout(idUsms)  Write out surface U-momentum stress.
!  Hout(idVsms)  Write out surface V-momentum stress.
!  Hout(idUbms)  Write out bottom  U-momentum stress.
!  Hout(idVbms)  Write out bottom  V-momentum stress.
!
!  Hout(idUbrs)  Write out current-induced, U-momentum stress.
!  Hout(idVbrs)  Write out current-induced, V-momentum stress.
!  Hout(idUbws)  Write out wind-induced, bottom U-wave stress.
!  Hout(idVbws)  Write out wind-induced, bottom V-wave stress.
!  Hout(idUbcs)  Write out bottom maximum wave and current U-stress.
!  Hout(idVbcs)  Write out bottom maximum wave and current V-stress.
!
!  Hout(idUbot)  Write out wind-induced, bed wave orbital U-velocity.
!  Hout(idVbot)  Write out wind-induced, bed wave orbital V-velocity.
!  Hout(idUbur)  Write out bottom U-velocity above bed.
!  Hout(idVbvr)  Write out bottom V-velocity above bed.
!
!  Hout(idW2xx)  Write out 2D radiation stress, Sxx component.
!  Hout(idW2xy)  Write out 2D radiation stress, Sxy component.
!  Hout(idW2yy)  Write out 2D radiation stress, Syy component.
!  Hout(idU2rs)  Write out 2D U-radiation stress.
!  Hout(idV2rs)  Write out 2D V-radiation stress.
!  Hout(idU2Sd)  Write out 2D U-Stokes velocity.
!  Hout(idV2Sd)  Write out 2D V-Stokes velocity.
!
!  Hout(idW3xx)  Write out 3D radiation stress, Sxx component.
!  Hout(idW3xy)  Write out 3D radiation stress, Sxy component.
!  Hout(idW3yy)  Write out 3D radiation stress, Syy component.
!  Hout(idW3zx)  Write out 3D radiation stress, Szx component.
!  Hout(idW3zy)  Write out 3D radiation stress, Szy component.
!  Hout(idU3rs)  Write out 3D U-radiation stress.
!  Hout(idV3rs)  Write out 3D V-radiation stress.
!  Hout(idU3Sd)  Write out 3D U-Stokes velocity.
!  Hout(idV3Sd)  Write out 3D V-Stokes velocity.
!
!  Hout(idWamp)  Write out wave height.
!  Hout(idWlen)  Write out wave length.
!  Hout(idWdir)  Write out wave direction.
!
!  Hout(idTsur)  Write out surface net heat and salt flux
!  Hout(idLhea)  Write out latent heat flux.
!  Hout(idShea)  Write out sensible heat flux.
!  Hout(idLrad)  Write out long-wave radiation flux.
!  Hout(idSrad)  Write out short-wave radiation flux.
!  Hout(idEmPf)  Write out E-P flux.
!  Hout(idevap)  Write out evaporation rate.
!  Hout(idrain)  Write out precipitation rate.
!
!  Hout(idDano)  Write out density anomaly.
!  Hout(idVvis)  Write out vertical viscosity coefficient.
!  Hout(idTdif)  Write out vertical diffusion coefficient of temperature.
!  Hout(idSdif)  Write out vertical diffusion coefficient of salinity.
!  Hout(idHsbl)  Write out depth of oceanic surface boundary layer.
!  Hout(idHbbl)  Write out depth of oceanic bottom boundary layer.
!  Hout(idMtke)  Write out turbulent kinetic energy.
!  Hout(idMtls)  Write out turbulent kinetic energy times length scale.
!
!  Hout(inert)   Write out extra inert passive tracers.
!
!  Hout(idBott)  Write out exposed sediment layer properties, 1:MBOTP.
!
!------------------------------------------------------------------------------
! Generic User parameters.
!------------------------------------------------------------------------------
!
!  NUSER       Number of User parameters to consider (integer).
!  USER        Vector containing user parameters (real array). This array
!                is used with the SANITY_CHECK to test the correctness of
!                the tangent linear adjoint models.  It contains information
!                of the model variable and grid point to perturb:
!
!                INT(user(1)):  tangent state variable to perturb
!                INT(user(2)):  adjoint state variable to perturb
!                               [isFsur=1] free-surface
!                               [isUbar=2] 2D U-momentum
!                               [isVbar=3] 2D V-momentum
!                               [isUvel=4] 3D U-momentum
!                               [isVvel=5] 3D V-momentum
!                               [isTvar=6] First tracer (temperature)
!                               [   ...  ]
!                               [isTvar=?] Last tracer
!
!                INT(user(3)):  I-index of tangent variable to perturb
!                INT(user(4)):  I-index of adjoint variable to perturb
!                INT(user(5)):  J-index of tangent variable to perturb
!                INT(user(6)):  J-index of adjoint variable to perturb
!                INT(user(7)):  K-index of tangent variable to perturb, if 3D
!                INT(user(8)):  K-index of adjoint variable to perturb, if 3D
!
!                Set tangent and adjoint parameters to the same values
!                if perturbing and reporting the same variable.
!
!------------------------------------------------------------------------------
! I/O NetCDF files parameters.
!------------------------------------------------------------------------------
!
! NetCDF-4/HDF5 compression parameters for output files. This capability
! is used when both NETCDF4 and DEFLATE C-preprocessing options are
! activated. The user needs to compile with the NetCDF-4/HDF5 and MPI
! libraries. File deflation cannot be used in parallel I/O for writing
! because the compression makes it imposible for the HDF5 library
! to exactly map the data to the disk location.  For more information,
! check NetCDF official website: www.unidata.ucar.edu/software/netcdf.
!
! NC_SHUFFLE    Shuffle filter integer flag. If non-zero, turn on shuffle
!                 filter.
!
! NC_DEFLATE    Deflate filter integer flag, If non-zero, turn on deflate
!                 filter at the level specified by the NC_DLEVEL parameter.
!
! NC_DLEVEL     Deflate filter level parameter (integer). If NC_DEFLATE is
!                 non-zero, set the deflate level to this value. Must be
!                 between 0 and 9.
!
!------------------------------------------------------------------------------
! Input/output NetCDF file names (string with a maximum of eighty characters).
!------------------------------------------------------------------------------
!
!  GRDNAME     Input grid file name.
!  ININAME     Input nonlinear initial conditions file name. It can be a
!                re-start file.
!  IRPNAME     Input representer model initial conditions file name.
!  ITLNAME     Input tangent linear model initial conditions file name.
!  IADNAME     Input adjoint model initial conditions file name.
!  FRCNAME     Input forcing fields file name.
!  CLMNAME     Input climatology fields file name.
!  BRYNAME     Input open boundary data file name.
!  FWDNAME     Input forward solution fields file name.
!  ADSNAME     Input adjoint sensitivity functional file name.
!
!  GSTNAME     Output GST analysis re-start file name.
!  RSTNAME     Output re-start file name.
!  HISNAME     Output history file name.
!  TLFNAME     Output impulse forcing for tangent linear (TLM and RPM) models.
!  TLMNAME     Output tangent linear file name.
!  ADJNAME     Output adjoint file name.
!  AVGNAME     Output averages file name.
!  DIANAME     Output diagnostics file name.
!  STANAME     Output stations file name.
!  FLTNAME     Output floats file name.
!
!------------------------------------------------------------------------------
! Input ASCII parameters file names.
!------------------------------------------------------------------------------
!
!  APARNAM     Input assimilation parameters file name.
!  SPOSNAM     Input stations positions file name.
!  FPOSNAM     Input initial drifters positions file name.
!  BPARNAM     Input biological parameters file name.
!  SPARNAM     Input sediment transport parameters file name.
!  USRNAME     USER's input generic file name.
!
