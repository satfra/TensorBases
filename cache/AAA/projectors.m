(* Created with the Wolfram Language : www.wolfram.com *)
{((I/32)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (4*(TBsp[Global`p1, Global`p1] + TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (TBsp[Global`p1, Global`p1]^3*TBsp[Global`p2, Global`p2] + 
      2*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]^2*TBsp[Global`p1, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + 5*TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(4*TBsp[Global`p1, Global`p2]^3 + 
        12*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2] + 
        5*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2]^2 + 
        TBsp[Global`p2, Global`p2]^3))*
     (TBdeltaLorentz[Global`nui$2384, Global`rhoi$2387]*
       (TBvec[Global`p1, Global`mui$2381] + 
        2*TBvec[Global`p2, Global`mui$2381]) - 
      TBdeltaLorentz[Global`mui$2381, Global`rhoi$2387]*
       (2*TBvec[Global`p1, Global`nui$2384] + TBvec[Global`p2, 
         Global`nui$2384]) + TBdeltaLorentz[Global`mui$2381, Global`nui$2384]*
       (TBvec[Global`p1, Global`rhoi$2387] - TBvec[Global`p2, 
         Global`rhoi$2387]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2381]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2387]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2384] - (TBsp[Global`p1, Global`p1]^2 + 
      4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
      2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
      TBsp[Global`p2, Global`p2]^2)*(TBsp[Global`p1, Global`p1]^3*
       TBsp[Global`p2, Global`p2] + 2*TBsp[Global`p1, Global`p2]^2*
       TBsp[Global`p2, Global`p2]*(2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]^2*
       TBsp[Global`p1, Global`p2]*(2*TBsp[Global`p1, Global`p2] + 
        5*TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]*
       (4*TBsp[Global`p1, Global`p2]^3 + 12*TBsp[Global`p1, Global`p2]^2*
         TBsp[Global`p2, Global`p2] + 5*TBsp[Global`p1, Global`p2]*
         TBsp[Global`p2, Global`p2]^2 + TBsp[Global`p2, Global`p2]^3))*
     (TBvec[Global`p1, Global`mui$2401] + 
      2*TBvec[Global`p2, Global`mui$2401])*
     (2*TBvec[Global`p1, Global`nui$2404] + TBvec[Global`p2, 
       Global`nui$2404])*(TBvec[Global`p1, Global`rhoi$2407] - 
      TBvec[Global`p2, Global`rhoi$2407])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2401]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2407]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2404] + 6*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (TBsp[Global`p1, Global`p1]^3*TBsp[Global`p2, Global`p2] + 
      2*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]^2*TBsp[Global`p1, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + 5*TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(4*TBsp[Global`p1, Global`p2]^3 + 
        12*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2] + 
        5*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2]^2 + 
        TBsp[Global`p2, Global`p2]^3))*
     (TBdeltaLorentz[Global`nui$2424, Global`rhoi$2427]*
       TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$2421] + 
        2*TBvec[Global`p2, Global`mui$2421]) - 
      TBdeltaLorentz[Global`mui$2421, Global`rhoi$2427]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$2424] + 
        TBvec[Global`p2, Global`nui$2424]) + 
      TBdeltaLorentz[Global`mui$2421, Global`nui$2424]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(TBvec[Global`p1, Global`rhoi$2427] - 
        TBvec[Global`p2, Global`rhoi$2427]))*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2421]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2427]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2424] + 2*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2])*(TBsp[Global`p1, Global`p1] - 
      TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p1] + 
      TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     (-TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*
     (TBdeltaLorentz[Global`nui$2444, Global`rhoi$2447]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
       (TBvec[Global`p1, Global`mui$2441] + 
        2*TBvec[Global`p2, Global`mui$2441]) - 
      TBdeltaLorentz[Global`mui$2441, Global`rhoi$2447]*
       (-2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2])*
       (2*TBvec[Global`p1, Global`nui$2444] + TBvec[Global`p2, 
         Global`nui$2444]) + TBdeltaLorentz[Global`mui$2441, Global`nui$2444]*
       (-TBsp[Global`p1, Global`p1] + TBsp[Global`p2, Global`p2])*
       (TBvec[Global`p1, Global`rhoi$2447] - TBvec[Global`p2, 
         Global`rhoi$2447]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2441]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2447]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2444]))/(Global`Nc*(-1 + Global`Nc^2)*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2*(TBsp[Global`p1, Global`p1]^2 + 
     4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
      (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
     2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
     TBsp[Global`p2, Global`p2]^2)^2), 
 ((I/128)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (-4*(1 - Global`Nc^2)*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (TBsp[Global`p1, Global`p1]^3*TBsp[Global`p2, Global`p2] + 
      2*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]^2*TBsp[Global`p1, Global`p2]*
       (2*TBsp[Global`p1, Global`p2] + 5*TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(4*TBsp[Global`p1, Global`p2]^3 + 
        12*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2] + 
        5*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2]^2 + 
        TBsp[Global`p2, Global`p2]^3))*
     (-(TBdeltaLorentz[Global`nui$1931, Global`rhoi$1934]*
        (TBvec[Global`p1, Global`mui$1928] + 
         2*TBvec[Global`p2, Global`mui$1928])) + 
      TBdeltaLorentz[Global`mui$1928, Global`rhoi$1934]*
       (2*TBvec[Global`p1, Global`nui$1931] + TBvec[Global`p2, 
         Global`nui$1931]) + TBdeltaLorentz[Global`mui$1928, Global`nui$1931]*
       (-TBvec[Global`p1, Global`rhoi$1934] + TBvec[Global`p2, 
         Global`rhoi$1934]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$1928]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$1934]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$1931] + (1 - Global`Nc)*(1 + Global`Nc)*
     (TBsp[Global`p1, Global`p1]^2 + 4*TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*(2*TBsp[Global`p1, Global`p2] - 
        TBsp[Global`p2, Global`p2]) + 2*TBsp[Global`p1, Global`p2]*
       TBsp[Global`p2, Global`p2] + TBsp[Global`p2, Global`p2]^2)*
     (3*TBsp[Global`p1, Global`p1]^2*TBsp[Global`p2, Global`p2] + 
      2*TBsp[Global`p1, Global`p2]^2*(TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]*
       (2*TBsp[Global`p1, Global`p2]^2 + 8*TBsp[Global`p1, Global`p2]*
         TBsp[Global`p2, Global`p2] + 3*TBsp[Global`p2, Global`p2]^2))*
     (TBvec[Global`p1, Global`mui$1948] + 
      2*TBvec[Global`p2, Global`mui$1948])*
     (2*TBvec[Global`p1, Global`nui$1951] + TBvec[Global`p2, 
       Global`nui$1951])*(TBvec[Global`p1, Global`rhoi$1954] - 
      TBvec[Global`p2, Global`rhoi$1954])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$1948]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$1954]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$1951] + 2*(1 - Global`Nc)*(1 + Global`Nc)*
     (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p1]^2*
       TBsp[Global`p2, Global`p2] + 8*TBsp[Global`p1, Global`p2]^2*
       (TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(8*TBsp[Global`p1, Global`p2]^2 + 
        10*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
        TBsp[Global`p2, Global`p2]^2))*
     (-(TBdeltaLorentz[Global`nui$1971, Global`rhoi$1974]*
        TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$1968] + 
         2*TBvec[Global`p2, Global`mui$1968])) + 
      TBdeltaLorentz[Global`mui$1968, Global`rhoi$1974]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$1971] + 
        TBvec[Global`p2, Global`nui$1971]) + 
      TBdeltaLorentz[Global`mui$1968, Global`nui$1971]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(-TBvec[Global`p1, Global`rhoi$1974] + 
        TBvec[Global`p2, Global`rhoi$1974]))*Global`transProj[Global`p1, 
      Global`mu, Global`mui$1968]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$1974]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$1971] - 2*(1 - Global`Nc)*(1 + Global`Nc)*
     (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
     (TBsp[Global`p1, Global`p1] - TBsp[Global`p2, Global`p2])*
     (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
     (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*
     (-(TBdeltaLorentz[Global`nui$1991, Global`rhoi$1994]*
        (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
        (TBvec[Global`p1, Global`mui$1988] + 
         2*TBvec[Global`p2, Global`mui$1988])) + 
      TBdeltaLorentz[Global`mui$1988, Global`rhoi$1994]*
       (-2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2])*
       (2*TBvec[Global`p1, Global`nui$1991] + TBvec[Global`p2, 
         Global`nui$1991]) + TBdeltaLorentz[Global`mui$1988, Global`nui$1991]*
       (-TBsp[Global`p1, Global`p1] + TBsp[Global`p2, Global`p2])*
       (-TBvec[Global`p1, Global`rhoi$1994] + TBvec[Global`p2, 
         Global`rhoi$1994]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$1988]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$1994]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$1991]))/((-1 + Global`Nc)*Global`Nc*(1 + Global`Nc)*
   (-1 + Global`Nc^2)*(TBsp[Global`p1, Global`p2]^2 - 
     TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])^3*
   (TBsp[Global`p1, Global`p1]^2 + 4*TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*(2*TBsp[Global`p1, Global`p2] - 
      TBsp[Global`p2, Global`p2]) + 2*TBsp[Global`p1, Global`p2]*
     TBsp[Global`p2, Global`p2] + TBsp[Global`p2, Global`p2]^2)), 
 ((-1/64*I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (-12*(TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p1]^3*
       TBsp[Global`p2, Global`p2] + 2*TBsp[Global`p1, Global`p2]^2*
       TBsp[Global`p2, Global`p2]*(2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]^2*
       TBsp[Global`p1, Global`p2]*(2*TBsp[Global`p1, Global`p2] + 
        5*TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]*
       (4*TBsp[Global`p1, Global`p2]^3 + 12*TBsp[Global`p1, Global`p2]^2*
         TBsp[Global`p2, Global`p2] + 5*TBsp[Global`p1, Global`p2]*
         TBsp[Global`p2, Global`p2]^2 + TBsp[Global`p2, Global`p2]^3))*
     (TBdeltaLorentz[Global`nui$2399, Global`rhoi$2402]*
       (TBvec[Global`p1, Global`mui$2396] + 
        2*TBvec[Global`p2, Global`mui$2396]) - 
      TBdeltaLorentz[Global`mui$2396, Global`rhoi$2402]*
       (2*TBvec[Global`p1, Global`nui$2399] + TBvec[Global`p2, 
         Global`nui$2399]) + TBdeltaLorentz[Global`mui$2396, Global`nui$2399]*
       (TBvec[Global`p1, Global`rhoi$2402] - TBvec[Global`p2, 
         Global`rhoi$2402]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2396]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2402]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2399] - (TBsp[Global`p1, Global`p1]^2 + 
      4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
      2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
      TBsp[Global`p2, Global`p2]^2)*(TBsp[Global`p1, Global`p1]^2*
       TBsp[Global`p2, Global`p2] + 8*TBsp[Global`p1, Global`p2]^2*
       (TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(8*TBsp[Global`p1, Global`p2]^2 + 
        10*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
        TBsp[Global`p2, Global`p2]^2))*(TBvec[Global`p1, Global`mui$2416] + 
      2*TBvec[Global`p2, Global`mui$2416])*
     (2*TBvec[Global`p1, Global`nui$2419] + TBvec[Global`p2, 
       Global`nui$2419])*(TBvec[Global`p1, Global`rhoi$2422] - 
      TBvec[Global`p2, Global`rhoi$2422])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2416]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2422]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2419] + 2*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (2*TBsp[Global`p1, Global`p1]^3 + 3*TBsp[Global`p1, Global`p1]^2*
       (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]) + 
      3*TBsp[Global`p1, Global`p1]*(12*TBsp[Global`p1, Global`p2]^2 + 
        12*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
        TBsp[Global`p2, Global`p2]^2) + 2*(16*TBsp[Global`p1, Global`p2]^3 + 
        18*TBsp[Global`p1, Global`p2]^2*TBsp[Global`p2, Global`p2] + 
        3*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2]^2 + 
        TBsp[Global`p2, Global`p2]^3))*
     (TBdeltaLorentz[Global`nui$2439, Global`rhoi$2442]*
       TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$2436] + 
        2*TBvec[Global`p2, Global`mui$2436]) - 
      TBdeltaLorentz[Global`mui$2436, Global`rhoi$2442]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$2439] + 
        TBvec[Global`p2, Global`nui$2439]) + 
      TBdeltaLorentz[Global`mui$2436, Global`nui$2439]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(TBvec[Global`p1, Global`rhoi$2442] - 
        TBvec[Global`p2, Global`rhoi$2442]))*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2436]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2442]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2439] + 6*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2])*(TBsp[Global`p1, Global`p1] - 
      TBsp[Global`p2, Global`p2])*(2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (TBdeltaLorentz[Global`nui$2459, Global`rhoi$2462]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
       (TBvec[Global`p1, Global`mui$2456] + 
        2*TBvec[Global`p2, Global`mui$2456]) - 
      TBdeltaLorentz[Global`mui$2456, Global`rhoi$2462]*
       (-2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2])*
       (2*TBvec[Global`p1, Global`nui$2459] + TBvec[Global`p2, 
         Global`nui$2459]) + TBdeltaLorentz[Global`mui$2456, Global`nui$2459]*
       (-TBsp[Global`p1, Global`p1] + TBsp[Global`p2, Global`p2])*
       (TBvec[Global`p1, Global`rhoi$2462] - TBvec[Global`p2, 
         Global`rhoi$2462]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2456]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2462]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2459]))/(Global`Nc*(-1 + Global`Nc^2)*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2*(TBsp[Global`p1, Global`p1]^2 + 
     4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
      (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
     2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
     TBsp[Global`p2, Global`p2]^2)^2), 
 ((I/64)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (4*(TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
     (TBsp[Global`p1, Global`p1] - TBsp[Global`p2, Global`p2])*
     (TBsp[Global`p1, Global`p1] + TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (-(TBdeltaLorentz[Global`nui$2308, Global`rhoi$2311]*
        (TBvec[Global`p1, Global`mui$2305] + 
         2*TBvec[Global`p2, Global`mui$2305])) + 
      TBdeltaLorentz[Global`mui$2305, Global`rhoi$2311]*
       (2*TBvec[Global`p1, Global`nui$2308] + TBvec[Global`p2, 
         Global`nui$2308]) + TBdeltaLorentz[Global`mui$2305, Global`nui$2308]*
       (-TBvec[Global`p1, Global`rhoi$2311] + TBvec[Global`p2, 
         Global`rhoi$2311]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2305]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2311]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2308] - (TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2])*(TBsp[Global`p1, Global`p1] - 
      TBsp[Global`p2, Global`p2])*(2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p1]^2 + 
      4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
       (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
      2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
      TBsp[Global`p2, Global`p2]^2)*(TBvec[Global`p1, Global`mui$2325] + 
      2*TBvec[Global`p2, Global`mui$2325])*
     (2*TBvec[Global`p1, Global`nui$2328] + TBvec[Global`p2, 
       Global`nui$2328])*(TBvec[Global`p1, Global`rhoi$2331] - 
      TBvec[Global`p2, Global`rhoi$2331])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2325]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2331]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2328] - 6*(TBsp[Global`p1, Global`p1] + 
      2*TBsp[Global`p1, Global`p2])*(TBsp[Global`p1, Global`p1] - 
      TBsp[Global`p2, Global`p2])*(2*TBsp[Global`p1, Global`p2] + 
      TBsp[Global`p2, Global`p2])*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (-(TBdeltaLorentz[Global`nui$2348, Global`rhoi$2351]*
        TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$2345] + 
         2*TBvec[Global`p2, Global`mui$2345])) + 
      TBdeltaLorentz[Global`mui$2345, Global`rhoi$2351]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$2348] + 
        TBvec[Global`p2, Global`nui$2348]) + 
      TBdeltaLorentz[Global`mui$2345, Global`nui$2348]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(-TBvec[Global`p1, Global`rhoi$2351] + 
        TBvec[Global`p2, Global`rhoi$2351]))*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2345]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2351]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2348] + 2*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (2*TBsp[Global`p1, Global`p1]^3 + TBsp[Global`p1, Global`p1]^2*
       (6*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
      TBsp[Global`p1, Global`p1]*(4*TBsp[Global`p1, Global`p2]^2 - 
        4*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] - 
        TBsp[Global`p2, Global`p2]^2) + 2*TBsp[Global`p2, Global`p2]*
       (2*TBsp[Global`p1, Global`p2]^2 + 3*TBsp[Global`p1, Global`p2]*
         TBsp[Global`p2, Global`p2] + TBsp[Global`p2, Global`p2]^2))*
     (-(TBdeltaLorentz[Global`nui$2368, Global`rhoi$2371]*
        (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])*
        (TBvec[Global`p1, Global`mui$2365] + 
         2*TBvec[Global`p2, Global`mui$2365])) + 
      TBdeltaLorentz[Global`mui$2365, Global`rhoi$2371]*
       (-2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2])*
       (2*TBvec[Global`p1, Global`nui$2368] + TBvec[Global`p2, 
         Global`nui$2368]) + TBdeltaLorentz[Global`mui$2365, Global`nui$2368]*
       (-TBsp[Global`p1, Global`p1] + TBsp[Global`p2, Global`p2])*
       (-TBvec[Global`p1, Global`rhoi$2371] + TBvec[Global`p2, 
         Global`rhoi$2371]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2365]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2371]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2368]))/(Global`Nc*(-1 + Global`Nc^2)*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2*(TBsp[Global`p1, Global`p1]^2 + 
     4*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
      (2*TBsp[Global`p1, Global`p2] - TBsp[Global`p2, Global`p2]) + 
     2*TBsp[Global`p1, Global`p2]*TBsp[Global`p2, Global`p2] + 
     TBsp[Global`p2, Global`p2]^2)^2), 
 ((-1/8*I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
    TBsp[Global`p2, Global`p2])*
   (4*Global`longProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi$2034]*
     (-(TBdeltaLorentz[Global`nui$2031, Global`rhoi$2034]*
        (TBvec[Global`p1, Global`mui$2028] + 
         2*TBvec[Global`p2, Global`mui$2028])) + 
      TBdeltaLorentz[Global`mui$2028, Global`rhoi$2034]*
       (2*TBvec[Global`p1, Global`nui$2031] + TBvec[Global`p2, 
         Global`nui$2031]) + TBdeltaLorentz[Global`mui$2028, Global`nui$2031]*
       (-TBvec[Global`p1, Global`rhoi$2034] + TBvec[Global`p2, 
         Global`rhoi$2034]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2028]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2031] + (Global`longProj[-Global`p1 - Global`p2, Global`rho, 
       Global`rhoi$2134]*TBsp[Global`p1, Global`p2]*
      (TBvec[Global`p1, Global`mui$2128] + 
       2*TBvec[Global`p2, Global`mui$2128])*
      (2*TBvec[Global`p1, Global`nui$2131] + TBvec[Global`p2, 
        Global`nui$2131])*(TBvec[Global`p1, Global`rhoi$2134] - 
       TBvec[Global`p2, Global`rhoi$2134])*Global`transProj[Global`p1, 
       Global`mu, Global`mui$2128]*Global`transProj[Global`p2, Global`nu, 
       Global`nui$2131])/(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])))/
  (Global`Nc*(-1 + Global`Nc^2)*(TBsp[Global`p1, Global`p1] - 
     TBsp[Global`p2, Global`p2])^2), 
 ((-1/8*I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p2, Global`p2]*
   (4*Global`longProj[Global`p2, Global`nu, Global`nui$2088]*
     (-(TBdeltaLorentz[Global`nui$2088, Global`rhoi$2091]*
        (TBvec[Global`p1, Global`mui$2085] + 
         2*TBvec[Global`p2, Global`mui$2085])) + 
      TBdeltaLorentz[Global`mui$2085, Global`rhoi$2091]*
       (2*TBvec[Global`p1, Global`nui$2088] + TBvec[Global`p2, 
         Global`nui$2088]) + TBdeltaLorentz[Global`mui$2085, Global`nui$2088]*
       (-TBvec[Global`p1, Global`rhoi$2091] + TBvec[Global`p2, 
         Global`rhoi$2091]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2085]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2091] + (Global`longProj[Global`p2, Global`nu, 
       Global`nui$2188]*(TBsp[Global`p1, Global`p1] + 
       TBsp[Global`p1, Global`p2])*(TBvec[Global`p1, Global`mui$2185] + 
       2*TBvec[Global`p2, Global`mui$2185])*
      (2*TBvec[Global`p1, Global`nui$2188] + TBvec[Global`p2, 
        Global`nui$2188])*(TBvec[Global`p1, Global`rhoi$2191] - 
       TBvec[Global`p2, Global`rhoi$2191])*Global`transProj[Global`p1, 
       Global`mu, Global`mui$2185]*Global`transProj[-Global`p1 - Global`p2, 
       Global`rho, Global`rhoi$2191])/(-TBsp[Global`p1, Global`p2]^2 + 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])))/
  (Global`Nc*(-1 + Global`Nc^2)*(2*TBsp[Global`p1, Global`p2] + 
     TBsp[Global`p2, Global`p2])^2), 
 (I*Global`longProj[Global`p1, Global`mu, Global`mui$2002]*
   Global`longProj[Global`p2, Global`nu, Global`nui$2005]*
   TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]*
   (TBdeltaLorentz[Global`nui$2005, Global`rhoi$2008]*
     (TBvec[Global`p1, Global`mui$2002] + 
      2*TBvec[Global`p2, Global`mui$2002]) - 
    TBdeltaLorentz[Global`mui$2002, Global`rhoi$2008]*
     (2*TBvec[Global`p1, Global`nui$2005] + TBvec[Global`p2, 
       Global`nui$2005]) + TBdeltaLorentz[Global`mui$2002, Global`nui$2005]*
     (TBvec[Global`p1, Global`rhoi$2008] - TBvec[Global`p2, 
       Global`rhoi$2008]))*Global`transProj[-Global`p1 - Global`p2, 
    Global`rho, Global`rhoi$2008])/(Global`Nc*(-1 + Global`Nc^2)*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
    TBsp[Global`p2, Global`p2])*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 (I*Global`longProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi$2009]*
   Global`longProj[Global`p2, Global`nu, Global`nui$2006]*
   TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p2, Global`p2]*(TBsp[Global`p1, Global`p1] + 
    2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
   (TBdeltaLorentz[Global`nui$2006, Global`rhoi$2009]*
     (TBvec[Global`p1, Global`mui$2003] + 
      2*TBvec[Global`p2, Global`mui$2003]) - 
    TBdeltaLorentz[Global`mui$2003, Global`rhoi$2009]*
     (2*TBvec[Global`p1, Global`nui$2006] + TBvec[Global`p2, 
       Global`nui$2006]) + TBdeltaLorentz[Global`mui$2003, Global`nui$2006]*
     (TBvec[Global`p1, Global`rhoi$2009] - TBvec[Global`p2, 
       Global`rhoi$2009]))*Global`transProj[Global`p1, Global`mu, 
    Global`mui$2003])/(Global`Nc*(-1 + Global`Nc^2)*
   TBsp[Global`p1, Global`p1]*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 (I*Global`longProj[Global`p1, Global`mu, Global`mui$2023]*
   Global`longProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi$2029]*
   TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p1, Global`p1]*(TBsp[Global`p1, Global`p1] + 
    2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])*
   (TBdeltaLorentz[Global`nui$2026, Global`rhoi$2029]*
     (TBvec[Global`p1, Global`mui$2023] + 
      2*TBvec[Global`p2, Global`mui$2023]) - 
    TBdeltaLorentz[Global`mui$2023, Global`rhoi$2029]*
     (2*TBvec[Global`p1, Global`nui$2026] + TBvec[Global`p2, 
       Global`nui$2026]) + TBdeltaLorentz[Global`mui$2023, Global`nui$2026]*
     (TBvec[Global`p1, Global`rhoi$2029] - TBvec[Global`p2, 
       Global`rhoi$2029]))*Global`transProj[Global`p2, Global`nu, 
    Global`nui$2026])/(Global`Nc*(-1 + Global`Nc^2)*
   TBsp[Global`p2, Global`p2]*(-TBsp[Global`p1, Global`p2]^2 + 
    TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])), 
 ((I/32)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
    TBsp[Global`p2, Global`p2])*
   (4*Global`longProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi$2034]*
     TBsp[Global`p1, Global`p2]*(TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (-(TBdeltaLorentz[Global`nui$2031, Global`rhoi$2034]*
        (TBvec[Global`p1, Global`mui$2028] + 
         2*TBvec[Global`p2, Global`mui$2028])) + 
      TBdeltaLorentz[Global`mui$2028, Global`rhoi$2034]*
       (2*TBvec[Global`p1, Global`nui$2031] + TBvec[Global`p2, 
         Global`nui$2031]) + TBdeltaLorentz[Global`mui$2028, Global`nui$2031]*
       (-TBvec[Global`p1, Global`rhoi$2034] + TBvec[Global`p2, 
         Global`rhoi$2034]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2028]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2031] + Global`longProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2134]*(TBsp[Global`p1, Global`p2]^2 + 
      2*TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2])*
     (TBvec[Global`p1, Global`mui$2128] + 
      2*TBvec[Global`p2, Global`mui$2128])*
     (2*TBvec[Global`p1, Global`nui$2131] + TBvec[Global`p2, 
       Global`nui$2131])*(TBvec[Global`p1, Global`rhoi$2134] - 
      TBvec[Global`p2, Global`rhoi$2134])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2128]*Global`transProj[Global`p2, Global`nu, 
      Global`nui$2131]))/(Global`Nc*(-1 + Global`Nc^2)*
   (TBsp[Global`p1, Global`p1] - TBsp[Global`p2, Global`p2])^2*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2), 
 ((-1/32*I)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p2, Global`p2]*
   (4*Global`longProj[Global`p2, Global`nu, Global`nui$2036]*
     (TBsp[Global`p1, Global`p1] + TBsp[Global`p1, Global`p2])*
     (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*
     (-(TBdeltaLorentz[Global`nui$2036, Global`rhoi$2039]*
        (TBvec[Global`p1, Global`mui$2033] + 
         2*TBvec[Global`p2, Global`mui$2033])) + 
      TBdeltaLorentz[Global`mui$2033, Global`rhoi$2039]*
       (2*TBvec[Global`p1, Global`nui$2036] + TBvec[Global`p2, 
         Global`nui$2036]) + TBdeltaLorentz[Global`mui$2033, Global`nui$2036]*
       (-TBvec[Global`p1, Global`rhoi$2039] + TBvec[Global`p2, 
         Global`rhoi$2039]))*Global`transProj[Global`p1, Global`mu, 
      Global`mui$2033]*Global`transProj[-Global`p1 - Global`p2, Global`rho, 
      Global`rhoi$2039] - Global`longProj[Global`p2, Global`nu, 
      Global`nui$2136]*(3*TBsp[Global`p1, Global`p1]^2 + 
      TBsp[Global`p1, Global`p2]^2 + 2*TBsp[Global`p1, Global`p1]*
       (3*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2]))*
     (TBvec[Global`p1, Global`mui$2133] + 
      2*TBvec[Global`p2, Global`mui$2133])*
     (2*TBvec[Global`p1, Global`nui$2136] + TBvec[Global`p2, 
       Global`nui$2136])*(TBvec[Global`p1, Global`rhoi$2139] - 
      TBvec[Global`p2, Global`rhoi$2139])*Global`transProj[Global`p1, 
      Global`mu, Global`mui$2133]*Global`transProj[-Global`p1 - Global`p2, 
      Global`rho, Global`rhoi$2139]))/(Global`Nc*(-1 + Global`Nc^2)*
   (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])^2*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2), 
 ((I/32)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   (Global`longProj[Global`p1, Global`mu, Global`mui$2261]*
     (4*TBsp[Global`p1, Global`p2]^4 + 2*TBsp[Global`p1, Global`p1]^3*
       TBsp[Global`p2, Global`p2] - 4*TBsp[Global`p1, Global`p1]*
       TBsp[Global`p1, Global`p2]^2*(TBsp[Global`p1, Global`p2] + 
        3*TBsp[Global`p2, Global`p2]) + TBsp[Global`p1, Global`p1]^2*
       (TBsp[Global`p1, Global`p2]^2 + 10*TBsp[Global`p1, Global`p2]*
         TBsp[Global`p2, Global`p2] + 11*TBsp[Global`p2, Global`p2]^2))*
     (TBvec[Global`p1, Global`mui$2261] + 
      2*TBvec[Global`p2, Global`mui$2261])*
     (2*TBvec[Global`p1, Global`nui$2264] + TBvec[Global`p2, 
       Global`nui$2264])*(TBvec[Global`p1, Global`rhoi$2267] - 
      TBvec[Global`p2, Global`rhoi$2267])*Global`transProj[
      -Global`p1 - Global`p2, Global`rho, Global`rhoi$2267]*
     Global`transProj[Global`p2, Global`nu, Global`nui$2264] + 
    4*Global`longProj[Global`p1, Global`mu, Global`mui$2301]*
     (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2])*(2*TBsp[Global`p1, Global`p2]^2 - 
      TBsp[Global`p1, Global`p1]*(TBsp[Global`p1, Global`p2] + 
        3*TBsp[Global`p2, Global`p2]))*
     (-(TBdeltaLorentz[Global`nui$2304, Global`rhoi$2307]*
        TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$2301] + 
         2*TBvec[Global`p2, Global`mui$2301])) + 
      TBdeltaLorentz[Global`mui$2301, Global`rhoi$2307]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$2304] + 
        TBvec[Global`p2, Global`nui$2304]) + 
      TBdeltaLorentz[Global`mui$2301, Global`nui$2304]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(-TBvec[Global`p1, Global`rhoi$2307] + 
        TBvec[Global`p2, Global`rhoi$2307]))*Global`transProj[
      -Global`p1 - Global`p2, Global`rho, Global`rhoi$2307]*
     Global`transProj[Global`p2, Global`nu, Global`nui$2304]))/
  (Global`Nc*(-1 + Global`Nc^2)*TBsp[Global`p1, Global`p1]*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])^2*
   (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
      TBsp[Global`p2, Global`p2])^2), 
 (I*Global`longProj[Global`p1, Global`mu, Global`mui$2119]*
   Global`longProj[-Global`p1 - Global`p2, Global`rho, Global`rhoi$2125]*
   Global`longProj[Global`p2, Global`nu, Global`nui$2122]*
   TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   TBsp[Global`p1, Global`p1]*TBsp[Global`p2, Global`p2]*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
    TBsp[Global`p2, Global`p2])*(TBvec[Global`p1, Global`mui$2119] + 
    2*TBvec[Global`p2, Global`mui$2119])*
   (2*TBvec[Global`p1, Global`nui$2122] + TBvec[Global`p2, Global`nui$2122])*
   (TBvec[Global`p1, Global`rhoi$2125] - TBvec[Global`p2, Global`rhoi$2125]))/
  (Global`Nc*(-1 + Global`Nc^2)*(TBsp[Global`p1, Global`p1] + 
     2*TBsp[Global`p1, Global`p2])^2*
   (TBsp[Global`p1, Global`p1] - TBsp[Global`p2, Global`p2])^2*
   (2*TBsp[Global`p1, Global`p2] + TBsp[Global`p2, Global`p2])^2), 
 ((I/8)*TBF[Global`color, Global`a1, Global`a2, Global`a3]*
   ((Global`longProj[Global`p1, Global`mu, Global`mui$2409]*
      (-2*TBsp[Global`p1, Global`p2]^2 + TBsp[Global`p1, Global`p1]*
        (TBsp[Global`p1, Global`p2] + 3*TBsp[Global`p2, Global`p2]))*
      (TBvec[Global`p1, Global`mui$2409] + 
       2*TBvec[Global`p2, Global`mui$2409])*
      (2*TBvec[Global`p1, Global`nui$2412] + TBvec[Global`p2, 
        Global`nui$2412])*(TBvec[Global`p1, Global`rhoi$2415] - 
       TBvec[Global`p2, Global`rhoi$2415])*Global`transProj[
       -Global`p1 - Global`p2, Global`rho, Global`rhoi$2415]*
      Global`transProj[Global`p2, Global`nu, Global`nui$2412])/
     (TBsp[Global`p1, Global`p2]^2 - TBsp[Global`p1, Global`p1]*
       TBsp[Global`p2, Global`p2]) - 4*Global`longProj[Global`p1, Global`mu, 
      Global`mui$2449]*(-(TBdeltaLorentz[Global`nui$2452, Global`rhoi$2455]*
        TBsp[Global`p1, Global`p1]*(TBvec[Global`p1, Global`mui$2449] + 
         2*TBvec[Global`p2, Global`mui$2449])) + 
      TBdeltaLorentz[Global`mui$2449, Global`rhoi$2455]*
       TBsp[Global`p2, Global`p2]*(2*TBvec[Global`p1, Global`nui$2452] + 
        TBvec[Global`p2, Global`nui$2452]) + 
      TBdeltaLorentz[Global`mui$2449, Global`nui$2452]*
       (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2] + 
        TBsp[Global`p2, Global`p2])*(-TBvec[Global`p1, Global`rhoi$2455] + 
        TBvec[Global`p2, Global`rhoi$2455]))*Global`transProj[
      -Global`p1 - Global`p2, Global`rho, Global`rhoi$2455]*
     Global`transProj[Global`p2, Global`nu, Global`nui$2452]))/
  (Global`Nc*(-1 + Global`Nc^2)*TBsp[Global`p1, Global`p1]*
   (TBsp[Global`p1, Global`p1] + 2*TBsp[Global`p1, Global`p2])^2)}
