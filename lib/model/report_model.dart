class ReportModel {
  String? cityJobRef,
      CustomerName,
      date,
      clientJob,
      clientName,
      siteContact,
      siteAddress,
      telNo,
      travelStartTime,
      travelFinishTime,
      travelTotalTime,
      jobDescription,fileName,
      engineerReport,extraText,partsUsedIfApplicable,customerComments,customerName,engineerName;
  bool ?isRepairCallOut,isService,isInstallation,isWarrenty,isRepair2;

  ReportModel(
      {this.date,this.extraText,
      this.jobDescription,
      this.CustomerName,
      this.cityJobRef,
      this.clientJob,
      this.clientName,
      this.engineerReport,
      this.siteAddress,
      this.siteContact,
      this.telNo,
      this.travelFinishTime,
      this.travelStartTime,this.partsUsedIfApplicable,this.customerComments,this.engineerName,this.customerName,
      this.travelTotalTime,this.fileName,this.isWarrenty,this.isInstallation,this.isRepairCallOut,this.isService,this.isRepair2});
}
