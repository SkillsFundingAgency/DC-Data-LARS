﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LARSConnectionString : DbContext
    {
        public LARSConnectionString()
            : base("name=LARSConnectionString")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<LARS_AnnualValue> LARS_AnnualValue { get; set; }
        public virtual DbSet<LARS_ApprenticeshipFunding> LARS_ApprenticeshipFunding { get; set; }
        public virtual DbSet<LARS_DataGeneration> LARS_DataGeneration { get; set; }
        public virtual DbSet<LARS_Framework> LARS_Framework { get; set; }
        public virtual DbSet<LARS_FrameworkAims> LARS_FrameworkAims { get; set; }
        public virtual DbSet<LARS_FrameworkCmnComp> LARS_FrameworkCmnComp { get; set; }
        public virtual DbSet<LARS_FrameworkMetaData> LARS_FrameworkMetaData { get; set; }
        public virtual DbSet<LARS_Funding> LARS_Funding { get; set; }
        public virtual DbSet<LARS_LearningDelivery> LARS_LearningDelivery { get; set; }
        public virtual DbSet<LARS_LearningDeliveryCategory> LARS_LearningDeliveryCategory { get; set; }
        public virtual DbSet<LARS_Section96> LARS_Section96 { get; set; }
        public virtual DbSet<LARS_Standard> LARS_Standard { get; set; }
        public virtual DbSet<LARS_StandardAims> LARS_StandardAims { get; set; }
        public virtual DbSet<LARS_StandardCommonComponent> LARS_StandardCommonComponent { get; set; }
        public virtual DbSet<LARS_StandardFunding> LARS_StandardFunding { get; set; }
        public virtual DbSet<LARS_StandardMetaData> LARS_StandardMetaData { get; set; }
        public virtual DbSet<LARS_StandardPdfLink> LARS_StandardPdfLink { get; set; }
        public virtual DbSet<LARS_StandardValidity> LARS_StandardValidity { get; set; }
        public virtual DbSet<LARS_SupersedingAims> LARS_SupersedingAims { get; set; }
        public virtual DbSet<LARS_SupersedingFrameworks> LARS_SupersedingFrameworks { get; set; }
        public virtual DbSet<LARS_UnitQualificationRelationship> LARS_UnitQualificationRelationship { get; set; }
        public virtual DbSet<LARS_Validity> LARS_Validity { get; set; }
        public virtual DbSet<LARS_Version> LARS_Version { get; set; }
        public virtual DbSet<TBStandardLookup> TBStandardLookups { get; set; }
        public virtual DbSet<TBStandardLookupVersion> TBStandardLookupVersions { get; set; }
    }
}
