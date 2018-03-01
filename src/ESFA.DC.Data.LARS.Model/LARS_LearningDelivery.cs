//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ESFA.DC.Data.LARS.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class LARS_LearningDelivery
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LARS_LearningDelivery()
        {
            this.LARS_FrameworkAims = new HashSet<LARS_FrameworkAims>();
            this.LARS_LearningDeliveryCategory = new HashSet<LARS_LearningDeliveryCategory>();
            this.LARS_Section96 = new HashSet<LARS_Section96>();
            this.LARS_StandardAims = new HashSet<LARS_StandardAims>();
            this.LARS_SupersedingAims = new HashSet<LARS_SupersedingAims>();
            this.LARS_SupersedingAims1 = new HashSet<LARS_SupersedingAims>();
            this.LARS_Validity = new HashSet<LARS_Validity>();
        }
    
        public string LearnAimRef { get; set; }
        public System.DateTime EffectiveFrom { get; set; }
        public Nullable<System.DateTime> EffectiveTo { get; set; }
        public string LearnAimRefTitle { get; set; }
        public string LearnAimRefType { get; set; }
        public string NotionalNVQLevel { get; set; }
        public string NotionalNVQLevelv2 { get; set; }
        public string AwardOrgAimRef { get; set; }
        public Nullable<System.DateTime> CertificationEndDate { get; set; }
        public Nullable<System.DateTime> OperationalStartDate { get; set; }
        public Nullable<System.DateTime> OperationalEndDate { get; set; }
        public string EnglandFEHEStatus { get; set; }
        public Nullable<int> CreditBasedFwkType { get; set; }
        public Nullable<int> QltyAssAgencyType { get; set; }
        public Nullable<int> OfQualGlhMin { get; set; }
        public Nullable<int> OfQualGlhMax { get; set; }
        public string DiplomaLinesOfLearning { get; set; }
        public Nullable<int> FrameworkCommonComponent { get; set; }
        public Nullable<int> LTRCPWithProviderUpliftFactor { get; set; }
        public string EntrySubLevel { get; set; }
        public string SuccessRateMapCode { get; set; }
        public Nullable<int> AccreditiedNotDfESApproved { get; set; }
        public Nullable<int> AccreditiedMayPossDfESApproved { get; set; }
        public Nullable<int> JointInvestmentProgrammeOnly { get; set; }
        public Nullable<int> OLASSOnly { get; set; }
        public Nullable<int> UnemployedOnly { get; set; }
        public Nullable<int> IndependentLivingSkills { get; set; }
        public Nullable<int> AdditionalOrSpecialistLearning { get; set; }
        public Nullable<int> EnglPrscID { get; set; }
        public Nullable<int> Vocational { get; set; }
        public string AwardOrgCode { get; set; }
        public string UnitType { get; set; }
        public string LearningDeliveryGenre { get; set; }
        public Nullable<int> ApprovedEmployerSchemeFramework { get; set; }
        public Nullable<int> FrameworkCompletionClassCode { get; set; }
        public Nullable<int> OfQualOfferedEngland { get; set; }
        public string OfqualPurpose { get; set; }
        public string OfqualSubPurpose { get; set; }
        public Nullable<System.DateTime> RgltnStartDate { get; set; }
        public string SourceQualType { get; set; }
        public string SourceSystemRef { get; set; }
        public string SourceURLRef { get; set; }
        public Nullable<int> SourceURLLinkType { get; set; }
        public Nullable<int> OccupationalIndicator { get; set; }
        public Nullable<int> AccessHEIndicator { get; set; }
        public Nullable<int> KeySkillsIndicator { get; set; }
        public Nullable<int> FunctionalSkillsIndicator { get; set; }
        public Nullable<int> GCEIndicator { get; set; }
        public Nullable<int> GCSEIndicator { get; set; }
        public Nullable<int> ASLevelIndicator { get; set; }
        public Nullable<int> A2LevelIndicator { get; set; }
        public Nullable<int> ALevelIndicator { get; set; }
        public Nullable<int> QCFIndicator { get; set; }
        public Nullable<int> QCFDiplomaIndicator { get; set; }
        public Nullable<int> QCFCertificateIndicator { get; set; }
        public Nullable<int> EFAEnglishGCSE { get; set; }
        public Nullable<int> EFAMathsGCSE { get; set; }
        public Nullable<int> EFACOFType { get; set; }
        public Nullable<int> SFAFundedIndicator { get; set; }
        public Nullable<int> DanceAndDramaIndicator { get; set; }
        public Nullable<int> AvailabiltyStatus { get; set; }
        public string Note { get; set; }
        public string LearnDirectClassSystemCode1 { get; set; }
        public string LearnDirectClassSystemCode2 { get; set; }
        public string LearnDirectClassSystemCode3 { get; set; }
        public Nullable<int> RegulatedCreditValue { get; set; }
        public Nullable<decimal> SectorSubjectAreaTier1 { get; set; }
        public Nullable<decimal> SectorSubjectAreaTier2 { get; set; }
        public Nullable<int> MI_NotionalNVQLevel { get; set; }
        public Nullable<decimal> MI_NotionalNVQLevelv2 { get; set; }
        public Nullable<int> GuidedLearningHours { get; set; }
        public Nullable<int> DirectStudyHours { get; set; }
        public Nullable<int> DedicatedAssessmentHours { get; set; }
        public Nullable<int> TotalQualificationTime { get; set; }
        public System.DateTime Created_On { get; set; }
        public string Created_By { get; set; }
        public System.DateTime Modified_On { get; set; }
        public string Modified_By { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_FrameworkAims> LARS_FrameworkAims { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_LearningDeliveryCategory> LARS_LearningDeliveryCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_Section96> LARS_Section96 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_StandardAims> LARS_StandardAims { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_SupersedingAims> LARS_SupersedingAims { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_SupersedingAims> LARS_SupersedingAims1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_Validity> LARS_Validity { get; set; }
    }
}
