Citizen.CreateThread(function()
    while true do
      Wait(0)
      if Reticle.ReticleVehicle == true then   -- MIRA EN COCHE
       playerdist = GetEntityCoords()
       dist = GetDistanceBetweenCoords(playerdist - GetClosestVehicle())
      if dist < 20 then
    if IsPedInAnyVehicle(PlayerPedId(), false) then
          HideHudComponentThisFrame(14)
      else
          Wait(1500)
      end
    else
      Citizen.Wait(math.ceil(dist * 20))
    end
  else 
    Wait(1000000000)
  end
  end
  end)

  Citizen.CreateThread(function()
      while true do
        Wait(0)
        if IsPedArmed(PlayerPedId(), 4) or IsPedArmed(PlayerPedId(), 1) or IsPedArmed(PlayerPedId(), 2) then
          
          if Reticle.DisableRoll == true then --QUITAR EL RODAR
              DisableControlAction(25, 22)
            end
                    if Reticle.ReticleDisableOnMoving == true then  --QUITAR LA RETÍCULA CUANDO CAMINAS, PERO TENRLA SI APUNTAS Y NO TE MUEVES
                        if IsControlPressed(0, 25) and IsControlPressed(0, 32) or IsControlPressed(0, 25) and IsControlPressed(0, 33) or IsControlPressed(0, 25) and IsControlPressed(0, 34) or IsControlPressed(0, 25) and IsControlPressed(0, 35) then
                          HideHudComponentThisFrame(14)
                        end
                    end
                            if Reticle.Recoil == true then --AÑADIR RECOIL AL DISPARAR MIENTRAS TE MUEVES
                                if IsControlPressed(0, 25) and IsControlPressed(0, 32) or IsControlPressed(0, 25) and IsControlPressed(0, 33) or IsControlPressed(0, 25) and IsControlPressed(0, 34) or IsControlPressed(0, 25) and IsControlPressed(0, 35) then
                                    if IsPedShooting(PlayerPedId()) then
                                        RecoilThirdPersonMultiplier(1.0,0.5)
                                    end
                                end
                            end
        else
            Wait(1000)
        end
     end
  end)
  
  function RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)
      if GetFollowPedCamViewMode() ~= 4 then -- Not First Person
          local getwidthrecoil = GetGameplayCamRelativeHeading()
          local widthrecoil = math.random() + math.random() - math.random() - math.random()
          SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonMultiplier)
          
          local getheightrecoil = GetGameplayCamRelativePitch()
          local heightrecoil = math.random() + math.random()
          SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonMultiplier, 1.0)
          if IsControlPressed(0, 25) then --RMB aim
              local getwidthrecoil = GetGameplayCamRelativeHeading()
              local widthrecoil = math.random() + math.random() - math.random() - math.random()
              SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonAimingMultiplier)
              
              local getheightrecoil = GetGameplayCamRelativePitch()
              local heightrecoil = math.random() + math.random()
              SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonAimingMultiplier, 1.0)
          end
      end
  end