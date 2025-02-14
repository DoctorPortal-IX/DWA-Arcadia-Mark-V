
@wrapMethod(PlayerPuppet)
protected cb func OnDriverCombatWeaponTypeChange(newWeaponType: Int32) -> Bool {
  // LogChannel(n"DEBUG", s"!!!! in OnDriverCombatWeaponTypeChange!!!!!! \(newWeaponType)");
  let vehicleObj: wref<VehicleObject>;
  let vehicleRecord: ref<Vehicle_Record>;
  VehicleComponent.GetVehicle(this.GetGame(), this, vehicleObj);
  if !IsDefined(vehicleObj) {
    return wrappedMethod(newWeaponType);
  }
  VehicleComponent.GetVehicleRecord(vehicleObj, vehicleRecord);
  let vehicleModelName: String = StrReplaceAll(
    s"\(vehicleRecord.Manufacturer().EnumName()) \(GetLocalizedTextByKey(vehicleRecord.DisplayName()))",
    "\u{a0}",
    " "
  );
  // LogChannel(n"DEBUG", s"!!!! Arcadia CHECK!!! model -> \(vehicleModelName)");
  let customVehicleCheck_one: String = "DocWorks Quadra Turbo-R 'Arcadia' Mk. Vb";
  if Equals(customVehicleCheck_one, vehicleModelName) {
    if newWeaponType == 101 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 1;
      animFeature.duration = 1.3;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_right_window", animFeature);
      // AnimationControllerComponent
      //   .ApplyFeatureToReplicate(vehicleObj, n"seat_front_left_window", animFeature);
    } else if newWeaponType == 103 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 3;
      animFeature.duration = 1.5;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_right_window", animFeature);
     // AnimationControllerComponent
     //   .ApplyFeatureToReplicate(vehicleObj, n"seat_front_left_window", animFeature);
    } else if newWeaponType == 100 {
      let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
      animFeature.state = 1;
      animFeature.duration = 2.4;
      AnimationControllerComponent
        .ApplyFeatureToReplicate(vehicleObj, n"seat_front_right_window", animFeature);
    }

  }
  wrappedMethod(newWeaponType);
}

// 103 - no combat
// 100, 101 - combat. 100 is rockets