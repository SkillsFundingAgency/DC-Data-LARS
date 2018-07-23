using System.Data.Entity;

namespace ESFA.DC.Data.LARS.Model.Interfaces
{
    public interface ILARS
    {
        DbSet<LARS_AnnualValue> LARS_AnnualValue { get; set; }
        DbSet<LARS_ApprenticeshipFunding> LARS_ApprenticeshipFunding { get; set; }
        DbSet<LARS_DataGeneration> LARS_DataGeneration { get; set; }
        DbSet<LARS_CareerLearningPilot> LARS_CareerLearningPilot { get; set; }
        DbSet<LARS_Framework> LARS_Framework { get; set; }
        DbSet<LARS_FrameworkAims> LARS_FrameworkAims { get; set; }
        DbSet<LARS_FrameworkCmnComp> LARS_FrameworkCmnComp { get; set; }
        DbSet<LARS_FrameworkMetaData> LARS_FrameworkMetaData { get; set; }
        DbSet<LARS_Funding> LARS_Funding { get; set; }
        DbSet<LARS_LearningDelivery> LARS_LearningDelivery { get; set; }
        DbSet<LARS_LearningDeliveryCategory> LARS_LearningDeliveryCategory { get; set; }
        DbSet<LARS_Section96> LARS_Section96 { get; set; }
        DbSet<LARS_Standard> LARS_Standard { get; set; }
        DbSet<LARS_StandardAims> LARS_StandardAims { get; set; }
        DbSet<LARS_StandardCommonComponent> LARS_StandardCommonComponent { get; set; }
        DbSet<LARS_StandardFunding> LARS_StandardFunding { get; set; }
        DbSet<LARS_StandardMetaData> LARS_StandardMetaData { get; set; }
        DbSet<LARS_StandardPdfLink> LARS_StandardPdfLink { get; set; }
        DbSet<LARS_StandardValidity> LARS_StandardValidity { get; set; }
        DbSet<LARS_SupersedingAims> LARS_SupersedingAims { get; set; }
        DbSet<LARS_SupersedingFrameworks> LARS_SupersedingFrameworks { get; set; }
        DbSet<LARS_UnitQualificationRelationship> LARS_UnitQualificationRelationship { get; set; }
        DbSet<LARS_Validity> LARS_Validity { get; set; }
        DbSet<LARS_Version> LARS_Version { get; set; }
        DbSet<TBStandardLookup> TBStandardLookups { get; set; }
        DbSet<TBStandardLookupVersion> TBStandardLookupVersions { get; set; }
        DbSet<Current_Version> Current_Version { get; set; }
    }
}
