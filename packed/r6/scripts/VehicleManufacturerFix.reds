@replaceMethod(ScannervehicleGameController)
protected cb func OnVehicleManufacturerChanged(value: Variant) -> Bool {
    let vehicleManufacturer = FromVariant<ref<ScannerVehicleManufacturer>>(value);
    if IsDefined(vehicleManufacturer) {
        let iconRecord = TweakDBInterface.GetUIIconRecord(TDBID.Create("UIIcon." + vehicleManufacturer.GetVehicleManufacturer()));
        inkImageRef.SetAtlasResource(this.m_vehicleManufacturer, iconRecord.AtlasResourcePath());
        inkImageRef.SetTexturePart(this.m_vehicleManufacturer, iconRecord.AtlasPartName());
        this.m_isValidVehicleManufacturer = true;
    } else {
        this.m_isValidVehicleManufacturer = false;
    }
    this.UpdateGlobalVisibility();
}