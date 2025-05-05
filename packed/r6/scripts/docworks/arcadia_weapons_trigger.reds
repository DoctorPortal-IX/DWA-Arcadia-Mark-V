/* 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠉⠛⠶⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⢰⠞⠛⢷⠀⠈⠙⠳⠦⣄⣀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠘⠒⠒⠋⠀⣠⣤⡀⠀⠀⠉⠛⢶⣤⣀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠋⢀⡴⠖⠶⢦⠀⠀⠀⢧⣬⠇⣀⣠⠴⠞⠋⠁⡏
⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠀⠀⠘⠧⣤⣀⡼⠀⢀⣀⡤⠶⢛⣩⣤⣀⠀⢠⡞⠋
⠀⠀⠀⠀⠀⠀⣠⠞⣁⣀⠀⠀⠀⠀⢀⣠⡴⠖⠋⠁⠀⠀⣿⠁⠀⣹⠀⠈⢷⡄
⠀⠀⠀⠀⣠⠞⠁⠀⠷⠿⣀⣤⠴⠚⠉⠁⠀⠀⠀⠀⠀⠀⠈⠓⠒⠃⠀⠀⠀⡇
⠀⠀⣠⠞⣁⣠⡤⠶⠚⠛⠉⠀⠀⠀⣀⡀⠀⠀⠀⠀⢀⡤⠶⠶⠦⣄⠀⠀⠀⡇
⠀⡾⠛⠋⢉⣤⢤⣀⠀⠀⠀⠀⣰⠞⠉⠙⠳⡄⠀⠀⡟⠀⠀⠀⠀⢸⡆⠀⠀⡇
⠀⡇⠀⢰⡏⠀⠀⢹⡆⠀⠀⠀⡇⠀⠀⠀⠀⣿⠀⠀⠳⣄⡀⠀⢀⣸⠇⠀⠀⡇
⠀⡇⠀⠀⢷⣤⣤⠞⠁⠀⠀⠀⢷⣀⣀⣠⡴⠃⠀⠀⠀⠈⠉⠉⠉⠁⣀⣠⠴⠇
⠀⠻⣆⠀⠀⠀⠀⢀⣀⣤⣀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⢀⣠⡤⠖⠛⠉⠀⠀⠀
⠀⠀⡿⠀⠀⠀⢰⡏⠀⠀⢹⡆⠀⠀⠀⠀⠀⣀⣤⠶⠚⠉⠁⠀⠀⠀⠀⠀⠀⠀
⢰⠞⠁⠀⠀⠀⠀⢷⣄⣤⠞⠁⣀⣠⠴⠚⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⡆⠀⠀⠀⠀⠀⠀⣀⡤⠖⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⡇⠀⢀⣠⡴⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀


 __  __ _     _             _____ _              _     _       
 |  \/  (_)   | |           / ____| |            | |   | |      
 | \  / |_ ___| |_ ___ _ __| |    | |__   ___  __| | __| | __ _ 
 | |\/| | / __| __/ _ \ '__| |    | '_ \ / _ \/ _` |/ _` |/ _` |
 | |  | | \__ \ ||  __/ |  | |____| | | |  __/ (_| | (_| | (_| |
 |_|  |_|_|___/\__\___|_|   \_____|_| |_|\___|\__,_|\__,_|\__,_|
                                                                

*/

// 103 - no combat
// 100, 101 - combat

@wrapMethod(PlayerPuppet)
protected cb func OnDriverCombatWeaponTypeChange(newWeaponType: Int32) -> Bool {
  let vehicleObj: wref<VehicleObject>;
  VehicleComponent.GetVehicle(this.GetGame(), this, vehicleObj);

  if Equals(t"Vehicle.docworks_arcadia_mkv", vehicleObj.GetRecordID()) {
     FTLog(s"Vehicle.docworks_arcadia_mkv identified");
    if newWeaponType == 101 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 1;
      animFeature.duration = 1.3;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_left_window", animFeature);
        FTLog(s"window front left should be triggered");
      // AnimationControllerComponent
      //   .ApplyFeatureToReplicate(vehicleObj, n"seat_back_left_window", animFeature);
    } else if newWeaponType == 103 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 3;
      animFeature.duration = 1.5;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_left_window", animFeature);
        FTLog(s"window front left should be closed");
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_right_window", animFeature);
        FTLog(s"window front right should be closed");
    } else if newWeaponType == 100 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 1;
      animFeature.duration = 2.4;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_right_window", animFeature);
        FTLog(s"window front right should be triggered");
    }

  }
  return wrappedMethod(newWeaponType);
}

